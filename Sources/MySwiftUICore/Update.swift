private import os.signpost
private import os.log
private import _MySwiftUIShims
private import Foundation
private import AttributeGraph
private import _DarwinFoundation3._stdlib

fileprivate let lockAssertionsAreEnabled: Bool = {
    guard let value = unsafe getenv("SWIFTUI_ASSERT_LOCKS") else {
        return false
    }
    
    return unsafe atoi(value) != 0
}()

package enum Update {
    private static let _lock = MovableLock.create()
    @safe private static nonisolated(unsafe) var depth: Int = 0
    private static nonisolated(unsafe) var actions: [Update.Action] = []
    static nonisolated(unsafe) let traceHost: AnyObject = TraceHost()
    
    package static var canDispatch: Bool {
        fatalError("TODO")
    }
    
    @discardableResult
    package static func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, _ action: @escaping () -> ()) -> UInt32 {
        Update.begin()
        let action = Update.Action(reason: reason, thunk: action)
        unsafe actions.append(action)
        Update.end()
        return action.actionID
    }
    
    package static func begin() {
        Update._lock.lock()
        Update.depth += 1
        
        guard Update.depth == 1 else {
            return
        }
        
        let traceHost = unsafe Update.traceHost
        Signpost.viewHost.traceEvent(
            type: .begin,
            object: traceHost,
            "ViewHost: (%p) update began PlatformHost [ %p ]",
            args: [0, UInt(bitPattern: ObjectIdentifier(traceHost))]
        )
    }
    
    package static var threadIsUpdating: Bool {
        fatalError("TODO")
    }
    
    @inlinable
    package static func ensure<T>(_ handler: () throws -> T) rethrows -> T {
        return try Update.locked { 
            Update.begin()
            defer {
                Update.end()
            }
            return try handler()
        }
    }
    
    @inlinable
    package static func locked<T>(_ handler: () throws -> T) rethrows -> T {
        Update._lock.lock()
        defer {
            Update._lock.unlock()
        }
        return try handler()
    }
    
    package static var isOwner: Bool {
        return Update._lock.isOwner()
    }
    
    package static func end() {
        if Update.depth == 1 {
            Update.dispatchActions()
            
            let traceHost = unsafe Update.traceHost
            Signpost.viewHost.traceEvent(
                type: .end,
                object: traceHost,
                "ViewHost: (%p) update ended PlatformHost [ %p ]",
                args: [0, UInt(bitPattern: ObjectIdentifier(traceHost))]
            )
        }
        
        Update.depth -= 1
        Update._lock.unlock()
    }
    
    @inlinable
    package static func lock() {
        Update._lock.lock()
    }
    
    @inlinable
    package static func unlock() {
        Update._lock.unlock()
    }
    
    package static func dispatchImmediately<T>(reason: CustomEventTrace.ActionEventType.Reason?, _ handler: () -> T) -> T {
        Update.begin()
        
        let actionID = Update.Action.nextActionID
        Update.Action.nextActionID &+= 2
        
        defer {
            CustomEventTrace.finishAction(actionID, reason)
            Update.end()
        }
        
        CustomEventTrace.startAction(actionID, nil)
        return handler()
    }
    
    @inlinable
    package static func syncMain(_ handler: @MainActor () -> Void) {
        if Thread.isMainThread {
            MainActor.assumeIsolated {
                handler()
            }
        } else {
            withoutActuallyEscaping(handler) { escapingClosure in
                final class Context {
                    let current = Subgraph.current
                    let currentRuleContext = AnyRuleContext(attribute: AnyOptionalAttribute.current.identifier)
                    let block: @MainActor () -> Void
                    
                    init(block: @escaping @MainActor () -> Void) {
                        self.block = block
                    }
                }
                let context = unsafe Unmanaged.passRetained(Context(block: escapingClosure))
                
                unsafe Update._lock.syncMain(context: context.toOpaque()) { pointer in
                    let context = unsafe Unmanaged<Context>.fromOpaque(pointer)
                    let current = Subgraph.current
                    Subgraph.current = unsafe context.takeUnretainedValue().current
                    
                    unsafe context.takeUnretainedValue().currentRuleContext.update {
                        unsafe context.takeUnretainedValue().block()
                    }
                    
                    Subgraph.current = current
                    unsafe context.release()
                }
            }
        }
    }
    
    package static func wait() {
        fatalError("TODO")
    }
    
    package static func broadcast() {
        fatalError("TODO")
    }
    
    package static var isActive: Bool {
        fatalError("TODO")
    }
    
    package static func assertIsActive() {
        fatalError("TODO")
    }
    
    package static func assertIsLocked() {
        if lockAssertionsAreEnabled {
            if !Update._lock.isOwner() {
                fatalError("SwiftUI is active without having taken its own lock - missing Update.ensure()?")
            }
        }
    }
    
    package static func dispatchActions() {
        Update.assertIsLocked()
        onMainThread {
            let traceHost = unsafe Update.traceHost
            Signpost.postUpdateActions.traceInterval(object: traceHost, nil) { 
                Update.begin()
                for action in unsafe Update.actions {
                    action()
                }
                unsafe Update.actions.removeAll()
                Update.end()
            }
        }
    }
}

extension Update {
    fileprivate class TraceHost {
    }
}

extension Update {
    struct Action {
        @safe static nonisolated(unsafe) var nextActionID: UInt32 = 1
        private let reason: CustomEventTrace.ActionEventType.Reason?
        private let thunk: () -> Void
        fileprivate let actionID: UInt32
        
        init(reason: CustomEventTrace.ActionEventType.Reason?, thunk: @escaping () -> Void) {
            self.reason = reason
            self.thunk = thunk
            
            let w23 = (Update.Action.nextActionID &>> 1) + 1
            Update.Action.nextActionID &+= 2
            self.actionID = w23
            
            CustomEventTrace.enqueueAction(w23, reason)
        }
        
        func callAsFunction() {
            let reason = reason
            let actionID = actionID
            
            CustomEventTrace.startAction(actionID, reason)
            thunk()
            CustomEventTrace.finishAction(actionID, reason)
        }
    }
}

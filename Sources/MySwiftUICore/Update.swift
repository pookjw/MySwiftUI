#warning("TODO")
private import os.signpost
private import os.log
private import _MySwiftUIShims
private import Foundation
private import AttributeGraph

package enum Update {
    private static let _lock = MovableLock.create()
    private static nonisolated(unsafe) var depth: Int = 0
    private static nonisolated(unsafe) var actions: [Update.Action] = []
    static nonisolated(unsafe) let traceHost: AnyObject = TraceHost()
    
    package static var canDispatch: Bool {
        fatalError("TODO")
    }
    
    package static func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, _ action: @escaping () -> ()) -> UInt32 {
        Update.begin()
        let action = Update.Action(reason: reason, thunk: action)
        actions.append(action)
        Update.end()
        return action.actionID
    }
    
    package static func begin() {
        Update._lock.lock()
        Update.depth += 1
        
        guard Update.depth == 1 else {
            return
        }
        
        let traceHost = Update.traceHost
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
    
    package static func ensure<T>(_ handler: () throws -> T) rethrows -> T {
        Update._lock.lock()
        defer {
            Update._lock.unlock()
        }
        return try handler()
    }
    
    package static func locked<T>(_ handler: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    package static var isOwner: Bool {
        fatalError("TODO")
    }
    
    package static func end() {
        if Update.depth == 1 {
            let traceHost = Update.traceHost
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
    
    package static func lock() {
        Update._lock.lock()
    }
    
    package static func unlock() {
        Update._lock.unlock()
    }
    
    package static func dispatchImmediately<T>(reason: CustomEventTrace.ActionEventType.Reason?, _ handler: () -> T) -> T {
        Update.begin()
        
        let actionID = Update.Action.nextActionID
        Update.Action.nextActionID += 2
        
        defer {
            CustomEventTrace.finishAction(actionID, reason)
            Update.end()
        }
        
        CustomEventTrace.startAction(actionID, nil)
        return handler()
    }
    
    package static func syncMain(_ handler: () -> Void) {
        if Thread.isMainThread {
            handler()
        } else {
            fatalError("TODO")
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
        if !Update._lock.isOwner() {
            fatalError("SwiftUI is active without having taken its own lock - missing Update.ensure()?")
        }
    }
    
    package static func dispatchActions() {
        fatalError("TODO")
    }
}

extension Update {
    fileprivate class TraceHost {
    }
}

extension Update {
    struct Action {
        static nonisolated(unsafe) var nextActionID: UInt32 = 1
        private let reason: CustomEventTrace.ActionEventType.Reason?
        private let thunk: () -> Void
        fileprivate let actionID: UInt32
        
        init(reason: CustomEventTrace.ActionEventType.Reason?, thunk: @escaping () -> Void) {
            self.reason = reason
            self.thunk = thunk
            
            let w23 = (Update.Action.nextActionID &>> 1) + 1
            Update.Action.nextActionID += 2
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

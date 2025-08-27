#warning("TODO")
private import os.signpost
private import os.log
private import _MySwiftUIShims

package enum Update {
    private static let _lock = MovableLock.create()
    private static nonisolated(unsafe) var depth: Int = 0
    static nonisolated(unsafe) let traceHost: AnyObject = TraceHost()
    
    package static func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, _ action: () -> ()) -> UInt32 {
        fatalError("TODO")
    }
    
    package static func begin() {
        Update._lock.lock()
        Update.depth += 1
        
        guard Update.depth == 1 else {
            return
        }
        
        Signpost.viewHost.traceEvent(
            type: .begin,
            object: Update.traceHost,
            "ViewHost: (%p) update began PlatformHost [ %p ]",
            args: [0, UInt(bitPattern: Unmanaged.passUnretained(traceHost).toOpaque())]
        )
    }
    
    package static var threadIsUpdating: Bool {
        fatalError("TODO")
    }
    
    package static func ensure<T>(_ handler: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    package static func locked<T>(_ handler: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    package static var isOwner: Bool {
        fatalError("TODO")
    }
    
    package static func end() {
        fatalError("TODO")
    }
    
    package static func lock() {
        fatalError("TODO")
    }
    
    package static func unlock() {
        fatalError("TODO")
    }
    
    package static func dispatchImmediately<T>(reason: CustomEventTrace.ActionEventType.Reason?, _ handler: () -> T) -> T {
        fatalError("TODO")
    }
    
    package static func syncMain(_ handler: () -> Void) {
        fatalError("TODO")
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
            // original : "SwiftUI is active without having taken its own lock - missing Update.ensure()?"
            fatalError("MySwiftUI is active without having taken its own lock - missing Update.ensure()?")
        }
    }
}

extension Update {
    fileprivate class TraceHost {
    }
}

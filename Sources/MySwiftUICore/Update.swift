#warning("TODO")
private import os.signpost
private import _MySwiftUIShims

package enum Update {
    private static let _lock = MovableLock.create()
    
    package static func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, _ action: () -> ()) -> UInt32 {
        fatalError("TODO")
    }
    
    package static func begin() {
        fatalError("TODO")
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
        fatalError("TODO")
    }
}

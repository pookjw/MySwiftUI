#warning("TODO")

package struct ViewGraphHostUpdate {
    package static var isOwner: Bool {
        fatalError("TODO")
    }
    
    package static func begin() {
        Update.lock()
    }
    
    package static func end() {
        Update.unlock()
    }
    
    package static func ensure<T>(_ body: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    package static func enqueueAction(_ body: () -> Void) {
        fatalError("TODO")
    }
    
    package static func lock() {
        fatalError("TODO")
    }
    
    package static func unlock() {
        fatalError("TODO")
    }
    
    package static func dispatchImmediately<T>(_ body: () -> T) {
        fatalError("TODO")
    }
}

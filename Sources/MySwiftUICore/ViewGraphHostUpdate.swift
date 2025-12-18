
package struct ViewGraphHostUpdate {
    package static var isOwner: Bool {
        fatalError("TODO")
    }
    
    package static func begin() {
        fatalError("TODO")
    }
    
    package static func end() {
        fatalError("TODO")
    }
    
    package static func ensure<T>(_ body: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    package static func enqueueAction(_ body: () -> Void) {
        fatalError("TODO")
    }
    
    package static func lock() {
        Update.lock()
    }
    
    package static func unlock() {
        Update.unlock()
    }
    
    package static func dispatchImmediately<T>(_ body: () -> T) -> T {
        return Update.dispatchImmediately(reason: nil) { 
            return body()
        }
    }
}

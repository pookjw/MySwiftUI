
package struct ViewGraphHostUpdate {
    package static var isOwner: Bool {
        assertUnimplemented()
    }
    
    package static func begin() {
        assertUnimplemented()
    }
    
    package static func end() {
        assertUnimplemented()
    }
    
    package static func ensure<T>(_ body: () throws -> T) rethrows -> T {
        assertUnimplemented()
    }
    
    package static func enqueueAction(_ action: @escaping () -> Void) {
        Update.enqueueAction(reason: nil, action)
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

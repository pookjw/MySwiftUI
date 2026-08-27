private import MySwiftUICore

package enum MapKitUpdate {
    package static func ensure<T>(_ block: () throws -> T) rethrows -> T {
        return try Update.ensure(block)
    }
    
    package static func enqueueAction(_ block: @escaping () -> Void) {
        Update.enqueueAction(reason: nil, block)
    }
}

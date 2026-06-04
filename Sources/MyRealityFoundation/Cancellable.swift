public import Combine

extension Cancellable {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @preconcurrency @MainActor public func storeWhileEntityActive(_ entity: Entity) {
        assertUnimplemented()
    }
}

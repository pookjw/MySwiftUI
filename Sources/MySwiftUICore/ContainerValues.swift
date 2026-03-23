@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ContainerValues {
    public subscript<Key>(key: Key.Type) -> Key.Value where Key: ContainerValueKey {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    public func tag<V>(for type: V.Type) -> V? where V: Hashable {
        assertUnimplemented()
    }

    public func hasTag<V>(_ tag: V) -> Bool where V: Hashable {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ContainerValues: Sendable {}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public protocol ContainerValueKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}

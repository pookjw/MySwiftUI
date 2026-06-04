@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, tvOS 26.0, *)
public struct AttachedTransformComponent : Component {
    public init(source: GeometricPin? = nil, target: GeometricPin) {
        assertUnimplemented()
    }
    
    public var target: GeometricPin
    
    public var source: GeometricPin?
}

@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, tvOS 26.0, *)
extension AttachedTransformComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> AttachedTransformComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

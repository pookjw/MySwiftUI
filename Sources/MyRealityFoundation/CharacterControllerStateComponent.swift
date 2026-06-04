@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct CharacterControllerStateComponent : Component {
    public init() {
        assertUnimplemented()
    }
    
    public let velocity: SIMD3<Float>
    
    public let isOnGround: Bool
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension CharacterControllerStateComponent {
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func __fromCore(_ coreComponent: __ComponentRef) -> CharacterControllerStateComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
}

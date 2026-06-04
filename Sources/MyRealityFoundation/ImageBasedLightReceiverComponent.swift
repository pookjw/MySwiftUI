@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ImageBasedLightReceiverComponent : Component, Equatable {
    public var imageBasedLight: Entity
    
    public init(imageBasedLight: Entity) {
        assertUnimplemented()
    }
    
    public static func == (a: ImageBasedLightReceiverComponent, b: ImageBasedLightReceiverComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ImageBasedLightReceiverComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> ImageBasedLightReceiverComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

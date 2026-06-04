@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct OpacityComponent : Component, Equatable {
    public var opacity: Float
    
    public init(opacity: Float = 1.0) {
        assertUnimplemented()
    }
    
    public static func == (lhs: OpacityComponent, rhs: OpacityComponent) -> Bool {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> OpacityComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension OpacityComponent : _ImplicitlyAnimatableBuiltinComponent {
}

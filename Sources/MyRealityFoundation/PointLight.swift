@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
@preconcurrency @MainActor public class PointLight : Entity, HasPointLight {
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @usableFromInline
    @MainActor @preconcurrency override internal init(_coreEntity: __EntityRef) {
        assertUnimplemented()
    }
    }

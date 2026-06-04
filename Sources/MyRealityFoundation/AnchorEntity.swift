public import simd

@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class AnchorEntity : Entity, HasAnchoring {
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @MainActor @preconcurrency public init(_ target: AnchoringComponent.Target) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(world position: SIMD3<Float>) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(world transform: float4x4) {
        assertUnimplemented()
    }
    
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @MainActor @preconcurrency convenience public init(plane alignment: AnchoringComponent.Target.Alignment, classification: AnchoringComponent.Target.Classification = .any, minimumBounds: SIMD2<Float> = [0, 0]) {
        assertUnimplemented()
    }
    }

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AnchorEntity {
    @MainActor @preconcurrency convenience public init(_ target: AnchoringComponent.Target, trackingMode: AnchoringComponent.TrackingMode) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnchorEntity {
    @MainActor @preconcurrency convenience public init(_ target: AnchoringComponent.Target, trackingMode: AnchoringComponent.TrackingMode, physicsSimulation: AnchoringComponent.PhysicsSimulation = .isolated) {
        assertUnimplemented()
    }
}

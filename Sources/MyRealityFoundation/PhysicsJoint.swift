@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol PhysicsJoint : Equatable {
    var pin0: GeometricPin { get set }
    var pin1: GeometricPin { get set }
    var checksForInternalCollisions: Bool { get }
    var isActive: Bool { get }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicsJoint {
    @discardableResult
    @MainActor public func addToSimulation() throws -> Entity {
        assertUnimplemented()
    }
}

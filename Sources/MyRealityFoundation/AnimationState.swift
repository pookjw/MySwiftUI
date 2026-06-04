public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct AnimationState<Value> : AnimationStateProtocol where Value : AnimatableData {
    public var defaultSource: Value? {
        get {
            assertUnimplemented()
        }
    }
    
    public var defaultTarget: Value? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public func storeAnimatedValue<ValueType>(_ value: ValueType) -> Bool {
        assertUnimplemented()
    }
    
    public let deltaTime: TimeInterval
    
    public let evaluationTime: TimeInterval
    
    public let normalizedTime: TimeInterval
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias ValueType = Value
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnimationState where Value == JointTransforms {
    public var defaultSource: JointTransforms? {
        get {
            assertUnimplemented()
        }
    }
    
    public func defaultSourceJoints(index: Int, count: Int, transforms: inout [Transform]) -> Bool {
        assertUnimplemented()
    }
    
    public var defaultTarget: JointTransforms? {
        get {
            assertUnimplemented()
        }
    }
    
    public func defaultTargetJoints(index: Int, count: Int, transforms: inout [Transform]) -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    public func storeAnimatedJoints(transforms: [Transform], jointIndex: Int) -> Bool {
        assertUnimplemented()
    }
}

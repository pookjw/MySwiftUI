public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol AnimationStateProtocol {
    associatedtype ValueType : AnimatableData
    var defaultSource: Self.ValueType? { get }
    var defaultTarget: Self.ValueType? { get }
    var deltaTime: TimeInterval { get }
    var evaluationTime: TimeInterval { get }
    var normalizedTime: TimeInterval { get }
    @discardableResult
    func storeAnimatedValue<ValueType>(_ value: ValueType) -> Bool
}

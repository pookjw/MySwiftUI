@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct SpinAction : EntityAction, Codable {
    public var revolutions: Float
    
    public var localAxis: SIMD3<Float>
    
    public var timingFunction: AnimationTimingFunction
    
    public var isAdditive: Bool
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(revolutions: Float, localAxis: SIMD3<Float> = [0, 1, 0], timingFunction: AnimationTimingFunction = .default, isAdditive: Bool = false) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

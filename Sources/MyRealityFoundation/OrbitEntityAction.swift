@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct OrbitEntityAction : EntityAction, Codable {
    public var pivotEntity: ActionEntityResolution
    
    public var revolutions: Float
    
    public var orbitalAxis: SIMD3<Float>
    
    public var isOrientedToPath: Bool
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public var isAdditive: Bool
    
    public init(pivotEntity: ActionEntityResolution, revolutions: Float, orbitalAxis: SIMD3<Float> = [0, 1, 0], isOrientedToPath: Bool = false, isAdditive: Bool = false) {
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

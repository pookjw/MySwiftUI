public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntitySpinActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float?
    
    public var iterations: Float?
    
    public var direction: __RKEntitySpinDirectionType?
    
    public var axis: SIMD3<Float>?
    
    public init(target: UUID, duration: Float = 1.0, iterations: Float = 1, direction: __RKEntitySpinDirectionType = .clockwise, axis: SIMD3<Float> = SIMD3<Float>(0,1,0)) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntitySpinActionArguments, b: __RKEntitySpinActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

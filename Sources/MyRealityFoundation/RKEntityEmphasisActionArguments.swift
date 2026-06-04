public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityEmphasisActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float?
    
    public var iterations: Float?
    
    public var animationStyle: __RKEntityActionAnimationStyle?
    
    public var emphasisAnimationType: __RKEntityEmphasisAnimationType?
    
    public init(target: UUID, duration: Float = 1.0, iterations: Float = 1.0, animationStyle: __RKEntityActionAnimationStyle = .basic, emphasisAnimationType: __RKEntityEmphasisAnimationType = .pop) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityEmphasisActionArguments, b: __RKEntityEmphasisActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

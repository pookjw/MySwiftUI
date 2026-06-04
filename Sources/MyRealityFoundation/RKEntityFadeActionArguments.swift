public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityFadeActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var targetOpacity: Float
    
    public var duration: Float?
    
    public init(target: UUID, targetOpacity: Float, duration: Float = 1.0) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityFadeActionArguments, b: __RKEntityFadeActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

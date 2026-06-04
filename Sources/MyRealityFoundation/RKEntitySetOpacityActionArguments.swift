public import Foundation

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
public struct __RKEntitySetOpacityActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float
    
    public var opacity: Float
    
    public init(target: UUID, duration: Float = 1.0, opacity: Float = 1.0) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntitySetOpacityActionArguments, b: __RKEntitySetOpacityActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

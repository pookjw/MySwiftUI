public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntitySwapEntityActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var newTarget: UUID
    
    public var buildOutAction: __RKEntityHideActionArguments
    
    public var buildInAction: __RKEntityShowActionArguments
    
    public init(target: UUID, newTarget: UUID, buildOutAction: __RKEntityHideActionArguments, buildInAction: __RKEntityShowActionArguments) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntitySwapEntityActionArguments, b: __RKEntitySwapEntityActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

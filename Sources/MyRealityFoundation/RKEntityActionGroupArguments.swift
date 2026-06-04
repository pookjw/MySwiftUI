@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityActionGroupArguments : Codable, Equatable {
    public var order: __RKEntityGroupActionOrder
    
    public var actions: [__RKEntityActionSpecification]
    
    public var exclusive: Bool?
    
    public var loopCount: Int?
    
    public var exclusiveBlocks: Bool?
    
    public init(order: __RKEntityGroupActionOrder, actions: [__RKEntityActionSpecification], exclusive: Bool = false, loopCount: Int = 1) {
        assertUnimplemented()
    }
    
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    public init(order: __RKEntityGroupActionOrder, actions: [__RKEntityActionSpecification], exclusive: Bool = false, loopCount: Int = 1, exclusiveBlocks: Bool = false) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityActionGroupArguments, b: __RKEntityActionGroupArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

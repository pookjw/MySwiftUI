@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityInteractionSpecification : Codable, Equatable, CustomStringConvertible {
    public var trigger: __RKEntityTriggerSpecification
    
    public var action: __RKEntityActionSpecification
    
    public var accessibilityDescription: String?
    
    public init(trigger: __RKEntityTriggerSpecification, action: __RKEntityActionSpecification) {
        assertUnimplemented()
    }
    
    public init(_ trigger: __RKEntityTriggerSpecification, _ action: __RKEntityActionSpecification) {
        assertUnimplemented()
    }
    
    public init(trigger: __RKEntityTriggerSpecification, action: __RKEntityActionSpecification, accessibilityDescription: String? = nil) {
        assertUnimplemented()
    }
    
    public init(_ trigger: __RKEntityTriggerSpecification, _ action: __RKEntityActionSpecification, _ accessibilityDescription: String? = nil) {
        assertUnimplemented()
    }
    
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: __RKEntityInteractionSpecification, b: __RKEntityInteractionSpecification) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
extension __RKEntityInteractionSpecification : __USDEncodablePublic {
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
    
    @available(*, deprecated)
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper, sceneSpecifier: __USKNodeSpecifierTypeWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
}

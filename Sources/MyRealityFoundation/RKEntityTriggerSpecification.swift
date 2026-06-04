public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityTriggerSpecification : Codable, Equatable {
    case drag
    case light
    case lookAt
    case placement
    case proximity(target: UUID, distance: Float, type: __RKEntityProximityTrigger.ExitType)
    case removal
    case sound
    case start
    case tapTarget(target: UUID)
    case timer
    case collision(target: UUID, collidingEntities: [UUID], tags: [String])
    case custom(tag: String)
    case customWithArguments(identifier: String, customArguments: [String : String]?)
    case group(triggers: [__RKEntityTriggerSpecification])
    
    public enum Name : String {
        case drag
        case light
        case lookAt
        case placement
        case proximity
        case removal
        case sound
        case start
        case tapTarget
        case timer
        case collision
        case custom
        case customWithArguments
        case group
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = String
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var name: __RKEntityTriggerSpecification.Name {
        get {
            assertUnimplemented()
        }
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityTriggerSpecification, b: __RKEntityTriggerSpecification) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
extension __RKEntityTriggerSpecification : __USDEncodablePublic {
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
    
    @available(*, deprecated)
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper, sceneSpecifier: __USKNodeSpecifierTypeWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityTriggerSpecification.Name : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityTriggerSpecification.Name : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityTriggerSpecification.Name : RawRepresentable {}

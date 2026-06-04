public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityProximityTrigger : __RKEntityTrigger {
    public enum ExitType : Int, Codable {
        case none
        case sequence
        case reverse
        
        public init?(rawValue: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = Int
        
        public var rawValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var targetEntity: Entity?
    
    public var __targetEntity: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    public var distance: Float
    
    public var type: __RKEntityProximityTrigger.ExitType
    
    public var enterFired: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var exitFired: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public init(targetEntity: Entity?, distance: Float, type: __RKEntityProximityTrigger.ExitType) {
        assertUnimplemented()
    }
    
    override public func matches(with trigger: __RKEntityTrigger) -> Bool {
        assertUnimplemented()
    }
    
    @objc override dynamic public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> __RKEntityTrigger? {
        assertUnimplemented()
    }
    }

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityProximityTrigger.ExitType : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityProximityTrigger.ExitType : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityProximityTrigger.ExitType : RawRepresentable {}

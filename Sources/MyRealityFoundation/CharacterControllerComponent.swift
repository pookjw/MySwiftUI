@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct CharacterControllerComponent : Component {
    public struct Collision {
        public init(characterEntity: Entity, hitEntity: Entity, hitPosition: SIMD3<Float>, hitNormal: SIMD3<Float>, moveDirection: SIMD3<Float>, moveDistance: Float) {
            assertUnimplemented()
        }
        
        public var characterEntity: Entity
        
        public var hitEntity: Entity
        
        public var hitPosition: SIMD3<Float>
        
        public var hitNormal: SIMD3<Float>
        
        public var moveDirection: SIMD3<Float>
        
        public var moveDistance: Float
    }
    
    public struct CollisionFlags : OptionSet {
        public init(rawValue: UInt8) {
            assertUnimplemented()
        }
        
        public let rawValue: UInt8
        
        @safe public static nonisolated(unsafe) let none: CharacterControllerComponent.CollisionFlags = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let side: CharacterControllerComponent.CollisionFlags = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let top: CharacterControllerComponent.CollisionFlags = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let bottom: CharacterControllerComponent.CollisionFlags = {
            assertUnimplemented()
        }()
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias ArrayLiteralElement = CharacterControllerComponent.CollisionFlags
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias Element = CharacterControllerComponent.CollisionFlags
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias RawValue = UInt8
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(radius: Float, height: Float, skinWidth: Float = defaultSkinWidth, slopeLimit: Float = defaultSlopeLimit, stepLimit: Float = defaultStepLimit, upVector: SIMD3<Float> = defaultUpVector, collisionFilter: CollisionFilter = .default) {
        assertUnimplemented()
    }
    
    public var radius: Float
    
    public var height: Float
    
    public var skinWidth: Float
    
    public var slopeLimit: Float
    
    public var stepLimit: Float
    
    public var upVector: SIMD3<Float>
    
    public var collisionFilter: CollisionFilter
    
    @safe public static nonisolated(unsafe) let defaultRadius: Float = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let defaultHeight: Float = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let defaultSkinWidth: Float = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let defaultSlopeLimit: Float = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let defaultStepLimit: Float = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let defaultUpVector: SIMD3<Float> = {
        assertUnimplemented()
    }()
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension CharacterControllerComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> CharacterControllerComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum CollisionCastQueryType : Hashable {
    case nearest
    case all
    case any
    
    public static func == (a: CollisionCastQueryType, b: CollisionCastQueryType) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionGroup : OptionSet {
    public let rawValue: UInt32
    
    @safe public static nonisolated(unsafe) let `default`: CollisionGroup = {
        assertUnimplemented()
    }()
    
    @available(iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
    @safe public static nonisolated(unsafe) let sceneUnderstanding: CollisionGroup = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let all: CollisionGroup = {
        assertUnimplemented()
    }()
    
    public init(rawValue: UInt32) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ArrayLiteralElement = CollisionGroup
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias Element = CollisionGroup
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias RawValue = UInt32
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionCastHit : Equatable {
    public var entity: Entity {
        assertUnimplemented()
    }
    
    public var position: SIMD3<Float> {
        assertUnimplemented()
    }
    
    public var normal: SIMD3<Float> {
        assertUnimplemented()
    }
    
    public var distance: Float {
        assertUnimplemented()
    }
    
    public static func == (a: CollisionCastHit, b: CollisionCastHit) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionCastHit {
    public struct TriangleHit : Equatable {
        public var faceIndex: Int {
            assertUnimplemented()
        }
        
        public var uv: SIMD2<Float> {
            assertUnimplemented()
        }
        
        public static func == (a: CollisionCastHit.TriangleHit, b: CollisionCastHit.TriangleHit) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var triangleHit: CollisionCastHit.TriangleHit? {
        assertUnimplemented()
    }
    
    public var shapeIndex: Int {
        assertUnimplemented()
    }
}

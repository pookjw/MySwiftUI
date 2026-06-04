public import CoreGraphics
public import Foundation
public import Metal

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public class RealityRenderer {
    @MainActor public struct EntityCollection : @MainActor MyRealityFoundation::EntityCollection {
        @MainActor public var startIndex: Int {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor public var endIndex: Int {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor public var count: Int {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor public subscript(index: Int) -> Entity {
            get {
                assertUnimplemented()
            }
        }
        
        @MainActor public func index(after i: Int) -> Int {
            assertUnimplemented()
        }
        
        @MainActor public mutating func insert<S>(contentsOf sequence: S, beforeIndex index: Int) where S : Sequence, S.Element : Entity {
            assertUnimplemented()
        }
        
        @MainActor public mutating func append<S>(contentsOf sequence: S) where S : Sequence, S.Element : Entity {
            assertUnimplemented()
        }
        
        @MainActor public mutating func remove(_ child: Entity) {
            assertUnimplemented()
        }
        
        @MainActor public mutating func remove(at index: Int) {
            assertUnimplemented()
        }
        
        @MainActor public mutating func removeAll() {
            assertUnimplemented()
        }
        
        @MainActor public mutating func replaceAll<S>(_ children: S) where S : Sequence, S.Element : Entity {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = Entity
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Index = Int
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<RealityRenderer.EntityCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Iterator = IndexingIterator<RealityRenderer.EntityCollection>
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias SubSequence = Slice<RealityRenderer.EntityCollection>
    }
    
    public struct CameraSettings {
        public var isToneMappingEnabled: Bool
        
        public struct ColorBackground {
            public static func color(_ color: CGColor) -> RealityRenderer.CameraSettings.ColorBackground {
                assertUnimplemented()
            }
            
            public static func outputTexture() -> RealityRenderer.CameraSettings.ColorBackground {
                assertUnimplemented()
            }
        }
        
        public var colorBackground: RealityRenderer.CameraSettings.ColorBackground
    }
    
    public struct CameraOutput {
        public struct RelativeViewport {
            public var originX: Double
            
            public var originY: Double
            
            public var width: Double
            
            public var height: Double
            
            public init(originX: Double, originY: Double, width: Double, height: Double) {
                assertUnimplemented()
            }
        }
        
        public struct Descriptor {
            public var colorTextures: [any MTLTexture]
            
            public var viewports: [RealityRenderer.CameraOutput.RelativeViewport]
            
            public static func singleProjection(colorTexture: any MTLTexture) -> RealityRenderer.CameraOutput.Descriptor {
                assertUnimplemented()
            }
        }
        
        public var colorTextures: [any MTLTexture] {
            get {
                assertUnimplemented()
            }
        }
        
        public var viewports: [RealityRenderer.CameraOutput.RelativeViewport] {
            get {
                assertUnimplemented()
            }
        }
        
        public init(_ descriptor: RealityRenderer.CameraOutput.Descriptor) throws {
            assertUnimplemented()
        }
    }
    
    @MainActor public var entities: RealityRenderer.EntityCollection {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)? = nil, componentType: (any Component.Type)? = nil, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
    
    public struct ImageBasedLight {
        public var resource: EnvironmentResource?
        
        public var intensityExponent: Float
    }
    
    @MainActor public var lighting: RealityRenderer.ImageBasedLight {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var activeCamera: Entity?
    
    public var cameraSettings: RealityRenderer.CameraSettings
    
    public struct MetalEventAction {
        public let event: any MTLEvent = {
            assertUnimplemented()
        }()
        
        public let value: UInt64 = {
            assertUnimplemented()
        }()
        
        public static func wait(for event: any MTLEvent, value: UInt64) -> RealityRenderer.MetalEventAction {
            assertUnimplemented()
        }
        
        public static func signal(_ event: any MTLEvent, value: UInt64) -> RealityRenderer.MetalEventAction {
            assertUnimplemented()
        }
    }
    
    @MainActor public init() throws {
        assertUnimplemented()
    }
    
    @MainActor public func update(_ deltaTime: TimeInterval) throws {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func updateAndRender(deltaTime: TimeInterval, cameraOutput: RealityRenderer.CameraOutput, whenScheduled: (@Sendable (RealityRenderer) -> Void)? = nil, onComplete: (@Sendable (RealityRenderer) -> Void)? = nil, actionsBeforeRender: [RealityRenderer.MetalEventAction] = [], actionsAfterRender: [RealityRenderer.MetalEventAction] = []) throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension RealityRenderer.CameraSettings {
    public var antialiasing: AntialiasingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension RealityRenderer.EntityCollection : Sendable {}

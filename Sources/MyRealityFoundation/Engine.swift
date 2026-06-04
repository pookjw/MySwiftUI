public import Dispatch
public import Metal

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __Engine {
    public struct Configuration {
        public var clockMode: __EngineClockModeRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var useMetal: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var forExportOnly: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var enableVideoSupport: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var enablePreloadMXIAssets: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var useRealityIO: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var usePhysicsSceneSystem: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var assetRuntimeSizeLimit: UInt64 {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var device: (any MTLDevice)? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var isHostingSharedAudioSimulation: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @available(*, deprecated, message: "Custom engine queues are no longer supported in  Use CoreRE instead.")
        public var queue: DispatchQueue? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var __createServices: __EngineServiceMaskRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var __updateServices: __EngineServiceMaskRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var __startupOptions: __StartupOptionsRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var __renderFlags: __RenderFlagsRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var __caLayerServer: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init() {
            assertUnimplemented()
        }
    }
    
    @safe final public nonisolated(unsafe) let configuration: __Engine.Configuration = {
        assertUnimplemented()
    }()
    
    public var __coreEngine: __EngineRef {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Custom engine queues are no longer supported in  Use CoreRE instead.")
    @safe final public nonisolated(unsafe) let queue: DispatchQueue = {
        assertUnimplemented()
    }()
    
    public var services: __ServiceLocator! {
        get {
            assertUnimplemented()
        }
    }
    
    public init(configuration: __Engine.Configuration) {
        assertUnimplemented()
    }
    
    public static func __fromCore(_ coreEngine: __EngineRef) -> __Engine {
        assertUnimplemented()
    }
    
    public func start() {
        assertUnimplemented()
    }
    
    public func __start() {
        assertUnimplemented()
    }
    
    public func __stop() {
        assertUnimplemented()
    }
    
    public static func __ensureBuiltInComponentsAreRegistered() {
        assertUnimplemented()
    }
    
    public static func __ensureInteractionsComponentIsRegistered() {
        assertUnimplemented()
    }
    
    public static func __registerInteractionComponent() throws {
        assertUnimplemented()
    }
    
    public static func __registerREKitComponents() throws {
        assertUnimplemented()
    }
    
    public static func __unregisterREKitComponents() {
        assertUnimplemented()
    }
    
    public static func __unregisterInteractionComponent() {
        assertUnimplemented()
    }
}

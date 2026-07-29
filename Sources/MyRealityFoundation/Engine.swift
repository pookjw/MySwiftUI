// C8EB66E8704C9F048957B956D65526C0
public import Dispatch
public import Metal
private import CoreRE

fileprivate let interactionComponentInitializer: Void = {
    assertUnimplemented()
}()

fileprivate let builtInComponentsInitializer: Void = {
    assertUnimplemented()
}()

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@safe public class __Engine {
    final public let configuration: __Engine.Configuration // 0x10
    let coreEngine: OpaquePointer // 0x18
    @available(*, deprecated, message: "Custom engine queues are no longer supported in Swift. Use CoreRE instead.")
    final public let queue: DispatchQueue // 0x20
    public private(set) var services: __ServiceLocator! = nil // 0x28
    private var hasRenderedThisFrame: Bool = false // 0x30
    private let namedFileAssetResolver = NamedFileAssetResolver() // 0x38
    
    public struct Configuration {
        private var core: EngineConfiguration
        
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
        
        var enableInteractions: Bool {
            get {
                return self.core.coreConfiguration.enableInteractions
            }
            set {
                self.core.coreConfiguration.enableInteractions = newValue
            }
            _modify {
                var value = self.enableInteractions
                yield &value
                self.enableInteractions = value
            }
        }
        
        public init() {
            assertUnimplemented()
        }
        
        init(configuration: EngineConfiguration) {
            let ref = configuration.coreConfiguration.clone()
            self.core = EngineConfiguration(coreConfiguration: ref)
        }
        
        @inline(always) // 원래 없음
        fileprivate init(coreConfiguration: CoreRE::Engine.Configuration) {
            self.core = EngineConfiguration(coreConfiguration: coreConfiguration.clone())
        }
    }
    
    public var __coreEngine: __EngineRef {
        get {
            assertUnimplemented()
        }
    }
    
    public init(configuration: __Engine.Configuration) {
        assertUnimplemented()
    }
    
    init(coreEngine: OpaquePointer) {
        // <+112>
        unsafe __RERetain(coreEngine)
        unsafe self.coreEngine = coreEngine
        
        let configurationRef = unsafe CoreRE::Engine.Configuration(
            engine: unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
        )
        unsafe __RERetain(unsafeBitCast(configurationRef, to: OpaquePointer.self))
        self.configuration = __Engine.Configuration(
            coreConfiguration: configurationRef
        )
        unsafe __RERelease(unsafeBitCast(configurationRef, to: OpaquePointer.self))
        
        // <+188>
        self.queue = configurationRef.engineQueue!
        
        if self.configuration.enableInteractions {
            _ = interactionComponentInitializer
            _ = builtInComponentsInitializer
        } else {
            _ = builtInComponentsInitializer
        }
        
        // <+260>
        self.services = __ServiceLocator(engine: self)
        
        // <+340>
        unsafe unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
            .setCallbacksEx(nil) { ptr in
                return unsafe engineRenderCallback(coreEngine: unsafeBitCast(ptr, to: OpaquePointer.self))
            }
        
        unsafe unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
        
        // <+372>
        if __ServiceLocator.hasSharedServiceLocator {
            unsafe __ServiceLocator.__sharedEngine = self
        }
        
        self.commonPostInit()
        unsafe __RERelease(unsafeBitCast(configurationRef, to: OpaquePointer.self))
    }
    
    deinit {
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
    
    fileprivate func commonPostInit() {
        assertUnimplemented()
    }
}

final class EngineConfiguration {
    fileprivate private(set) var coreConfiguration: CoreRE::Engine.Configuration
    
    init() {
        assertUnimplemented()
    }
    
    @inline(__always) // 원래 없음
    fileprivate init(coreConfiguration: CoreRE::Engine.Configuration) {
        self.coreConfiguration = coreConfiguration
    }
    
    deinit {
        assertUnimplemented()
    }
}

fileprivate nonisolated func engineRenderCallback(coreEngine: OpaquePointer) -> CoreRE::EventHandlerResult {
    assertUnimplemented()
}

// F50A054CE3363D666CF89736DED4EF50
private import CoreRE
private import Foundation
private import os.log
internal import os.lock
private import Darwin.POSIX.dlfcn
#if RealityKitCompataibility
private import _RealityFoundationPrivate
#endif

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
public let __privateEngineMode: Bool = {
    // $s10RealityKit19__privateEngineModeSbvpfiSbyXEfU_
    let arguments = Set(ProcessInfo.processInfo.arguments)
    
    if arguments.contains("-privateEngineMode") {
        // <+168>
        unsafe os_log(.info, log: .default, "Setting \"Private Engine Mode\" from process arguments")
        return true
    } else {
        // <+236>
        if REIsRSCompatible() {
            unsafe os_log(.info, log: .default, "Setting \"Private Engine Mode\" for bincompat app")
            return true
        } else {
            // <+328>
            let value = Bundle.main.object(forInfoDictionaryKey: "Private Engine Mode") as? Bool
            if let value, value {
                unsafe os_log(.info, log: .default, "Setting \"Private Engine Mode\" from bundle Info.plist")
                return true
            } else {
                return false
            }
        }
    }
}()

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@safe public class __ServiceLocator {
    fileprivate static nonisolated(unsafe) var sharedEngine:  __Engine?
    static let lock = OSAllocatedUnfairLock(initialState: ())
    fileprivate nonisolated(unsafe) static var createdSharedEngine = false
    
    private(set) var coreServiceLocator: OpaquePointer // 0x10
    public unowned var engine: __Engine // 0x18
    private var eventBus: REEventBus // 0x20
    private var renderServiceActual: (any __RenderService)? = nil // 0x28
    public var sceneService: any __SceneService // 0x50
    public var assetService: any __REAssetService // 0x78
    private var timebaseService: TimebaseService // 0xa0
    private var loadService: LoadManager // 0xa8
#if RealityKitCompataibility
    private var usdImportService: (any _RealityFoundationPrivate::USDImportService)? = nil // 0xb0
#else
    private var usdImportService: (any MyRealityFoundation::USDImportService)? = nil // 0xb0
#endif
    private var isValid: Bool = true // 0xd8
    private var usingRealityIO: Bool = false // 0xd9
    private var realityIOHandle: UnsafeMutableRawPointer? = nil // 0xe0
    
    public static var __sharedEngine: __Engine! {
        get {
            guard !__privateEngineMode else {
                return unsafe __ServiceLocator.sharedEngine
            }
            
            // <+48>
            // x19
            guard let sharedREEngine = CoreRE::Engine.shared else {
                unsafe __ServiceLocator.sharedEngine = nil
                return unsafe __ServiceLocator.sharedEngine
            }
            
            // <+56>
            let lock = __ServiceLocator.lock
            lock.lock()
            
            if
                let sharedEngine = unsafe __ServiceLocator.sharedEngine,
                unsafe sharedEngine.coreEngine == unsafeBitCast(sharedREEngine, to: OpaquePointer.self)
            {
                lock.unlock()
                return unsafe __ServiceLocator.sharedEngine
            }
            
            // <+112>
            // x20
            let engine = unsafe __Engine(
                coreEngine: unsafeBitCast(sharedREEngine, to: OpaquePointer.self)
            )
            
            unsafe __ServiceLocator.sharedEngine = engine
            
            _ = unsafe SceneManager.customComponentType(__EntityInfoComponent.self)
            _ = unsafe SceneManager.customComponentType(SceneOriginComponent.self)
            
            lock.unlock()
            return unsafe __ServiceLocator.sharedEngine
        }
        set {
            if let newValue {
                unsafe CoreRE::Engine.shared = unsafeBitCast(newValue.coreEngine, to: CoreRE::Engine.self)
            } else {
                if unsafe __ServiceLocator.createdSharedEngine {
                    CoreRE::Engine.shared = nil
                }
            }
            
            unsafe __ServiceLocator.sharedEngine = newValue
        }
    }
    
    public static var hasSharedServiceLocator: Bool {
        return unsafe __ServiceLocator.sharedEngine != nil
    }
    
    public static var shared: __ServiceLocator {
        get {
            assertUnimplemented()
        }
    }
    
    public static func __createSharedIfNeeded(with configuration: __Engine.Configuration) {
        assertUnimplemented()
    }
    
    init(engine: __Engine) {
        let coreEngine = unsafe unsafeBitCast(engine.coreEngine, to: CoreRE::Engine.self)
        let serviceLocator = coreEngine.serviceLocator
        
        unsafe self.coreServiceLocator = unsafeBitCast(serviceLocator, to: OpaquePointer.self)
        self.engine = engine
        
        let ecsService = serviceLocator.ecsService!
        let eventBus = unsafe unsafeBitCast(self.coreServiceLocator, to: CoreRE::ServiceLocator.self)
            .eventBus!
        
        self.eventBus = unsafe REEventBus(
            coreHandle: unsafeBitCast(eventBus, to: OpaquePointer.self)
        )
        
        // <+228>
        self.sceneService = unsafe SceneManager(
            coreECSManager: unsafeBitCast(ecsService, to: OpaquePointer.self)
        )
        
        let assetManager = unsafe unsafeBitCast(self.coreServiceLocator, to: CoreRE::ServiceLocator.self)
            .assetManager!
        self.assetService = unsafe __REAssetManager(
            handle: unsafeBitCast(assetManager, to: OpaquePointer.self)
        )
        
        // <+372>
        let timebaseService = unsafe unsafeBitCast(self.coreServiceLocator, to: CoreRE::ServiceLocator.self)
            .timebaseService
        self.timebaseService = unsafe TimebaseService(
            handle: unsafeBitCast(timebaseService, to: OpaquePointer?.self)
        )
        
        self.loadService = LoadManager()
        
        if engine.configuration.useRealityIO {
            // <+460>
            let USDImportServiceType: any Any.Type
            if let type = _typeByName("9RealityIO16USDImportServiceC") {
                USDImportServiceType = type
            } else {
                guard let realityIOHandle = unsafe dlopen("/System/Library/PrivateFrameworks/RealityIO.framework/RealityIO", RTLD_LAZY) else {
                    preconditionFailure("Could not load RealityIO.")
                }
                
                unsafe self.realityIOHandle = unsafe realityIOHandle
                USDImportServiceType = _typeByName("9RealityIO16USDImportServiceC")!
            }
            
            // <+544>
#if RealityKitCompataibility
            let casted = USDImportServiceType as! (any _RealityFoundationPrivate::USDImportService.Type)
#else
            let casted = USDImportServiceType as! (any MyRealityFoundation::USDImportService.Type)
#endif
            
            self.usdImportService = casted.init()
            self.usingRealityIO = true
        }
        
        // <+684>
        unsafe unsafeBitCast(self.coreServiceLocator, to: CoreRE::ServiceLocator.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
        
        if let renderManager = unsafe unsafeBitCast(self.coreServiceLocator, to: CoreRE::ServiceLocator.self).renderManager
            {
            // <+708>
            self.renderService = unsafe RERenderManager(
                manager: unsafeBitCast(renderManager, to: OpaquePointer.self)
            )
        } else {
            // <+828>
            let clone = __Engine.Configuration(configuration: engine.configuration.core)
            let useMetal = clone.useMetal
            _ = consume clone
            
            guard !useMetal else {
                preconditionFailure("Could not create render service.")
            }
        }
        
        // <+860>
    }
    
    deinit {
        assertUnimplemented()
    }
    
    public var __engineRef: __EngineRef {
        get {
            assertUnimplemented()
        }
    }
    
    public var usesMetal: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var renderService: any __RenderService {
        get {
            return self.renderServiceActual!
        }
        set {
            self.renderServiceActual = newValue
        }
    }
    
    @available(*, deprecated, message: "Use renderService directly")
    public var __renderService: any __RenderService {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Use sceneService directly")
    public var __sceneService: any __SceneService {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Use assetService directly")
    public var __assetService: any __REAssetService {
        get {
            assertUnimplemented()
        }
    }
}

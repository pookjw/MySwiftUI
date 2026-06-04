@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __ServiceLocator {
    public static var __sharedEngine: __Engine! {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public static var hasSharedServiceLocator: Bool {
        get {
            assertUnimplemented()
        }
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
        assertUnimplemented()
    }
    
    public var __engineRef: __EngineRef {
        get {
            assertUnimplemented()
        }
    }
    unowned public var engine: __Engine
    
    public var usesMetal: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var renderService: any __RenderService {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Use renderService directly")
    public var __renderService: any __RenderService {
        get {
            assertUnimplemented()
        }
    }
    
    public var sceneService: any __SceneService
    
    @available(*, deprecated, message: "Use sceneService directly")
    public var __sceneService: any __SceneService {
        get {
            assertUnimplemented()
        }
    }
    
    public var assetService: any __REAssetService
    
    @available(*, deprecated, message: "Use assetService directly")
    public var __assetService: any __REAssetService {
        get {
            assertUnimplemented()
        }
    }
    }

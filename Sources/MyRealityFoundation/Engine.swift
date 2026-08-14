// C8EB66E8704C9F048957B956D65526C0
public import Dispatch
public import Metal
internal import CoreRE
private import os.log

fileprivate let interactionComponentInitializer: Void = {
    guard unsafe !__Engine.interactionsComponentsRegistered else {
        return
    }
    
    unsafe __Engine.interactionsComponentsRegistered = true
    
    do {
        unsafe __RKEntityInteractionsComponent.registration = try __RKEntityInteractionsComponent.Registration()
    } catch {
        unsafe os_log(.default, log: .default, "%s", "Error initializing Interaction Component: \(error)")
    }
}()

fileprivate let builtInComponentsInitializer: Void = {
    guard unsafe !__Engine.customComponentsRegistered else {
        return
    }
    
    unsafe __Engine.customComponentsRegistered = true
    _ = unsafe SceneManager.customComponentType(__EntityInfoComponent.self)
    
    for component in __Engine.customComponents {
        do {
            try component.register()
        } catch {
            unsafe os_log(.default, log: .default, "%s", "Error initializing custom components: \(error)")
            break
        }
    }
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
        private(set) var core: EngineConfiguration
        
        public var clockMode: __EngineClockModeRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
                assertUnimplemented()
            }
        }
        
        public var useRealityIO: Bool {
            get {
                return self.core.coreConfiguration.useRealityIO
            }
            set {
                assertUnimplemented()
            }
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
                assertUnimplemented()
            }
        }
        
        public var __createServices: __EngineServiceMaskRef {
            get {
                return self.core.engineServicesToCreate
            }
            set {
                let retainCount = unsafe CoreRE::REGetRetainCount(
                    unsafeBitCast(
                        self.core.coreConfiguration,
                        to: UnsafeRawPointer.self
                    )
                )
                
                if retainCount < 2 {
                    self.core.engineServicesToCreate = newValue
                } else {
                    let clone = self.core.clone()
                    self.core = clone
                    clone.engineServicesToCreate = newValue
                }
            }
            _modify {
                var value = self.__createServices
                yield &value
                self.__createServices = value
            }
        }
        
        public var __updateServices: __EngineServiceMaskRef {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
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
            _modify {
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
            _modify {
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
            _modify {
                assertUnimplemented()
            }
        }
        
        var caLayerServiceFlags: MyRealityFoundation::CALayerServiceFlags {
            get {
                return self.core.caLayerServiceFlags
            }
            set {
                let retainCount = unsafe CoreRE::REGetRetainCount(
                    unsafeBitCast(
                        self.core.coreConfiguration,
                        to: UnsafeRawPointer.self
                    )
                )
                
                if retainCount < 2 {
                    self.core.caLayerServiceFlags = newValue
                } else {
                    let clone = self.core.clone()
                    self.core = clone
                    clone.caLayerServiceFlags = newValue
                }
            }
            _modify {
                var value = self.caLayerServiceFlags
                yield &value
                self.caLayerServiceFlags = value
            }
        }
        
        var renderThreadPriority: Int32 {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }
        
        public init() {
            assertUnimplemented()
        }
        
        init(configuration: EngineConfiguration) {
            self.core = configuration.clone()
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
        self.configuration = __Engine.Configuration(
            configuration: EngineConfiguration(
                coreConfiguration: configurationRef
            )
        )
        
        // <+188>
        self.queue = configurationRef.engineQueue!
        
        if self.configuration.core.enableInteractions {
            __Engine.__ensureInteractionsComponentIsRegistered()
            __Engine.__ensureBuiltInComponentsAreRegistered()
        } else {
            __Engine.__ensureBuiltInComponentsAreRegistered()
        }
        
        // <+260>
        self.services = __ServiceLocator(engine: self)
        
        // <+340>
        unsafe unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
            .setCallbacksEx(nil) { ptr in
                return unsafe engineRenderCallback(coreEngine: unsafeBitCast(ptr, to: OpaquePointer.self))
            }
        
#if RealityKitCompatibility
        unsafe unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
            .myRealityKitRef = self
#else
        unsafe unsafeBitCast(coreEngine, to: CoreRE::Engine.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
#endif
        
        // <+372>
        if __ServiceLocator.hasSharedServiceLocator {
            __ServiceLocator.__sharedEngine = self
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
        _ = builtInComponentsInitializer
    }
    
    public static func __ensureInteractionsComponentIsRegistered() {
        _ = interactionComponentInitializer
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
    
    final func __registerREKitBuiltInActions() {
        PlayAnimationAction.__register()
        PlayAnimationAction.__registerCodable()
        
        PlayAnimationActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE013PlayAnimationJ0VGcfU_
            assertUnimplemented()
        }
        
        NotificationAction.__register()
        NotificationAction.__registerCodable()
        
        NotificationActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE012NotificationJ0VGcfU0_
            assertUnimplemented()
        }
        
        SetEntityEnabledAction.__register()
        SetEntityEnabledAction.__registerCodable()
        SetEntityEnabledActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE016SetEntityEnabledJ0VGcfU1_
            assertUnimplemented()
        }
        
        ImpulseAction.__register()
        ImpulseAction.__registerCodable()
        ImpulseActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE07ImpulseJ0VGcfU2_
            assertUnimplemented()
        }
        
        OrbitEntityAction.__register()
        OrbitEntityAction.__registerCodable()
        OrbitEntityActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE011OrbitEntityJ0VGcfU3_
            assertUnimplemented()
        }
        
        SpinAction.__register()
        SpinAction.__registerCodable()
        SpinActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE04SpinJ0VGcfU4_
            assertUnimplemented()
        }
        
        BillboardAction.__register()
        BillboardAction.__registerCodable()
        BillboardActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE09BillboardJ0VGcfU5_
            assertUnimplemented()
        }
        
        FromToByAction<Float>.__register()
        FromToByAction<Float>.__registerCodable()
        FromToByActionHandler<Float>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VySfGGcfU6_
            assertUnimplemented()
        }
        
        FromToByAction<Double>.__register()
        FromToByAction<Double>.__registerCodable()
        FromToByActionHandler<Double>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VySdGGcfU7_
            assertUnimplemented()
        }
        
        FromToByAction<SIMD2<Float>>.__register()
        FromToByAction<SIMD2<Float>>.__registerCodable()
        FromToByActionHandler<SIMD2<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0Vys5SIMD2VySfGGGcfU8_
            assertUnimplemented()
        }
        
        FromToByAction<SIMD3<Float>>.__register()
        FromToByAction<SIMD3<Float>>.__registerCodable()
        FromToByActionHandler<SIMD3<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0Vys5SIMD3VySfGGGcfU9_
            assertUnimplemented()
        }
        
        FromToByAction<SIMD4<Float>>.__register()
        FromToByAction<SIMD4<Float>>.__registerCodable()
        FromToByActionHandler<SIMD4<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0Vys5SIMD4VySfGGGcfU10_
            assertUnimplemented()
        }
        
        FromToByAction<simd_quatf>.__register()
        FromToByAction<simd_quatf>.__registerCodable()
        FromToByActionHandler<simd_quatf>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VySo10simd_quatfaGGcfU11_
            assertUnimplemented()
        }
        
        FromToByAction<Transform>.__register()
        FromToByAction<Transform>.__registerCodable()
        FromToByActionHandler<Transform>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VyAA9TransformVGGcfU12_
            assertUnimplemented()
        }
        
        FromToByAction<JointTransforms>.__register()
        FromToByAction<JointTransforms>.__registerCodable()
        FromToByActionHandler<JointTransforms>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VyAE15JointTransformsVGGcfU13_
            assertUnimplemented()
        }
        
        FromToByAction<BlendShapeWeights>.__register()
        FromToByAction<BlendShapeWeights>.__registerCodable()
        FromToByActionHandler<BlendShapeWeights>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE08FromToByJ0VyAE17BlendShapeWeightsVGGcfU14_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<Float>.__register()
        SetEntityPropertyAction<Float>.__registerCodable()
        SetEntityPropertyActionHandler<Float>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySfGGcfU15_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<Double>.__register()
        SetEntityPropertyAction<Double>.__registerCodable()
        SetEntityPropertyActionHandler<Double>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySdGGcfU16_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<SIMD2<Float>>.__register()
        SetEntityPropertyAction<SIMD2<Float>>.__registerCodable()
        SetEntityPropertyActionHandler<SIMD2<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0Vys5SIMD2VySfGGGcfU17_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<SIMD3<Float>>.__register()
        SetEntityPropertyAction<SIMD3<Float>>.__registerCodable()
        SetEntityPropertyActionHandler<SIMD3<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0Vys5SIMD3VySfGGGcfU18_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<SIMD4<Float>>.__register()
        SetEntityPropertyAction<SIMD4<Float>>.__registerCodable()
        SetEntityPropertyActionHandler<SIMD4<Float>>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0Vys5SIMD4VySfGGGcfU19_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<simd_quatf>.__register()
        SetEntityPropertyAction<simd_quatf>.__registerCodable()
        SetEntityPropertyActionHandler<simd_quatf>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySo10simd_quatfaGGcfU20_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<Int>.__register()
        SetEntityPropertyAction<Int>.__registerCodable()
        SetEntityPropertyActionHandler<Int>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySiGGcfU21_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<Bool>.__register()
        SetEntityPropertyAction<Bool>.__registerCodable()
        SetEntityPropertyActionHandler<Bool>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySbGGcfU22_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<String>.__register()
        SetEntityPropertyAction<String>.__registerCodable()
        SetEntityPropertyActionHandler<String>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VySSGGcfU23_
            assertUnimplemented()
        }
        
        SetEntityPropertyAction<Transform>.__register()
        SetEntityPropertyAction<Transform>.__registerCodable()
        SetEntityPropertyActionHandler<Transform>.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE017SetEntityPropertyJ0VyAA9TransformVGGcfU24_
            assertUnimplemented()
        }
        
        PlayAudioAction.__register()
        PlayAudioAction.__registerCodable()
        PlayAudioActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE09PlayAudioJ0VGcfU25_
            assertUnimplemented()
        }
        
        EmphasizeAction.__register()
        EmphasizeAction.__registerCodable()
        EmphasizeActionHandler.__registerCommon(engine: self) { _ in
            // $s10RealityKit8__EngineC29__registerREKitBuiltInActionsyyF0A10Foundation21ActionHandlerProtocol_pSgAE0J5EventVyAE09EmphasizeJ0VGcfU26_
            assertUnimplemented()
        }
    }
    
    final func __registerREKitBuiltInForceEffects() {
        ConstantForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE08ConstanthK0VGzcfU_
            assertUnimplemented()
        }
        
        ConstantRadialForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE014ConstantRadialhK0VGzcfU0_
            assertUnimplemented()
        }
        
        RadialForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE06RadialhK0VGzcfU1_
            assertUnimplemented()
        }
        
        VortexForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE06VortexhK0VGzcfU2_
            assertUnimplemented()
        }
        
        DragForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE04DraghK0VGzcfU3_
            assertUnimplemented()
        }
        
        TurbulenceForceEffect.__register(engine: self) { _ in
            // $s10RealityKit8__EngineC34__registerREKitBuiltInForceEffectsyyFy0A10Foundation0H11EffectEventVyAE010TurbulencehK0VGzcfU4_
            assertUnimplemented()
        }
    }
    
    fileprivate final func commonPostInit() {
        // sp + 0x30
        let copy_1 = self.services.assetService
        // x21
        let instance = __RealityFileURLResolver.instances
            .instance(for: copy_1)
        
        _ = self.services!
        _ = unsafe instance.assetService.__handle
        
        // x20
        let services = self.services!
        // x21
        let namedFileAssetResolver = self.namedFileAssetResolver
        // x20
        let handle = unsafe services.assetService.__handle
        
        unsafe unsafeBitCast(handle, to: CoreRE::AssetManager.self)
            .registerAssetResolver(
//                "localfile",
                "mr_localfile",
                Unmanaged.passUnretained(namedFileAssetResolver).toOpaque(),
                namedFileAssetResolver.callback
            )
        
        // <+376>
        let serviceLocator = unsafe unsafeBitCast(self.coreEngine, to: CoreRE::Engine.self)
            .serviceLocator
        
        if let audioSceneService = serviceLocator.audioSceneService {
            audioSceneService.stsControl = true
            audioSceneService.externalSourceControl = true
        }
        
        // <+416>
        let configuration = self.configuration
        
        if configuration.__createServices.core.contains(.unknown2) {
            self.__registerREKitBuiltInActions()
        }
        
        if configuration.__createServices.core.contains(.unknown5) {
            self.__registerREKitBuiltInForceEffects()
        }
        
        // <+572>
    }
    
    @safe nonisolated(unsafe) static let customComponents : [any RegisterableComponent.Type] = [
        __RKSceneUUIDComponent.self,
        __RKScenePhysics.self,
        __REAnchoring.self,
        __RKEntityUUIDComponent.self,
        __RKEntityTagsComponent.self
    ]
    
    fileprivate nonisolated(unsafe) static var customComponentsRegistered = false
    fileprivate nonisolated(unsafe) static var interactionsComponentsRegistered = false
}

final class EngineConfiguration {
    private(set) var coreConfiguration: CoreRE::Engine.Configuration
    
    init() {
        self.coreConfiguration = CoreRE::Engine.Configuration()
    }
    
    @inline(__always) // 원래 없음
    init(coreConfiguration: CoreRE::Engine.Configuration) {
        unsafe __RERetain(unsafeBitCast(coreConfiguration, to: OpaquePointer.self))
        self.coreConfiguration = coreConfiguration
    }
    
    deinit {
        unsafe __RERelease(unsafeBitCast(self.coreConfiguration, to: OpaquePointer.self))
    }
    
    var instanceID: String {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var unsafeUserDataPointer: UnsafeMutableRawPointer? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var engineClockMode: __EngineClockModeRef {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var engineServicesToCreate: __EngineServiceMaskRef {
        get {
            return __EngineServiceMaskRef(
                core: self.coreConfiguration.servicesToCreate
            )
        }
        set {
            self.coreConfiguration.servicesToCreate = newValue.core
        }
        _modify {
            var value = __EngineServiceMaskRef(
                core: self.coreConfiguration.servicesToCreate
            )
            yield &value
            self.coreConfiguration.servicesToCreate = value.core
        }
    }
    
    var engineServicesToUpdate: __EngineServiceMaskRef {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var engineStartupOptions: __StartupOptionsRef {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var engineQueue: DispatchQueue? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var metalDevice: (any MTLDevice)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var useMetal: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var forExportOnly: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var enableVideoSupport: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var enablePreloadEngineAssets: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var enablePreloadMXIAssets: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var useRealityIO: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var usePhysicsSceneSystem: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var assetRuntimeSizeLimit: UInt64 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var disableRenderGraphCaching: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var engineRenderFlags: __RenderFlagsRef {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var isHostingSharedAudioSimulation: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var caLayerServicesServer: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var caLayerServiceFlags: MyRealityFoundation::CALayerServiceFlags {
        get {
            return MyRealityFoundation::CALayerServiceFlags(
                core: self.coreConfiguration.caLayerServiceFlags
            )
        }
        set {
            self.coreConfiguration.caLayerServiceFlags = newValue.core
        }
        _modify {
            var value = MyRealityFoundation::CALayerServiceFlags(
                core: self.coreConfiguration.caLayerServiceFlags
            )
            yield &value
            self.coreConfiguration.caLayerServiceFlags = value.core
        }
    }
    
    var enableInteractions: Bool {
        get {
            return self.coreConfiguration.enableInteractions
        }
        set {
            self.coreConfiguration.enableInteractions = newValue
        }
        _modify {
            var value = self.coreConfiguration.enableInteractions
            yield &value
            self.coreConfiguration.enableInteractions = value
        }
    }
    
    var enableCommitSynchronously: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    func setRenderThreadInitCallback(_: () -> Void) {
        assertUnimplemented()
    }
    
    var renderThreadPriority: Int32 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var renderFrameOverlap: Int32 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    func clone() -> EngineConfiguration {
        let ref = self.coreConfiguration.clone()
        return EngineConfiguration(coreConfiguration: ref)
    }
}

fileprivate nonisolated func engineRenderCallback(coreEngine: OpaquePointer) -> CoreRE::EventHandlerResult {
    assertUnimplemented()
}

extension __Engine {
    static func makeSharedEngine(_: __Engine.Configuration) -> __Engine {
        assertUnimplemented()
    }
}

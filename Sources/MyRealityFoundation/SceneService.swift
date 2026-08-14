// 78C7AC4C62C2AF6C307D1A28F168722B
internal import CoreRE
private import os.log
private import CoreFoundation
private import Foundation
private import Observation

@safe @MainActor @preconcurrency final class SceneManager {
    static nonisolated func customComponentType(_ type: any MyRealityFoundation::Component.Type) -> OpaquePointer {
        /*
         type -> x0/x1 -> x19/x22
         */
        if let componentType = unsafe SceneManager.customComponentTypeObjectIdToHandles[ObjectIdentifier(type)] {
            return unsafe componentType
        }
        
        let componentType = unsafe SceneManager.customComponentTypeHelper(type, typeName: nil)
        // <+108>
        unsafe SceneManager.customComponentTypeObjectIdToHandles[ObjectIdentifier(type)] = componentType
        return unsafe componentType
    }
    
    private(set) var builtinComponentRegistry: BuiltInComponentRegistry // 0x10
    let coreECSManager: __REECSManagerRef // 0x18
    var scenes: [MyRealityFoundation::Scene] = [] // 0x20
    private var builtInComponentTypeToClassTable: [ObjectIdentifier : CoreRE::Component.ClassPtr] = [:] // 0x28
    private var builtInComponentClassToTypeTable: [CoreRE::Component.ClassPtr : any Component.Type] = [:] // 0x30
    
    func append(scene: MyRealityFoundation::Scene) {
        assertUnimplemented()
    }
    
    func remove(scene: MyRealityFoundation::Scene) {
        assertUnimplemented()
    }
    
    init(coreECSManager: OpaquePointer) {
        self.builtinComponentRegistry = BuiltInComponentRegistry()
        self.coreECSManager = unsafe __REECSManagerRef(core: coreECSManager)
        unsafe __RERetain(coreECSManager)
        
#if RealityKitCompatibility
        unsafe unsafeBitCast(coreECSManager, to: CoreRE::ECSService.self)
            .myRealityKitRef = self
#else
        unsafe unsafeBitCast(coreECSManager, to: CoreRE::ECSService.self)
            .swiftObject = unsafe Unmanaged.passUnretained(self).toOpaque()
#endif
        
        _ = InteractionNotificationsManager.sharedManager
        self.registerBuiltInComponents()
        self.registerObservableComponents()
    }
    
    deinit {
        assertUnimplemented()
    }
    
    static nonisolated func customComponentTypeHelper(_ type: any MyRealityFoundation::Component.Type, typeName: String?) -> OpaquePointer {
        /*
         type -> x0/x1 -> x22/x21
         typeName -> x2/x3 -> x26/x24
         */
        // x28/x19
        let handleKey = SceneManager.makeComponentTypeHandleKey(type, typeName: typeName)
        
        if let componentType = unsafe SceneManager.customComponentTypesToHandles[handleKey] {
            return unsafe componentType
        }
        
        // <+176>
        // x26/x23
        let typeName_2 = typeName ?? type.__typeName
        // x20
        let size = type.__size
        // x24
        let builder = CoreRE::StructBuilder()
        // w20
        let result = typeName_2.utf8CString.withUnsafeBufferPointer { pointer in
            return unsafe builder.initialize(
                pointer.baseAddress.unsafelyUnwrapped,
                Int32(size),
                nil,
                nil
            )
        }
        
        guard result else {
            assertionFailure("Failed to create type info for custom component.")
        }
        
        // <+344>
        unsafe type.__addIntrospectionData(unsafeBitCast(builder, to: OpaquePointer?.self))
        
        // x27
        guard let introspectionStruct = builder.registerIntrospectionStruct() else {
            assertionFailure("Failed to register type info for custom component.")
        }
        
        // <+388>
        builder.destroy()
        
        // x28
        let codableType = (type as? any Codable.Type)
        // w20 -> x29 - 0x68
        let flag_1: Bool
        if codableType != nil {
            // <+436>
            flag_1 = (type as? (any DisableRESync.Type)) == nil
        } else {
            // <+556>
            flag_1 = false
        }
        
        // <+560>
        // x29 - 0x90
        let context = unsafe CoreRE::CustomComponentTypeInfoContext(
            unknown0: 0x30,
            unknown1: 1,
            unknown2: nil,
            unknown3: { p1, p2, p3, p4, p5 in
                return unsafe ecsNetSyncWriteSnapshot(
                    p1,
                    unsafeBitCast(p2, to: OpaquePointer.self),
                    unsafeBitCast(p3, to: OpaquePointer.self),
                    unsafeBitCast(p4, to: OpaquePointer.self),
                    p5
                )
            },
            unknown4: { p1, p2, p3, p4, p5, p6 in
                return unsafe ecsNetSyncReadSnapshot(
                    p1,
                    unsafeBitCast(p2, to: OpaquePointer.self),
                    unsafeBitCast(p3, to: OpaquePointer.self),
                    unsafeBitCast(p4, to: OpaquePointer.self),
                    p5,
                    p6
                )
            },
            unknown5: flag_1
        )
        
        if codableType != nil {
            // <+616>
            unsafe RERegisterSwiftCodableCallbacks(
                { p1, p2, p3 in
                    return unsafe encodeComponent(
                        unsafeBitCast(p1, to: OpaquePointer.self),
                        unsafeBitCast(p2, to: OpaquePointer.self),
                        p3
                    )
                },
                { p1, p2, p3, p4 in
                    return unsafe decodeComponent(
                        unsafeBitCast(p1, to: OpaquePointer.self),
                        unsafeBitCast(p2, to: OpaquePointer.self),
                        p3,
                        p4
                    )
                }
            )
            // <+968>
        } else {
            // <+640>
            unsafe os_log(.default, log: .default, "%s", "CustomComponent of type \(_typeName(type, qualified: false)) does not conform to Codable. Component state network sync disabled.")
            // <+968>
        }
        
        // <+968>
        // w19
        let flag_2 = (codableType != nil)
        // w20 -> w1
        let flag_3 = (type is (any TransientComponent.Type))
        // w8 -> w25
        let flag_4 = (type is (any HiddenComponent.Type))
        
        // <+1040>
        return typeName_2.withCString { pointer_1 in
            // $s17RealityFoundation12SceneManagerC25customComponentTypeHelper_8typeNames13OpaquePointerV0A3Kit0F0_pXp_SSSgtFZAGSPys4Int8VGXEfU_TA
            return withUnsafePointer(to: context) { pointer_2 in
                let info = unsafe CustomComponentTypeInfo(
                    unknown0: 2,
                    unknown1: pointer_1,
                    unknown2: 0,
                    unknown3: nil,
                    unknown4: { p1, p2 in
                        unsafe deinitComponent(
                            componentTypeHandle: unsafeBitCast(p1, to: OpaquePointer.self),
                            rawPointer: p2
                        )
                    },
                    unknown5: nil,
                    unknown6: nil,
                    unknown7: nil,
                    unknown8: 0,
                    unknown9: introspectionStruct,
                    unknown10: pointer_2
                )
                
                return withUnsafePointer(to: info) { pointer_3 in
                    // x23
                    guard let componentClass = unsafe CoreRE::Component.ClassPtr.createCustomComponentType(info: pointer_3, isTransient: flag_3) else {
                        assertionFailure("Could not create custom component type.")
                    }
                    
                    unsafe componentClass.setCloneCallback { p1 in
                        let result = unsafe cloneComponent(
                            unsafeBitCast(p1, to: OpaquePointer.self)
                        )
                        
                        return unsafe unsafeBitCast(result, to: UnsafeMutableRawPointer.self)
                    }
                    
                    if flag_2 {
                        unsafe CoreRE::Component.registerSwiftCodableComponent("CustomComponent\(typeName_2)")
                    }
                    
                    // <+240>
                    if flag_4 {
                        let bundle = Bundle(for: SceneManager.self)
                        
                        unsafe type.registerBuiltin(
                            bundle: bundle,
                            reComponentClass: nil,
                            access: .internal,
                            availability: ComponentInfo.Availability(
                                introduced: [],
                                deprecated: nil,
                                obsoleted: nil
                            )
                        )
                    }
                    
                    // <+376>
                    unsafe SceneManager.customComponentTypesToHandles[handleKey] = unsafeBitCast(componentClass, to: OpaquePointer.self)
                    unsafe SceneManager.handlesToCustomComponentTypes[unsafeBitCast(componentClass, to: OpaquePointer.self)] = type
                    
                    return unsafe unsafeBitCast(componentClass, to: OpaquePointer.self)
                }
            }
        }
    }
    
    func registerBuiltInType(_ type: any MyRealityFoundation::Component.Type, typeEnum: CoreRE::ComponentType) {
        let componentClassPtr = CoreRE::Component.ClassPtr.fromType(typeEnum)!
        self.builtInComponentTypeToClassTable[ObjectIdentifier(type)] = componentClassPtr
    }
    
    nonisolated func componentTypeToComponentClass(_ type: any MyRealityFoundation::Component.Type) -> OpaquePointer? {
        if let componentType = self.builtInComponentTypeToClassTable[ObjectIdentifier(type)] {
            return unsafe unsafeBitCast(componentType, to: OpaquePointer.self)
        }
        
        switch type.coreComponentType.originType {
        case .system(let classPtr):
            // <+132>
            self.builtInComponentTypeToClassTable[ObjectIdentifier(type)] = classPtr
            return unsafe unsafeBitCast(classPtr, to: OpaquePointer.self)
        case .custom:
            // <+240>
            let key = SceneManager.makeComponentTypeHandleKey(type, typeName: nil)
            return unsafe SceneManager.customComponentTypesToHandles[key]
        }
    }
    
    func componentClassToComponentType(_ componentClass: OpaquePointer) -> any MyRealityFoundation::Component.Type? {
        assertUnimplemented()
    }
    
    fileprivate static nonisolated func makeComponentTypeHandleKey(_ type: (any MyRealityFoundation::Component.Type), typeName: String?) -> String {
        if let typeName {
            // <+32>
            return "\(UInt(bitPattern: ObjectIdentifier(type)).description)_\(typeName)"
        } else {
            // <+156>
            if let key = unsafe SceneManager.customComponentTypesToKeys[ObjectIdentifier(type)] {
                return key
            } else {
                // <+264>
                let key = UInt(bitPattern: ObjectIdentifier(type)).description
                unsafe SceneManager.customComponentTypesToKeys[ObjectIdentifier(type)] = key
                return key
            }
        }
    }
    
    static func unregisterCustomComponents() {
        assertUnimplemented()
    }
    
    func registerBuiltInComponents() {
        // self -> x20 -> x19 + 0x68
        // x23 -> x19 + 0x60
        let platforms_1: [ComponentInfo.SupportedPlatform] = [
            .macOS("10.15"),
            .macCatalyst("13.0"),
            .iOS("13.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+532>
        // x23 -> x19 + 0x40
        let platforms_2: [ComponentInfo.SupportedPlatform] = [
            .macOS("10.15.4"),
            .macCatalyst("13.4"),
            .iOS("13.4"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+916>
        // x23 -> x19 + 0x38
        let platforms_3: [ComponentInfo.SupportedPlatform] = [
            .macOS("10.15"),
            .macCatalyst("14.0"),
            .iOS("13.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+1288>
        // x21 -> x19 + 0x20
        let platforms_4: [ComponentInfo.SupportedPlatform] = [
            .macCatalyst("14.0"),
            .iOS("13.0"),
            .visionOS("1.0")
        ]
        
        // <+1516>
        // x23 -> x19 + 0x48
        let platforms_5: [ComponentInfo.SupportedPlatform] = [
            .macOS("11.0"),
            .macCatalyst("14.0"),
            .iOS("14.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+1896>
        // x23 -> x19 + 0x8
        let platforms_6: [ComponentInfo.SupportedPlatform] = [
            .macOS("12.0"),
            .macCatalyst("15.0"),
            .iOS("15.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+2260>
        // x23 -> x19 + 0x50
        let platforms_7: [ComponentInfo.SupportedPlatform] = [
            .macOS("14.0"),
            .macCatalyst("17.0"),
            .iOS("17.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+2616>
        // x23 -> x19 + 0x10
        let platforms_8: [ComponentInfo.SupportedPlatform] = [
            .macOS("15.0"),
            .macCatalyst("18.0"),
            .iOS("18.0"),
            .visionOS("1.0"),
            .tvOS("26.0")
        ]
        
        // <+2972>
        // x24 -> x19
        let platforms_9: [ComponentInfo.SupportedPlatform] = [
            .macOS("10.15"),
            .macCatalyst("13.0"),
            .iOS("13.0"),
            .visionOS("2.0"),
            .tvOS("26.0")
        ]
        
        // <+3340>
        // x23 -> x19 + 0x30
        let platforms_10: [ComponentInfo.SupportedPlatform] = [
            .macOS("15.0"),
            .macCatalyst("18.0"),
            .iOS("18.0"),
            .visionOS("2.0"),
            .tvOS("26.0")
        ]
        
        // <+3700>
        // x21 -> x19 + 0x18
        let platforms_11: [ComponentInfo.SupportedPlatform] = [
            .visionOS("2.0"),
        ]
        
        // <+3804>
        // x23 -> x19 + 0x28
        let platforms_12: [ComponentInfo.SupportedPlatform] = [
            .macOS("15.1"),
            .macCatalyst("18.1"),
            .iOS("18.1"),
            .visionOS("2.1"),
            .tvOS("26.0")
        ]
        
        // <+4172>
        // x23 -> x19 + 0x70
        let platforms_13: [ComponentInfo.SupportedPlatform] = [
            .macOS("26.0"),
            .macCatalyst("26.0"),
            .iOS("26.0"),
            .visionOS("26.0"),
            .tvOS("26.0")
        ]
        
        // <+4532>
        let bundleIdentifier = Bundle(for: BuiltInComponentRegistry.self).bundleIdentifier ?? "com.apple.RealityFoundation"
        
        func register(
            type: any MyRealityFoundation::Component.Type,
            reComponentClass: CoreRE::Component.ClassPtr?,
            reComponentType: CoreRE::ComponentType?,
            access: ComponentInfo.Access,
            availability: ComponentInfo.Availability
        ) {
            let componentClass: CoreRE::Component.ClassPtr?
            if let reComponentClass {
                componentClass = reComponentClass
            } else {
                componentClass = unsafe unsafeBitCast(self.componentTypeToComponentClass(type), to: CoreRE::Component.ClassPtr?.self)
            }
            
            let componentInfo = ComponentInfo(
                bundleIdentifier: bundleIdentifier,
                type: type,
                reComponentType: reComponentType,
                reComponentClass: componentClass,
                access: access,
                availability: availability
            )
            
            // inlined
            self.builtinComponentRegistry.register(componentInfo)
            
            if let reComponentType {
                _ = CoreRE::Component.ClassPtr.fromType(reComponentType)
                self.registerBuiltInType(type, typeEnum: reComponentType)
            }
        }
        
        // <+4672>
        // inlined
        register(
            type: PhysicsBodyComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.rigidBody,
            reComponentType: .rigidBody,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        // <+5084>
        // inlined
        register(
            type: PhysicsMotionComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.motionState,
            reComponentType: .physicsMotion,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        // <+5472>
        register(
            type: PointLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.pointLight,
            reComponentType: .pointLight,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_9,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: CollisionComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.collider,
            reComponentType: .collider,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: DirectionalLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.directionalLight,
            reComponentType: .directionalLight,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_9,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: DirectionalLightComponent.Shadow.self,
            reComponentClass: CoreRE::Component.ClassPtr.shadowMap,
            reComponentType: .shadowMap,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ModelComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.mesh,
            reComponentType: .mesh,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: PerspectiveCameraComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.perspectiveCamera,
            reComponentType: .perspectiveCamera,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SpotLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.spotLight,
            reComponentType: .spotLight,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_9,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SpotLightComponent.Shadow.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SynchronizationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.network,
            reComponentType: .network,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: Transform.self,
            reComponentClass: CoreRE::Component.ClassPtr.transform,
            reComponentType: .transform,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AnchoringComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.anchoring,
            reComponentType: .anchoring,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_3,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __EntityInfoComponent.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AREnvironmentProbeComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.arEnvironmentProbe,
            reComponentType: .arEnvironmentProbe,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: VideoComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.video,
            reComponentType: .video,
            access: .internal,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: VFXComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.vfxScene,
            reComponentType: .vfxScene,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __AccessibilityComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.accessibility,
            reComponentType: .accessibility,
            access: .internal,
            availability: ComponentInfo.Availability(
                introduced: platforms_2,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __AmbientLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.ambientLight,
            reComponentType: .ambientLight,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: RKARSegmentationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.arSegmentation,
            reComponentType: .arSegmentation,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_1,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ModelDebugOptionsComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.debugMesh,
            reComponentType: .debugMesh,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_5,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: CharacterControllerComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.characterController,
            reComponentType: .characterController,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: CharacterControllerStateComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.characterControllerState,
            reComponentType: .characterControllerState,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __ImageBasedLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.imageBasedLight,
            reComponentType: .imageBasedLight,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __SkyboxComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.skybox,
            reComponentType: .skybox,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: EventSubscriptionComponent.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SceneOriginComponent.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_6,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AccessibilityComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.accessibility,
            reComponentType: .accessibility,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_7,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: VideoPlayerComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.videoPlayer,
            reComponentType: .videoPlayer,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: PhysicsSimulationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.physicsSimulation,
            reComponentType: .physicsSimulation,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ImageBasedLightComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.imageBasedLight,
            reComponentType: .imageBasedLight,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ImageBasedLightReceiverComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.imageBasedLightReceiver,
            reComponentType: .imageBasedLightReceiver,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: DirectionalLightComponent.Shadow.self,
            reComponentClass: CoreRE::Component.ClassPtr.directionalLightShadowMap,
            reComponentType: .directionalLightShadowMap,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SpotLightComponent.Shadow.self,
            reComponentClass: CoreRE::Component.ClassPtr.spotLightShadowMap,
            reComponentType: .spotLightShadowMap,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: OpacityComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.hierarchicalFade,
            reComponentType: .hierarchicalFade,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: PointLightComponent.Shadow.self,
            reComponentClass: CoreRE::Component.ClassPtr.pointLightShadowMap,
            reComponentType: .pointLightShadowMap,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ModelSortGroupComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.meshSorting,
            reComponentType: .meshSorting,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AdaptiveResolutionComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.adaptiveResolution,
            reComponentType: .adaptiveResolution,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ChannelAudioComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.channelAudio,
            reComponentType: .channelAudio,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AmbientAudioComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.ambientAudio,
            reComponentType: .ambientAudio,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SpatialAudioComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.spatialAudio,
            reComponentType: .spatialAudio,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AudioMixGroupsComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.audioMixGroups,
            reComponentType: .audioMixGroups,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ParticleEmitterComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.vfxEmitter,
            reComponentType: .vfxEmitter,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: PortalComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.portal,
            reComponentType: .portal,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: WorldComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.worldRoot,
            reComponentType: .worldRoot,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: TextComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.text,
            reComponentType: .text,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: GroundingShadowComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.groundingShadow,
            reComponentType: .groundingShadow,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: InputTargetComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.inputTarget,
            reComponentType: .inputTarget,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: HoverEffectComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.remoteEffects,
            reComponentType: .remoteEffects,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AcousticModelComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.acousticMesh,
            reComponentType: .acousticMesh,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SceneUnderstandingComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.sceneUnderstanding,
            reComponentType: .sceneUnderstanding,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_4,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: __CGContextComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.cgContext,
            reComponentType: .cgContext,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_8,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: GeometricPinsComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.pin,
            reComponentType: .pin,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: PhysicsJointsComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.physicsJoints,
            reComponentType: .physicsJoints,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: OrthographicCameraComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.orthographicCamera,
            reComponentType: .orthographicCamera,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ProjectiveTransformCameraComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.customMatrixCamera,
            reComponentType: .customMatrixCamera,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: VirtualEnvironmentProbeComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.virtualEnvironmentProbe,
            reComponentType: .virtualEnvironmentProbe,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: IKComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.ikParameters,
            reComponentType: .ikParameters,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: SkeletalPosesComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.skeletalPose,
            reComponentType: .skeletalPose,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: BlendShapeWeightsComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.blendShapeWeights,
            reComponentType: .blendShapeWeights,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ReferenceComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.reference,
            reComponentType: .reference,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: EnvironmentLightingConfigurationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.environmentLightingConfiguration,
            reComponentType: .environmentLightingConfiguration,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: DynamicLightShadowComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.dynamicLightShadow,
            reComponentType: .dynamicLightShadow,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ReverbComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.reverb,
            reComponentType: .reverb,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ForceEffectComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.forceEffect,
            reComponentType: .forceEffect,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AudioLibraryComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.audioLibrary,
            reComponentType: .audioLibrary,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: BillboardComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.billboard,
            reComponentType: .billboard,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AnimationLibraryComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.animationLibrary,
            reComponentType: .animationLibrary,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_10,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: DockingRegionComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.dockingRegion,
            reComponentType: .dockingRegion,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_11,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ClippingPrimitiveComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.clippingPrimitive,
            reComponentType: .clippingPrimitive,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_12,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: MeshInstancesComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.meshPartInstances,
            reComponentType: .meshPartInstances,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AttachedTransformComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.attachedTransform,
            reComponentType: .attachedTransform,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ImagePresentationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.imagePresentation,
            reComponentType: .imagePresentation,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: EnvironmentBlendingComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.occlusion,
            reComponentType: .environmentBlending,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ManipulationComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.transformInteraction,
            reComponentType: .transformInteraction,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ManipulationComponent.HitTarget.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .api,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: ClippingExceptionComponent.self,
            reComponentClass: nil,
            reComponentType: nil,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        register(
            type: AudioGroupPlaybackComponent.self,
            reComponentClass: CoreRE::Component.ClassPtr.audioGroupPlayback,
            reComponentType: .audioGroupPlayback,
            access: .spi,
            availability: ComponentInfo.Availability(
                introduced: platforms_13,
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        // <+22232>
//        if let registryClass = NSClassFromString("_RealityKit_SwiftUI.__RealityKitOverlayRegistry") {
        if let registryClass = NSClassFromString("_MyRealityKit_MySwiftUI.__RealityKitOverlayRegistry") as? ExternalBuiltInComponentRegistry.Type {
            let bundleIdentifier = Bundle(for: registryClass).bundleIdentifier ?? "com.apple._RealityKit_SwiftUI"
            
            registryClass.registerBuiltInComponents { type, reComponentClass, reComponentType, access, availability in
                // $s17RealityFoundation12SceneManagerC25registerBuiltInComponentsyyF0E8ExternalL_4type16reComponentClass0kL4Type6access12availabilityy0A3Kit0L0_pXp_So011REComponentM3PtraSgSo0rN0VSgAA0L4InfoV6AccessOAT12AvailabilityVtFTA
                let componentClass: CoreRE::Component.ClassPtr?
                if let reComponentClass {
                    componentClass = reComponentClass
                } else {
                    componentClass = unsafe unsafeBitCast(self.componentTypeToComponentClass(type), to: CoreRE::Component.ClassPtr?.self)
                }
                
                let componentInfo = ComponentInfo(
                    bundleIdentifier: bundleIdentifier,
                    type: type,
                    reComponentType: reComponentType,
                    reComponentClass: componentClass,
                    access: access,
                    availability: availability
                )
                
                // inlined
                self.builtinComponentRegistry.register(componentInfo)
                
                if let reComponentType {
                    _ = CoreRE::Component.ClassPtr.fromType(reComponentType)
                    self.registerBuiltInType(type, typeEnum: reComponentType)
                }
            }
        }
        
        // <+22488>
    }
    
    func registerObservableComponents() {
        CoreRE::ObservationKeyPathTable.entityModifyChildrenKeyPath = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::Entity.ChildCollection.self,
            keyPath: \MyRealityFoundation::Entity.children
        )
        
        let transformComponentPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.transform,
            to: OpaquePointer.self
        )
        
        let transformValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::Transform?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::Transform.self)]
        )
        
        var table: [OpaquePointer : CoreRE::ObservationKeyPathTable.Value] = unsafe [:]
        
        unsafe table[transformComponentPtr] = transformValue
        
        // <+248>
        let hierarchicalFadeComponentPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.hierarchicalFade,
            to: OpaquePointer.self
        )
        
        let hierarchicalFadeValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::OpacityComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::OpacityComponent.self)]
        )
        
        unsafe table[hierarchicalFadeComponentPtr] = hierarchicalFadeValue
        
        // <+360>
        let materialParameterBlockArrayComponentPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.materialParameterBlockArray,
            to: OpaquePointer.self
        )
        
        let materialParameterBlockArrayValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::ModelComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::ModelComponent.self)]
        )
        
        unsafe table[materialParameterBlockArrayComponentPtr] = materialParameterBlockArrayValue
        
        // <+472>
        let isPausedKey = Array("AnimationPlaybackController.isPaused".utf8CString)
        
        let isPausedValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.isPaused
        )
        
        var stringTable: [[Int8] : CoreRE::ObservationKeyPathTable.Value] = [:]
        stringTable[isPausedKey] = isPausedValue
        
        // <+632>
        let isStoppedKey = Array("AnimationPlaybackController.isStopped".utf8CString)
        
        let isStoppedValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.isStopped
        )
        
        stringTable[isStoppedKey] = isStoppedValue
        
        // <+736>
        let isPlayingKey = Array("AnimationPlaybackController.isPlaying".utf8CString)
        
        let isPlayingValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.isPlaying
        )
        
        stringTable[isPlayingKey] = isPlayingValue
        
        // <+840>
        let timeKey = Array("AnimationPlaybackController.time".utf8CString)
        
        let timeValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: TimeInterval.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.time
        )
        
        stringTable[timeKey] = timeValue
        
        // <+944>
        let isCompleteKey = Array("AnimationPlaybackController.isComplete".utf8CString)
        
        let isCompleteValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.isComplete
        )
        
        stringTable[isCompleteKey] = isCompleteValue
        
        // <+1044>
        let isValidKey = Array("AnimationPlaybackController.isValid".utf8CString)
        
        let isValidValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::AnimationPlaybackController.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::AnimationPlaybackController.isValid
        )
        
        stringTable[isValidKey] = isValidValue
        
        // <+1140>
        let isEnabledKey = Array("Entity.isEnabled".utf8CString)
        
        let isEnabledValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: Bool.self,
            keyPath: \MyRealityFoundation::Entity.isEnabled
        )
        
        stringTable[isEnabledKey] = isEnabledValue
        
        // <+1244>
        let adaptiveResolutionStateClassPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.adaptiveResolutionState,
            to: OpaquePointer.self
        )
        
        let adaptiveResolutionStateValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::AdaptiveResolutionComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::AdaptiveResolutionComponent.self)]
        )
        
        unsafe table[adaptiveResolutionStateClassPtr] = adaptiveResolutionStateValue
        
        // <+1352>
        let referenceClassPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.reference,
            to: OpaquePointer.self
        )
        
        let referenceValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::ReferenceComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::ReferenceComponent.self)]
        )
        
        unsafe table[referenceClassPtr] = referenceValue
        
        // <+1464>
        let imagePresentationStatusClassPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.imagePresentationStatus,
            to: OpaquePointer.self
        )
        
        let imagePresentationStatusValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::ImagePresentationComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::ImagePresentationComponent.self)]
        )
        
        unsafe table[imagePresentationStatusClassPtr] = imagePresentationStatusValue
        
        // <+1576>
        let spatialMediaStatusClassPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.spatialMediaStatus,
            to: OpaquePointer.self
        )
        
        let spatialMediaStatusValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::SpatialMediaComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::SpatialMediaComponent.self)]
        )
        
        unsafe table[spatialMediaStatusClassPtr] = spatialMediaStatusValue
        
        // <+1688>
        let videoPlayerStatusClassPtr = unsafe unsafeBitCast(
            CoreRE::Component.ClassPtr.videoPlayerStatus,
            to: OpaquePointer.self
        )
        
        let videoPlayerStatusValue = CoreRE::ObservationKeyPathTable.Value(
            subjectType: MyRealityFoundation::Entity.self,
            memberType: MyRealityFoundation::VideoPlayerComponent?.self,
            keyPath: \MyRealityFoundation::Entity.components[HashableMetatype(MyRealityFoundation::VideoPlayerComponent.self)]
        )
        
        unsafe table[videoPlayerStatusClassPtr] = videoPlayerStatusValue
        
        // <+1800>
        unsafe CoreRE::ObservationKeyPathTable
            .initializeTables(table: table, stringTable: stringTable)
    }
    
    static nonisolated(unsafe) var customComponentTypesToHandles: [String : OpaquePointer] = unsafe [:]
    static nonisolated(unsafe) var handlesToCustomComponentTypes: [OpaquePointer : any MyRealityFoundation::Component.Type] = unsafe [:]
    static nonisolated(unsafe) var customComponentTypesToKeys: [ObjectIdentifier : String] = [:]
    static nonisolated(unsafe) var customComponentTypeObjectIdToHandles: [ObjectIdentifier : OpaquePointer] = unsafe [:]
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __SceneService {
    var scenes: [Scene] { get }
    func append(scene: Scene)
    func remove(scene: Scene)
    var coreECSManager: __REECSManagerRef { get }
}

fileprivate nonisolated func encodeComponent(_: OpaquePointer, _: OpaquePointer, _: UnsafePointer<Int8>) -> Unmanaged<CFData>? {
    assertUnimplemented()
}

fileprivate nonisolated func decodeComponent(_: OpaquePointer, _: OpaquePointer, _: CFData, _: UnsafePointer<Int8>) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func deinitComponent(componentTypeHandle: OpaquePointer, rawPointer: UnsafeMutableRawPointer) {
    assertUnimplemented()
}

fileprivate nonisolated func ecsNetSyncReadSnapshot(_: UnsafeMutableRawPointer?, _: OpaquePointer, _: OpaquePointer, _: OpaquePointer, _: UnsafeRawPointer, _: Int64) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func ecsNetSyncWriteSnapshot(_: UnsafeMutableRawPointer?, _: OpaquePointer, _: OpaquePointer, _: OpaquePointer, _: UnsafeMutableRawPointer) -> Bool {
    assertUnimplemented()
}

fileprivate nonisolated func cloneComponent(_: OpaquePointer) -> OpaquePointer {
    assertUnimplemented()
}

extension SceneManager : @preconcurrency __SceneService {}

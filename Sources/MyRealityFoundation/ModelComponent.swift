private import CoreRE
private import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct ModelComponent : Component {
    public var mesh: MeshResource
    public var materials: [any Material]
    private var _boundsMargin: Float
    private var deformation: _Proto_MeshDeformation_v1
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var boundsMargin: Float {
        get {
            return self._boundsMargin
        }
        set {
            self._boundsMargin = newValue
        }
        _modify {
            yield &self._boundsMargin
        }
    }
    
    public init(mesh: MeshResource, materials: [any Material]) {
        self._boundsMargin = 0
        self.mesh = mesh
        self.materials = materials
        self.deformation = _Proto_MeshDeformation_v1()
    }
    
    init(mesh: MeshResource, materials: [any Material], deformation: _Proto_MeshDeformation_v1) {
        self._boundsMargin = 0
        self.mesh = mesh
        self.materials = materials
        self.deformation = deformation
    }
    
    init(mesh: MeshResource, materials: [any Material], _ block: () -> [_Proto_MeshDeformation_v1.Stack]) throws {
        let deformation = try _Proto_MeshDeformation_v1(block)
        self.mesh = mesh
        self.materials = materials
        self._boundsMargin = 0
        self.deformation = deformation
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension ModelComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> ModelComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef, borrowStrongReference: Bool) -> ModelComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef, returnStrongReference: Bool) {
        /*
         self -> x20
         ccoreComponent -> x0 -> x21 -> x19 + 0x68
         returnStrongReference -> w1 -> x19 + 0xa8
         
         self.mesh -> x22
         self.materials -> x27
         self.deformation -> x19 + 0x20
         */
        // x19 + 0x68
        let reComponent = unsafe unsafeBitCast(coreComponent.core, to: CoreRE::Component.self)
        let s8 = self._boundsMargin
        // x19 + 0x28
        let reEntity = reComponent.entity
        
        // x22
        let entity = unsafe MyRealityFoundation::Entity.__fromCore(
            __EntityRef(core: unsafeBitCast(reEntity, to: OpaquePointer.self))
        )
        
        // <+292>
        // self.materials -> x27 -> x19 + 0x88
        // x19 + 0xa0
        let materialsCount = self.materials.count
        var videoMaterials: [VideoMaterial] = []
        var w20 = false
        
        if materialsCount != 0 {
            for material in self.materials {
                if !w20 {
                    // <+424>
                    w20 = material.__requiresUnmanagedVideoComponent
                    // <+464>
                } else {
                    w20 = true
                    // <+464>
                }
                
                // <+464>
                guard let videoMaterial = material as? VideoMaterial else {
                    continue
                }
                
                // <+552>
                videoMaterials.append(videoMaterial)
            }
            
            // <+760>
        } else {
            // <+784>
        }
        
        if let videoMaterial = videoMaterials.first {
            let videoResource = videoMaterial.__videoResource
            
            let component = VideoComponent(
                video: videoResource,
                material: videoMaterial,
                stereoFadeThreshold: SIMD2<Float>([0.0, 0.0])
            )
            
            // returnStrongReference 여부는 알 수 없음
            entity.components.doSet(VideoComponent.self, newValue: component, returnStrongReference: false)
            videoResource.addEntity(entity)
            
            // <+1080>
            let controller = videoMaterial.controller
            // inlined
            videoResource.preferredViewingMode = controller.preferredViewingMode
            
            // <+1324>
            let handle = unsafe __ServiceLocator.shared.assetService.__handle
            
            unsafe unsafeBitCast(handle, to: CoreRE::AssetManager.self)
                .preloadVideoAssetOnce(
                    unsafeBitCast(videoResource.coreAssetInternal, to: CoreRE::Asset.self),
                    (controller.preferredViewingMode == .stereo) ? .stereo : .mono
                )
            
            unsafe unsafeBitCast(videoResource.coreAssetInternal, to: CoreRE::Asset.self)
                .preventPlaybackUntilReady = true
            // <+1592>
        } else {
            // <+1472>
            if !w20 {
                // returnStrongReference 여부는 알 수 없음
                entity.components.doSet(VideoComponent.self, newValue: nil, returnStrongReference: false)
            }
            
            // <+1592>
        }
        
        // <+1592>
        // reComponent -> x19 + 0x68 -> x22
        // x21
        let reAsset = reComponent.meshComponent_mesh
        let w23: Bool
        
        if let coreAsset = unsafe self.mesh.coreAssetInternal {
            // <+1620>
            let casted = unsafe unsafeBitCast(coreAsset, to: CoreRE::Asset.self)
            reComponent.meshComponent_mesh = casted
            w23 = (reAsset != casted)
            let totalSkeletonCount = casted.totalSkeletonCount
            
            if totalSkeletonCount < 1 {
                // <+1708>
            } else {
                let _ = reEntity.getOrAddComponent(ofType: .meshDeformation)
                let _ = reEntity.getOrAddComponent(ofType: .skeletalPose)
                let _ = reEntity.getOrAddComponent(ofType: .rig)
                // <+1708>
            }
            
            // <+1708>
            if reEntity.getComponent(ofType: .meshDeformation) == nil {
                // <+1728>
                for i in 0..<casted.modelCount {
                    if casted.blendShapeGroupCount(i) < 1 {
                        continue
                    } else {
                        let _ = reEntity.getOrAddComponent(ofType: .meshDeformation)
                        break
                    }
                }
                
                // <+1832>
            } else {
                // <+1832>
            }
        } else {
            // <+1812>
            w23 = (reAsset != nil)
            reComponent.meshComponent_mesh = nil
        }
        
        // <+1832>
        let s9 = reComponent.meshComponent_boundsMargin
        reComponent.meshComponent_boundsMargin = s8
        var x190x74 = (s9 == s8) ? w23 : true
        
        // x19 + 0x60
        let materialParameterBlockArrayComponent = reEntity.getOrAddComponent(ofType: .materialParameterBlockArray)
        
        let oldSize = materialParameterBlockArrayComponent.materialParameterBlockArray_size
        let newSize = self.materials.count
        
        if oldSize != newSize {
            materialParameterBlockArrayComponent.materialParameterBlockArray_resize(newSize)
        }
        
        // <+1916>
        if newSize >= reComponent.meshComponent_materialCount {
            // <+1948>
        } else {
            // <+1932>
            reComponent.meshComponent_removeAllMaterials()
            x190x74 = true
            // <+1948>
        }
        
        // <+1948>
        let x28 = reComponent.meshComponent_materialCount
        var w25 = (reEntity.getComponent(ofType: .materialRenderStateArray) == nil)
        // x22
        let materialRenderStateArrayComponent = reEntity.getOrAddComponent(ofType: .materialRenderStateArray)
        let _ = __ServiceLocator.shared
        var x190x90: Bool
        
        if materialsCount != 0 {
            // <+2020>
            for (x24, material) in self.materials.enumerated() {
                // <+2280>
                x190x90 = w25
                
                if x24 >= x28 {
                    // <+2040>
                    // x25
                    let parameters = unsafe material.__parameters
                    // x20
                    let resource = material.__resource
                    
                    if let parameters = unsafe parameters {
                        // <+2136>
                        unsafe reComponent.meshComponent_addMaterialWithParameters(
                            unsafeBitCast(resource.__coreAsset, to: CoreRE::Asset.self),
                            unsafeBitCast(parameters, to: CoreRE::Entity.self)
                        )
                        
                        x190x74 = true
                    } else {
                        // <+2500>
                        unsafe reComponent.meshComponent_addMaterial(
                            unsafeBitCast(resource.__coreAsset, to: CoreRE::Asset.self)
                        )
                        
                        x190x74 = true
                    }
                } else {
                    // <+2332>
                    // x25
                    let reMaterial = reComponent.meshComponent_materialAtIndex(x24)
                    // x26
                    let parameters = unsafe material.__parameters
                    // x20
                    let resource = material.__resource
                    
                    if let parameters = unsafe parameters {
                        // <+2448>
                        unsafe reComponent.meshComponent_setMaterialWithParametersAtIndex(
                            x24,
                            unsafeBitCast(resource.__coreAsset, to: CoreRE::Asset.self),
                            unsafeBitCast(parameters, to: CoreRE::Entity.self)
                        )
                        
                        // <+2596>
                        x190x74 = true
                    } else {
                        // <+2544>
                        unsafe reComponent.meshComponent_setMaterialAtIndex(
                            x24,
                            unsafeBitCast(resource.__coreAsset, to: CoreRE::Asset.self)
                        )
                        
                        if !x190x74 {
                            // <+2620>
                            let x26 = unsafe unsafeBitCast(material.__resource.__coreAsset, to: CoreRE::Asset.self)
                            x190x74 = (reMaterial == nil) || (reMaterial != x26)
                        } else {
                            x190x74 = true
                        }
                    }
                }
                
                let result = unsafe material.syncMaterialRenderStateToCore(
                    unsafeBitCast(materialRenderStateArrayComponent, to: OpaquePointer.self),
                    index: x24
                )
                
                w25 = x190x90
                w25 = w25 || result
            }
            
            // <+2712>
            x190x90 = w25
            
            for (x22, material) in self.materials.enumerated() {
                // <+2868>
                if returnStrongReference {
                    // <+2876>
                    materialParameterBlockArrayComponent.materialParameterBlockArray_returnBlockValueAtIndex(
                        x22,
                        material.__parameterBlock.coreParameterBlockValue
                    )
                } else {
                    // <+2732>
                    materialParameterBlockArrayComponent.materialParameterBlockArray_setBlockValueAtIndex(
                        x22,
                        material.__parameterBlock.coreParameterBlockValue
                    )
                }
            }
            
            // <+2984>
        } else {
            // <+2980>
            x190x90 = w25
            // <+2984>
        }
        
        // <+2984>
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        return __ComponentTypeRef(core: .mesh)
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension ModelComponent : _ImplicitlyAnimatableBuiltinComponent {
    @_spi(Internal) public static func animation(from: ModelComponent, to: ModelComponent) -> (from: ComponentAnimatableData<ModelComponent>, to: ComponentAnimatableData<ModelComponent>) {
        assertUnimplemented()
    }
}

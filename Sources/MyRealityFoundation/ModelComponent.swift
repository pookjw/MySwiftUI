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
        let reComponent = unsafe unsafeBitCast(coreComponent.core, to: CoreRE::Component.self)
        let s8 = self._boundsMargin
        let reEntity = reComponent.entity
        
        // x22
        let entity = unsafe MyRealityFoundation::Entity.__fromCore(
            __EntityRef(core: unsafeBitCast(reEntity, to: OpaquePointer.self))
        )
        
        // <+292>
        // self.materials -> x27 -> x19 + 0x88
        var videoMaterials: [VideoMaterial] = []
        
        if !self.materials.isEmpty {
            var w20 = false
            
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
            // inlined
            videoResource.preferredViewingMode = videoMaterial.controller.preferredViewingMode
            
            // <+1324>
            let handle = unsafe __ServiceLocator.shared.assetService.__handle
            
            unsafe unsafeBitCast(handle, to: CoreRE::AssetManager.self)
                .preloadVideoAssetOnce(
                    unsafeBitCast(videoResource.coreAssetInternal, to: CoreRE::Asset.self),
                    (videoMaterial.controller.preferredViewingMode == .stereo) ? .stereo : .mono
                )
            
            unsafe unsafeBitCast(videoResource.coreAssetInternal, to: CoreRE::Asset.self)
                .preventPlaybackUntilReady = true
            // <+1592>
        } else {
            // <+1496>
            // returnStrongReference 여부는 알 수 없음
            entity.components.doSet(VideoComponent.self, newValue: nil, returnStrongReference: false)
            // <+1592>
        }
        
        // <+1592>
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

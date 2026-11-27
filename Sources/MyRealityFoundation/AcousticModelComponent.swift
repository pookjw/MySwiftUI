@_hasMissingDesignatedInitializers internal class AcousticMeshResource : Resource {
    private let assetRef: OpaquePointer
    
    convenience init(mesh: MeshDescriptor) throws {
        assertUnimplemented()
    }
    
    init(assetRef: OpaquePointer) {
        assertUnimplemented()
    }
    
    var __coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    static func __fromCore(_ coreAsset: __AssetRef) -> AcousticMeshResource {
        assertUnimplemented()
    }
}

struct AcousticModelComponent : Component {
    struct AbsorptionMaterial {
        fileprivate let identifier: String
        
        fileprivate let frequencies: [Float]
        
        fileprivate let absorptionCoefficients: [Float]
        
        init(frequencies: [Float], absorptionCoefficients: [Float]) {
            assertUnimplemented()
        }
    }
    
    struct ScatteringMaterial {
        fileprivate let identifier: String
        
        fileprivate let frequencies: [Float]
        
        fileprivate let scatteringCoefficients: [Float]
        
        init(frequencies: [Float], scatteringCoefficients: [Float]) {
            assertUnimplemented()
        }
    }
    
    struct SoundReductionMaterial {
        fileprivate let identifier: String
        
        fileprivate let frequencies: [Float]
        
        fileprivate let soundReductionIndices: [Float]
        
        init(frequencies: [Float], soundReductionIndices: [Float]) {
            assertUnimplemented()
        }
    }
    
    var mesh: AcousticMeshResource?
    
    var absorptionMaterials: [AcousticModelComponent.AbsorptionMaterial]
    
    var scatteringMaterials: [AcousticModelComponent.ScatteringMaterial]
    
    var soundReductionMaterials: [AcousticModelComponent.SoundReductionMaterial]
    
    init() {
        assertUnimplemented()
    }
    
    init(mesh: AcousticMeshResource?, absorptionMaterials: [AcousticModelComponent.AbsorptionMaterial], scatteringMaterials: [AcousticModelComponent.ScatteringMaterial], soundReductionMaterials: [AcousticModelComponent.SoundReductionMaterial]) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> AcousticModelComponent {
        assertUnimplemented()
    }

    @MainActor @preconcurrency func __toCore(_ coreComponent: __ComponentRef) {
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
        assertUnimplemented()
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

extension AcousticModelComponent : DefaultInitializable {}

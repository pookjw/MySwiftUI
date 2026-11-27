enum ImmersiveAnimationMode : Hashable {
    case portal
    case immersive
    case expanding
    case collapsing
    
    static func == (a: ImmersiveAnimationMode, b: ImmersiveAnimationMode) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

struct SpatialMediaComponent : Component {
    enum MediaBillboardingMode : Hashable {
        case none
        case headlocked
        case stabilized
        
        static func == (a: SpatialMediaComponent.MediaBillboardingMode, b: SpatialMediaComponent.MediaBillboardingMode) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    private(set) var currentImmersiveAnimationMode: ImmersiveAnimationMode
    
    var spillTextureBlend: Float
    
    private(set) var immersiveFrameSize: SIMD2<Float>
    
    var isRecommendedForImmersive: Bool
    
    var legibilityGradientStrength: Float
    
    var isFlatGeometry: Bool
    
    var isMediaBillboardingEnabled: Bool
    
    var mediaBillboardingMode: SpatialMediaComponent.MediaBillboardingMode
    
    var shouldAnimateImmersiveTransition: Bool
    
    var magnificationExtent: Float
    
    var magnificationVelocity: Float
    
    var immersiveReducedExtent: Float
    
    var shouldUsePortalWidthForMediaScaling: Bool
    
    private var _spatialMediaPlaneOffset: SIMD3<Float>
    
    var spatialMediaPlaneOffset: SIMD3<Float> {
        get {
            return _spatialMediaPlaneOffset
        }
        set {
            _spatialMediaPlaneOffset = newValue
        }
    }
    
    var spatialMediaPlaneXYOffset: SIMD2<Float> {
        get {
            return SIMD2<Float>(_spatialMediaPlaneOffset.x, _spatialMediaPlaneOffset.y)
        }
        set {
            _spatialMediaPlaneOffset = SIMD3<Float>(newValue.x, newValue.y, _spatialMediaPlaneOffset.z)
        }
    }
    
    init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> SpatialMediaComponent {
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

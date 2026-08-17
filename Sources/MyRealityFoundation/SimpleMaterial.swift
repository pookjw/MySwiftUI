public import CoreGraphics
public import Metal

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct SimpleMaterial : Material {
    private lazy var assetService: __REAssetService = __ServiceLocator.shared.assetService // 0x0
    public private(set) var __resource: __MaterialResource // 0x28
    public var __parameterBlock: __RKMaterialParameterBlock // 0x30
    private var legacyBase = LegacyBaseColor(tintParamName: "baseColorTint", tint: nil, base: nil) // 0x50
    private var usesTransparency: Bool = false // 0x70
    @_spi(Internal) public var __triangleFillMode: MTLTriangleFillMode = .fill // 0x78
    @_spi(Internal) public var __faceCullMode: MTLCullMode? = nil // 0x80
    @_spi(Internal) public var __writesDepthInternal: Bool = true // 0x89
    @_spi(Internal) public var __readsDepthInternal: Bool = true // 0x8a
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var color: SimpleMaterial.BaseColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS, deprecated: 12.0, renamed: "color")
    @available(iOS, deprecated: 15.0, renamed: "color")
    @available(macCatalyst, deprecated: 15.0, renamed: "color")
    @available(visionOS, deprecated: 1.0, renamed: "color")
    @available(tvOS, unavailable)
    public var __tintColor: CGColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS, deprecated: 12.0, renamed: "color")
    @available(iOS, deprecated: 15.0, renamed: "color")
    @available(macCatalyst, deprecated: 15.0, renamed: "color")
    @available(visionOS, deprecated: 1.0, renamed: "color")
    @available(tvOS, unavailable)
    public var __baseColor: __MaterialColorParameter {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var roughness: MaterialScalarParameter {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var metallic: MaterialScalarParameter {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var __emissive: __MaterialColorParameter {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var __usesTransparency: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public var triangleFillMode: SimpleMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    init(_: OpaquePointer, _: __RKMaterialParameterBlock) {
        assertUnimplemented()
    }
    
    package init(color: CGColor, roughness: MaterialScalarParameter, isMetallic: Bool) {
        self.init(
            color: color,
            roughness: roughness,
            isMetallic: isMetallic,
            assetService: __ServiceLocator.shared.assetService
        )
    }
    
    init(color: CGColor, roughness: MaterialScalarParameter, isMetallic: Bool, assetService: __REAssetService) {
        /*
         color -> x0 -> x23
         roughness -> x1 -> x22
         isMetallic -> w2 -> w21
         assetService -> x3 -> x19
         */
        self.__resource = __MaterialResource.loadEngineResource(assetPath: "engine:simple.rematerial")
        self.__parameterBlock = __RKMaterialParameterBlock()
        
        let baseColor = PhysicallyBasedMaterial.BaseColor(tint: color, texture: nil)
        self.setParameter(baseColor, alternateTintKey: "baseColorTint")
        self.updateMaterialResource(false)
        self.setScalarParameter(.unknown0, value: roughness)
        self.setScalarParameter(.unknown1, value: isMetallic ? .float(1) : .float(0))
        self.legacyBase.base = color
        self.assetService = assetService
    }
    
    public init() {
        assertUnimplemented()
    }
    
    init(assetService: __REAssetService) {
        assertUnimplemented()
    }
    
    mutating func updateMaterialResource(_ flag: Bool) {
        var flag = flag
        if let color = self.getColor(name: self.legacyBase.tintParamName) {
            flag = (color.alpha < 1)
        }
        
        // <+64>
        if flag == self.usesTransparency {
            return
        }
        
        // <+80>
        self.__resource = __MaterialResource.loadEngineResource(
            assetPath: flag ? "engine:transparentSimple.rematerial" : "engine:simple.rematerial"
        )
        self.usesTransparency = flag
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension SimpleMaterial {
    public var writesDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var readsDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension SimpleMaterial {
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public var faceCulling: SimpleMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SimpleMaterial {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias BaseColor = PhysicallyBasedMaterial.BaseColor
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias Texture = PhysicallyBasedMaterial.Texture
}

struct LegacyBaseColor {
    fileprivate let tintParamName: String
    fileprivate private(set) var tint: CGColor?
    fileprivate var base: CGColor?
}

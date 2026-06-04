public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct SimpleMaterial : Material {
    public var __resource: __MaterialResource {
        get {
            assertUnimplemented()
        }
    }
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
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
    
    public init() {
        assertUnimplemented()
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

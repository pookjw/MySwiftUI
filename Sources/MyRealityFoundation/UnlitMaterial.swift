public import CoreGraphics

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension UnlitMaterial {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias BaseColor = PhysicallyBasedMaterial.BaseColor
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias Texture = PhysicallyBasedMaterial.Texture
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias Blending = PhysicallyBasedMaterial.Blending
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct UnlitMaterial : Material {
    public var __resource: __MaterialResource {
        get {
            assertUnimplemented()
        }
    }
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var color: UnlitMaterial.BaseColor {
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
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var opacityThreshold: Float? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var blending: UnlitMaterial.Blending {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension UnlitMaterial {
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    public var triangleFillMode: UnlitMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(applyPostProcessToneMap: Bool) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension UnlitMaterial {
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
extension UnlitMaterial {
    @_hasMissingDesignatedInitializers final public class Program : Equatable, Hashable, Sendable {
        @safe final public nonisolated(unsafe) let descriptor: UnlitMaterial.Program.Descriptor = {
            assertUnimplemented()
        }()
        
        public struct Descriptor : Equatable, Hashable, Sendable {
            public var applyPostProcessToneMap: Bool
            
            public var blendMode: MaterialParameterTypes.BlendMode?
            
            public init() {
                assertUnimplemented()
            }
            
            public static func == (a: UnlitMaterial.Program.Descriptor, b: UnlitMaterial.Program.Descriptor) -> Bool {
                assertUnimplemented()
            }
            
            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }
            
            public var hashValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public static func == (lhs: UnlitMaterial.Program, rhs: UnlitMaterial.Program) -> Bool {
            assertUnimplemented()
        }
        
        final public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public init(descriptor: UnlitMaterial.Program.Descriptor) async {
            assertUnimplemented()
        }
        
        final public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var program: UnlitMaterial.Program {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(program: UnlitMaterial.Program) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension UnlitMaterial {
    public init(texture: TextureResource) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension UnlitMaterial {
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public var faceCulling: UnlitMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension UnlitMaterial {
    public typealias TextureCoordinateTransform = MaterialParameterTypes.TextureCoordinateTransform
    
    public var textureCoordinateTransform: UnlitMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var secondaryTextureCoordinateTransform: UnlitMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

public import Metal
internal import CoreGraphics
internal import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Material {
    var __resource: __MaterialResource { get }
    var __parameterBlock: __RKMaterialParameterBlock { get set }
    @_spi(Internal) var __triangleFillMode: MTLTriangleFillMode { get set }
    @_spi(Internal) var __writesDepthInternal: Bool { get set }
    @_spi(Internal) var __readsDepthInternal: Bool { get set }
    @_spi(Internal) var __faceCullMode: MTLCullMode? { get set }
    @_spi(Internal) var __parameters: OpaquePointer? { get }
    @_spi(Internal) var __requiresUnmanagedVideoComponent: Bool { get }
    @_spi(Internal) var __directUniformsState: DirectUniformsState { get }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Material {
    public typealias Parameters = MaterialParameters
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Material {
    public var name: String? {
        get {
            assertUnimplemented()
        }
    }
}

extension Material {
    @_spi(Internal) public var __triangleFillMode: MTLTriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @_spi(Internal) public var __writesDepthInternal: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @_spi(Internal) public var __readsDepthInternal: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @_spi(Internal) public var __parameters: OpaquePointer? {
        return nil
    }
    
    @_spi(Internal) public var __requiresUnmanagedVideoComponent: Bool {
        return false
    }
    
    @_spi(Internal) public var __directUniformsState: DirectUniformsState {
        assertUnimplemented()
    }
    
    func getColorParameter(key: String) -> CGColor? {
        assertUnimplemented()
    }
    
    func getTextureParameter(key: String) -> MaterialParameters.Texture? {
        assertUnimplemented()
    }
    
    func getFloatParameter(key: String) -> Float? {
        assertUnimplemented()
    }
    
    @_spi(Internal) public var __faceCullMode: MTLCullMode? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var parameters: MaterialParameters {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    subscript(key: String) -> __RKMaterialParameterBlock.Parameter? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    func metadata(for key: String) -> MaterialParameters.Metadata? {
        assertUnimplemented()
    }
    
    var allKeys: Set<String> {
        assertUnimplemented()
    }
    
    func makeMaterialParametersTextureFromTextureResource(_ texture: TextureResource, textureKey: String) -> MaterialParameters.Texture {
        assertUnimplemented()
    }
    
    mutating func setParameter<T : MaterialParameter>(_ parameter: T, alternateTintKey: String?) {
        assertUnimplemented()
    }
    
    func getFloat4Parameter(key: String) -> SIMD4<Float>? {
        assertUnimplemented()
    }
    
    func syncMaterialRenderStateToCore(_ core: OpaquePointer, index: Int) -> Bool {
        assertUnimplemented()
    }
    
    func syncMaterialRenderStateFromCore(coreComponent: OpaquePointer, index: Int) {
        assertUnimplemented()
    }
    
    func getColor(name: String) -> CGColor? {
        assertUnimplemented()
    }
    
    func setScalarParameter(_ type: MixedParameterType, value: MaterialScalarParameter) {
        assertUnimplemented()
    }
    
    func setColorParameter(_: MixedParameterType, value: __MaterialColorParameter) {
        assertUnimplemented()
    }
    
    func getLegacyBase(legacy: LegacyBaseColor) -> __MaterialColorParameter {
        assertUnimplemented()
    }
    
    func setLegacyBase(legacy: inout LegacyBaseColor, value: __MaterialColorParameter) {
        assertUnimplemented()
    }
    
    func setUVTransform(_: MaterialParameterTypes.TextureCoordinateTransform, withSuffix: String) {
        assertUnimplemented()
    }
}

extension Material where Self == SimpleMaterial {
    // $s10RealityKit8MaterialP0A10FoundationE12setParameter_16alternateTintKeyyqd___SSSgtAD0cF0Rd__lFAA05UnlitC0V_AD015PhysicallyBasedC0V9BaseColorVTB5
    mutating func setParameter(_ parameter: PhysicallyBasedMaterial.BaseColor, alternateTintKey: String?) {
        /*
         self -> x20 -> x19
         */
        // x29 - 0xf0
        let (firstValue, lastValue) = parameter.getCurrentValues(alternateTintKey: alternateTintKey)
        
        if let value = firstValue.value {
            // <+88>
            firstValue.key.utf8CString.withUnsafeBufferPointer { pointer in
                unsafe self.__parameterBlock.unsafeSet(
                    parameter: pointer.baseAddress.unsafelyUnwrapped,
                    value: value
                )
            }
        } else {
            // <+208>
            self.__parameterBlock.clear(parameter: firstValue.key)
        }
        
        // <+216>
        guard let lastValue else {
            return
        }
        
        if let value = lastValue.value {
            // <+272>
            lastValue.key.utf8CString.withUnsafeBufferPointer { pointer in
                unsafe self.__parameterBlock.unsafeSet(
                    parameter: pointer.baseAddress.unsafelyUnwrapped,
                    value: value
                )
            }
        } else {
            // <+436>
            self.__parameterBlock.clear(parameter: lastValue.key)
        }
    }
    
    func setScalarParameter(_: MixedParameterType, value: MaterialScalarParameter) {
        assertUnimplemented()
    }
    
    // $s10RealityKit8MaterialP0A10FoundationE8getColor4nameSo10CGColorRefaSgSS_tFAA05UnlitC0V_Tg5
    func getColor(name: String) -> CGColor? {
        let parameter = self.__parameterBlock.get(parameter: name)
        assertUnimplemented()
    }
}

@_spi(Internal) public enum DirectUniformsState {
        case shared(DirectParameterBuffer)
        case unique((DirectParameterBuffer, DirectParameterBuffer))
         case empty
     }

@_spi(Internal) public struct DirectParameterBuffer {
//    private var data: Data
//    private var resources: REDirectParameterResources
}

protocol MaterialParameter {
    // TODO
}

enum MixedParameterType {
    case unknown0
    case unknown1
}

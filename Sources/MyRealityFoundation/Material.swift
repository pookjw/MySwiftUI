public import Metal
internal import CoreGraphics
internal import simd
private import CoreRE
private import Metal

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
        return .empty
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
        /*
         core -> x0 -> x21
         index -> x1 -> x19
         */
        let component = unsafe unsafeBitCast(core, to: CoreRE::Component.self)
        
        // sp + 0x30
        var triangleFillMode = MTLTriangleFillMode.fill
        unsafe component.materialRenderStateArray_getTriangleFillModeAtIndex(index, &triangleFillMode)
        
        // sp + 0x28
        var cullMode = MTLCullMode.back
        var w25 = unsafe component.materialRenderStateArray_getCullModeAtIndex(index, &cullMode)
        
        // sp + 0x27
        var writesDepth = true
        unsafe component.materialRenderStateArray_getWritesDepthAtIndex(index, &writesDepth)
        
        // sp + 0x26
        var readsDepth = true
        unsafe component.materialRenderStateArray_getReadsDepthAtIndex(index, &readsDepth)
        
        // <+148>
        // triangleFillMode -> sp + 0x30 -> sp + 0x18
        // x24
        let currentTriangleFillMode = self.__triangleFillMode
        
        if w25 {
            // <+180>
            if let faceCullMode = self.__faceCullMode {
                w25 = (cullMode != faceCullMode)
            } else {
                w25 = true
            }
        } else {
            // <+232>
            w25 = (self.__faceCullMode != nil)
        }
        
        // <+264>
        let w26 = (writesDepth != self.__writesDepthInternal)
        let w27 = (readsDepth != self.__readsDepthInternal)
        let w24: Bool
        let flag: Bool // true -> <+472> / false -> <+572>
        
        if triangleFillMode != currentTriangleFillMode {
            // <+352>
            if self.__triangleFillMode == .fill {
                // <+408>
                component.materialRenderStateArray_clearTriangleFillModeAtIndex(index)
            } else {
                // <+368>
                component.materialRenderStateArray_setTriangleFillModeAtIndex(index, self.__triangleFillMode)
            }
            
            // <+420>
            w24 = true
            
            if w25 {
                // <+428>
                if self.__faceCullMode != nil {
                    // <+528>
                    component.materialRenderStateArray_setCullModeAtIndex(index, self.__faceCullMode!)
                    flag = w26
                } else {
                    // <+456>
                    component.materialRenderStateArray_clearCullModeAtIndex(index)
                    // <+468>
                    flag = w26
                }
            } else {
                // <+468>
                flag = w26
            }
        } else if !(w25 || !w26) {
            // <+400>
            w24 = true
            // <+472>
            flag = true
        } else {
            // <+340>
            w24 = w25 || w27
            
            if w25 {
                if self.__faceCullMode != nil {
                    // <+528>
                    component.materialRenderStateArray_setCullModeAtIndex(index, self.__faceCullMode!)
                } else {
                    // <+456>
                    component.materialRenderStateArray_clearCullModeAtIndex(index)
                }
            }
            
            // <+468>
            flag = w26
        }
        
        if flag {
            // <+472>
            if self.__writesDepthInternal {
                component.materialRenderStateArray_clearWritesDepthAtIndex(index)
            } else {
                component.materialRenderStateArray_setWritesDepthAtIndex(index, false)
            }
            
            // <+572>
        }
        
        // <+572>
        if w27 {
            if self.__readsDepthInternal {
                component.materialRenderStateArray_clearReadsDepthAtIndex(index)
                // <+628>
            } else {
                component.materialRenderStateArray_setReadsDepthAtIndex(index, false)
                // <+628>
            }
        } else {
            // <+628>
        }
        
        // <+628>
        return w24
    }
    
    func syncMaterialRenderStateFromCore(coreComponent: OpaquePointer, index: Int) {
        assertUnimplemented()
    }
    
    func getColor(name: String) -> CGColor? {
        assertUnimplemented()
    }
    
    mutating func setScalarParameter(_ type: MixedParameterType, value: MaterialScalarParameter) {
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
            self.__parameterBlock.set(parameter: firstValue.key, value: value)
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
            self.__parameterBlock.set(parameter: lastValue.key, value: value)
        } else {
            // <+436>
            self.__parameterBlock.clear(parameter: lastValue.key)
        }
    }
    
    // $s10RealityKit8MaterialP0A10FoundationE18setScalarParameter_5valueyAD05MixedG4TypeO_AA0cfG0OtFAA06SimpleC0V_TB5
    mutating func setScalarParameter(_ type: MixedParameterType, value: MaterialScalarParameter) {
        let constant: PbrCommonKeys.Constants
        switch type {
        case .unknown0:
            constant = .roughnessScale
        case .unknown1:
            constant = .metallicScale
        case .unknown2:
            constant = .emissiveColor
        }
        
        switch value {
        case .float(let _value):
            self.__parameterBlock.set(
                parameter: constant.rawValue,
                value: .float(_value)
            )
            
            let texturesKey: PbrCommonKeys.Textures
            switch type {
            case .unknown0:
                texturesKey = .textureRoughness
            case .unknown1:
                texturesKey = .textureMetallic
            case .unknown2:
                texturesKey = .textureEmissive
            }
            
            self.__parameterBlock.clear(parameter: texturesKey.rawValue)
        case .texture(let resource):
            self.__parameterBlock.set(
                parameter: constant.rawValue,
                value: .float(1)
            )
            
            let texturesKey: PbrCommonKeys.Textures
            switch type {
            case .unknown0:
                texturesKey = .textureRoughness
            case .unknown1:
                texturesKey = .textureMetallic
            case .unknown2:
                texturesKey = .textureEmissive
            }
            
            let texture = self.makeMaterialParametersTextureFromTextureResource(resource, textureKey: texturesKey.rawValue)
            self.__parameterBlock.set(parameter: texturesKey.rawValue, value: .textureAndSampler(texture))
        }
    }
    
    // $s10RealityKit8MaterialP0A10FoundationE8getColor4nameSo10CGColorRefaSgSS_tFAA05UnlitC0V_Tg5
    func getColor(name: String) -> CGColor? {
        let parameter = self.__parameterBlock.get(parameter: name)
        
        switch parameter {
        case .texture(_):
            return nil
        case .textureAndSampler(_):
            return nil
        case .float(_):
            return nil
        case .float2(_):
            return nil
        case .float3(let values):
            return SIMD4(values.x, values.y, values.z, 1).cgColor
        case .float4(let values):
            return values.cgColor
        case .color(let color):
            // <+144>
            return color
        case .float2x2(_):
            return nil
        case .float3x3(_):
            return nil
        case .float4x4(_):
            return nil
        case .bool(_):
            return nil
        case .int(_):
            return nil
        case .int2(_):
            return nil
        case .int3(_):
            return nil
        case .int4(_):
            return nil
        case .uint(_):
            return nil
        case .uint2(_):
            return nil
        case .uint3(_):
            return nil
        case .uint4(_):
            return nil
        case .default:
            return nil
        case nil:
            return nil
        }
    }
}

@_spi(Internal) public enum DirectUniformsState {
    case shared(DirectParameterBuffer)
    case unique((DirectParameterBuffer, DirectParameterBuffer))
    case empty
}

@_spi(Internal) public struct DirectParameterBuffer {
    private var data: Data
    private var resources: REDirectParameterResources
}

protocol MaterialParameter {
    // TODO
}

enum MixedParameterType {
    case unknown0
    case unknown1
    case unknown2
}

class REDirectParameterResources {
    // TODO
}

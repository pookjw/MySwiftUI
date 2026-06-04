@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct OcclusionMaterial : Material, Sendable {
    public let __resource: __MaterialResource
    
    public var __parameterBlock: __RKMaterialParameterBlock
//    @available(visionOS, unavailable)
    
    public let receivesDynamicLighting: Bool
    
    @available(visionOS, unavailable)
    public init(receivesDynamicLighting: Bool = false) {
        assertUnimplemented()
    }
}

extension OcclusionMaterial {
    @available(visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init() {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension OcclusionMaterial {
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
extension OcclusionMaterial {
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public var faceCulling: OcclusionMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

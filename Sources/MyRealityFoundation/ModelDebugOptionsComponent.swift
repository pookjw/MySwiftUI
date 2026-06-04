@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
public struct ModelDebugOptionsComponent : Component {
    public var visualizationMode: ModelDebugOptionsComponent.VisualizationMode {
        get {
            assertUnimplemented()
        }
    }
    
    public init(visualizationMode: ModelDebugOptionsComponent.VisualizationMode = .none) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ModelDebugOptionsComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public enum VisualizationMode : String {
        case none
        case normal
        case tangent
        case bitangent
        case baseColor
        case textureCoordinates
        case finalColor
        case finalAlpha
        case roughness
        case metallic
        case ambientOcclusion
        case specular
        case emissive
        case clearcoat
        case clearcoatRoughness
        case lightingDiffuse
        case lightingSpecular
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case clearcoatNormal
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 14.0, tvOS 26.0, macOS 11.0, macCatalyst 14.0, *)
        public typealias RawValue = String
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
}

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
extension ModelDebugOptionsComponent.VisualizationMode : Equatable {}

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
extension ModelDebugOptionsComponent.VisualizationMode : Hashable {}

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
extension ModelDebugOptionsComponent.VisualizationMode : RawRepresentable {}

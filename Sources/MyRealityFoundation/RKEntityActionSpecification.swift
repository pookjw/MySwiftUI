public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKEntityActionSpecification : Codable, Equatable {
    case audio(__RKEntityAudioActionArguments)
    case changeScene(__RKChangeSceneActionArguments)
    case custom(__RKEntityCustomActionArguments)
    case emphasis(__RKEntityEmphasisActionArguments)
    case fadeEntity(__RKEntityFadeActionArguments)
    case fadeScene(__RKFadeSceneActionArguments)
    case group(__RKEntityActionGroupArguments)
    case hide(__RKEntityHideActionArguments)
    case force(__RKEntityForceActionArguments)
    case show(__RKEntityShowActionArguments)
    case startAnimate(__RKEntityStartAnimateActionArguments)
    case stopAnimate(__RKEntityStopAnimateActionArguments)
    case toggleAnimate(__RKEntityToggleAnimateActionArguments)
    case toggleVisibility(__RKEntityToggleVisibilityActionArguments)
    case transform(__RKEntityTransformActionArguments)
    case wait(__RKWaitActionArguments)
    case orbitEntity(__RKEntityOrbitEntityActionArguments)
    case lookAtCamera(__RKEntityLookAtCameraActionArguments)
    case swapEntity(__RKEntitySwapEntityActionArguments)
    case spin(__RKEntitySpinActionArguments)
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    case setOpacity(__RKEntitySetOpacityActionArguments)
    
    public enum Name : String {
        case audio
        case changeScene
        case custom
        case emphasis
        case fadeEntity
        case fadeScene
        case force
        case group
        case hide
        case lookAtCamera
        case orbitEntity
        @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
        case setOpacity
        case show
        case spin
        case startAnimate
        case stopAnimate
        case swapEntity
        case toggleAnimate
        case toggleVisibility
        case transform
        case wait
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = String
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var name: __RKEntityActionSpecification.Name {
        get {
            assertUnimplemented()
        }
    }
    
    public var target: UUID? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityActionSpecification, b: __RKEntityActionSpecification) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
extension __RKEntityActionSpecification : __USDEncodablePublic {
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
    
    @available(*, deprecated)
    public func encode(to encoder: __USDEncoder, at pathName: __USKObjectPathWrapper, sceneSpecifier: __USKNodeSpecifierTypeWrapper) throws -> __USKNodeWrapper {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityActionSpecification.Name : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityActionSpecification.Name : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityActionSpecification.Name : RawRepresentable {}

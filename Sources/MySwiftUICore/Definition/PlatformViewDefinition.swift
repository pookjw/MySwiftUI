
internal import _MySwiftUIShims
public import QuartzCore

@_spi(Internal) open class PlatformViewDefinition {
    open class func setAllowsWindowActivationEvents(_ allowed: Bool?, for object: AnyObject) {
        fatalError() // abstract
    }
    
    open class func setHitTestsAsOpaque(_ flag: Bool, for object: AnyObject) {
        fatalError() // abstract
    }
    
    open class var system: System {
        fatalError() // abstract
    }
    
    open class func makeView(kind: ViewKind, item: Any) -> AnyObject {
        fatalError() // abstract
    }
    
    open class var supportsMixedHierarchy: Bool {
        fatalError() //abstract
    }
    
    open class func makeView(kind: ViewKind) -> AnyObject {
        fatalError() //abstract
    }
    
    open class func makeLayerView(type: CALayer.Type, kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        fatalError() // abstract
    }
    
    open class func makePlatformView(view: AnyObject, kind: PlatformViewDefinition.ViewKind) {
        fatalError() // abstract
    }
    
    open class func makeDrawingView(options: PlatformDrawableOptions) -> any PlatformDrawable {
        fatalError() // abstract
    }
    
    open class func setPath(_ path: Path, shapeView: AnyObject) {
        fatalError() // abstract
    }
    
    open class func setProjectionTransform(_ transform: ProjectionTransform, projectionView: AnyObject) {
        fatalError() // abstract
    }
    
    open class func setIgnoresEvents(_ flag: Bool, of object: AnyObject) {
        fatalError() // abstract
    }
    
    open class func setHiddenForReuse(_ flag: Bool, of object: AnyObject ) {
        fatalError() // abstract
    }
    
    package static func `for`(_ type: AnyObject.Type) -> PlatformViewDefinition.Type? {
        guard let nsObjectType = type as? NSObject.Type else {
            return nil
        }
        
        let viewDefinition = nsObjectType._mySwiftUI_platformViewDefinition()
        return unsafe unsafeBitCast(viewDefinition, to: PlatformViewDefinition.Type.self)
    }
    
    package static func canSupportMixedHierarchy(system: PlatformViewDefinition.System) -> Bool {
        fatalError("TODO")
    }
}

extension PlatformViewDefinition {
    public struct System: Hashable {
        public static var uiView: System { System(base: .uiView) }
        public static var nsView: System { System(base: .nsView) }
        
        private(set) var base: ViewSystem
    }
}

extension PlatformViewDefinition {
    public enum ViewKind: Hashable {
        case inherited
        case color
        case image
        case shape
        case sdfLayer
        case sdfEffect
        case shadow
        case backdrop
        case chameleonColor
        case drawing
        case compositing
        case geometry
        case projection
        case affine3D
        case mask
        case platformView
        case platformGroup
        case platformLayer
        case platformEffect
        
        public var isContainer: Bool {
            switch self {
            case .inherited,
                    .sdfEffect,
                    .compositing,
                    .geometry,
                    .projection,
                    .affine3D,
                    .mask,
                    .platformGroup,
                    .platformEffect:
                return true
            default:
                return false
            }
        }
    }
}

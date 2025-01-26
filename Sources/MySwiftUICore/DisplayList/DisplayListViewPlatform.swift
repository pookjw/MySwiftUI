import _MySwiftUICShims
import QuartzCore

// TODO: SwiftUI.UIViewPlatformViewDefinition
// SwiftUI(Core).CAHostingLayerPlatformDefinition
@_spi(MySwiftUICorePrivate)
open class PlatformViewDefinition: @unchecked Sendable {
    open class func setAllowsWindowActivationEvents(_ flag: Bool?, for object: Swift.AnyObject) {
        // override me
        fatalError()
    }
    
    open class func setHitTestsAsOpaque(_ flag: Bool, for object: AnyObject) {
        // override me
        fatalError()
    }
    
    open class var system: PlatformViewDefinition.System {
        // override me
        fatalError()
    }
    
    open class func makeView(kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        // override me
        fatalError()
    }
    
    open class func makeLayerView(type: CALayer.Type, kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        // override me
        fatalError()
    }
    
    open class func makePlatformView(view: AnyObject, kind: PlatformViewDefinition.ViewKind) {
        // override me
        fatalError()
    }
    
    open class func makeDrawingView(options: PlatformDrawableOptions) -> PlatformDrawable {
        // override me
        fatalError()
    }
    
    open class func setPath(_ path: Path, shapeView: AnyObject) {
        // override me
        fatalError()
    }
    
    open class func setProjectionTransform(_ projectionTransform: ProjectionTransform, projectionView: AnyObject) {
        // override me
        fatalError()
    }
    
    open class func setIgnoresEvents(_ flag: Bool, of view: AnyObject) {
        // override me
        fatalError()
    }
    
    open class func getRBLayer(drawingView: AnyObject) -> AnyObject? {
        // override me
        fatalError()
    }
}

extension PlatformViewDefinition {
    public enum ViewKind: Hashable {
        case inherited
        case color
        case image
        case shape
        case shadow
        case backdrop
        case chamelonColor
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
        
        package var isContainer: Bool {
            /*
             ldrb   w8, [x20]
             (중략)
             mov    w10, #0x5f01
             movk   w10, #0x1, lsl #16
             -> w10의 앞 4바이트를 유지하고 0x1 << 16과 합침 = 0x15f01
             lsr    w8, w10, w8
             -> w10을 w8 만큼 오른쪽으로 shift
             -> w0 = 0x000015f01 = 00000000 00000001 01011111 00000001
             -> 마지막 1 byte만 읽어옴
             */
            switch self {
            case .inherited, .compositing, .geometry, .projection, .affine3D, .mask, .platformGroup, .platformEffect:
                return true
            case .color, .image, .shape, .shadow, .backdrop, .chamelonColor, .drawing, .platformView, .platformLayer:
                return false
            }
        }
    }
}

extension PlatformViewDefinition {
    public struct System: Hashable {
        public static var uiView: System { System(base: .uiView) }
        public static var nsView: System { System(base: .nsView) }
        let base: ViewSystem
    }
}

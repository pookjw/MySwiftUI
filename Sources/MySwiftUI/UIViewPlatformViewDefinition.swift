// A34643117F00277B93DEBAB70EC06971
@_spi(Internal) internal import MySwiftUICore
public import UIKit
private import _UIKitPrivate
private import _MySwiftUIShims
private import _MySwiftUICoreShims

final class UIViewPlatformViewDefinition : PlatformViewDefinition {
    override class var system : PlatformViewDefinition.System {
        return .uiView
    }

    override class var supportsMixedHierarchy: Bool {
        assertUnimplemented()
    }

    override class func makeView(kind: PlatformViewDefinition.ViewKind, item: Any) -> AnyObject {
        assertUnimplemented()
    }

    override class func makeDrawingView(options: PlatformDrawableOptions) -> any PlatformDrawable {
        assertUnimplemented()
    }

    override class func setPath(_ path: Path, shapeView: AnyObject) {
        let casted = unsafe unsafeDowncast(shapeView, to: _UIShapeHitTestingView.self)
        casted.path = path
    }

    override class func setProjectionTransform(_ transform: ProjectionTransform, projectionView: AnyObject) {
        assertUnimplemented()
    }

    override class func getRBLayer(drawingView: AnyObject) -> AnyObject? {
        assertUnimplemented()
    }

    override class func setIgnoresEvents(_ flag: Bool, of object: AnyObject) {
        assertUnimplemented()
    }

    override class func setHiddenForReuse(_ flag: Bool, of object: AnyObject) {
        assertUnimplemented()
    }
    
    override class func makeView(kind : PlatformViewDefinition.ViewKind) -> AnyObject {
        switch kind {
        case .mask:
            assertUnimplemented()
        case .inherited, .color, .image, .shape, .sdfLayer, .sdfEffect, .shadow, .backdrop, .chameleonColor, .drawing, .compositing, .geometry, .projection, .affine3D, .platformView, .platformGroup, .platformLayer, .platformEffect:
            let view: UIView
            if kind.isContainer {
                view = _UIInheritedView()
            } else {
                view = _UIGraphicsView()
            }
            
            UIViewPlatformViewDefinition.initView(view, kind: kind)
            return view
        }
    }
    
    override class func makeLayerView(type: CALayer.Type, kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        /*
         type -> x0 -> x19
         kind -> x1 -> x20
         */
        let viewType: UIView.Type
        switch kind {
        case .shape:
            viewType = _UIShapeHitTestingView.self
        case .inherited, .color, .image, .sdfLayer, .sdfEffect, .shadow, .backdrop, .chameleonColor, .drawing, .compositing, .geometry, .projection, .affine3D, .mask, .platformView, .platformGroup, .platformLayer, .platformEffect:
            if kind.isContainer {
                viewType = _UIInheritedView.self
            } else {
                viewType = _UIGraphicsView.self
            }
        }
        
        let layer = type.init()
        let customView = _UIKitCreateCustomView(viewType, layer)
        UIViewPlatformViewDefinition.initView(customView, kind: kind)
        
        return customView
    }
    
    override class func makePlatformView(view : AnyObject, kind: PlatformViewDefinition.ViewKind) {
        let view = view as! UIView
        UIViewPlatformViewDefinition.initView(view, kind: kind)
    }
    
    fileprivate static func initView(_ view: UIView, kind: PlatformViewDefinition.ViewKind) {
        switch kind {
        case .platformView, .platformGroup:
            // noop
            break
        default:
            view.autoresizesSubviews = false
            if !kind.isContainer {
                view._isFocusInteractionEnabled = false
            }
        }
        
        // <+256>
        view.layer.anchorPoint = .zero
        
        switch kind {
        case .inherited, .geometry, .projection, .affine3D, .mask, .platformEffect:
            // <+356>
            view.layer.allowsGroupOpacity = false
            view.layer.allowsGroupBlending = false
        case .color, .image, .shape:
            view.layer.allowsEdgeAntialiasing = true
        default:
            break
        }
    }
}

extension UIView {
    @_spi(Internal) open override class func _mySwiftUI_platformViewDefinition() -> UnsafeRawPointer? {
        return unsafe unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
    }
}

fileprivate final class _UIShapeHitTestingView : _UIGraphicsView {
    var path: Path
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        assertUnimplemented()
    }
    
    override init(frame: CGRect) {
        self.path = Path()
        super.init(frame: frame)
    }
    
    @MainActor required init?(coder: NSCoder) {
        self.path = Path()
        super.init(coder: coder)
    }
}

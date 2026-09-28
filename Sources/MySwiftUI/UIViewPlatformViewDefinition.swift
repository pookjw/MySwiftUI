// A34643117F00277B93DEBAB70EC06971
@_spi(Internal) internal import MySwiftUICore
@preconcurrency public import UIKit
private import _UIKitPrivate
private import _MySwiftUIShims

final class UIViewPlatformViewDefinition : PlatformViewDefinition {
    override class var system : PlatformViewDefinition.System {
        return .uiView
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
            assertUnimplemented()
//            type = _UIShapeHitTestingView.self
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
        if case .platformGroup = kind {
            // noop
        } else {
            view.autoresizesSubviews = false
            if !kind.isContainer {
                view._isFocusInteractionEnabled = false
            }
        }
        
        // <+256>
        view.anchorPoint = .zero
        
        switch kind {
        case .inherited:
            // <+356>
            view.allowsGroupOpacity = false
            view.allowsGroupBlending = false
        case .shape:
            break
        default:
            view.layer.allowsEdgeAntialiasing = true
        }
    }
}

extension UIView {
    @_spi(Internal) open override class func _mySwiftUI_platformViewDefinition() -> UnsafeRawPointer {
        return unsafe unsafeBitCast(UIViewPlatformViewDefinition.self, to: UnsafeRawPointer.self)
    }
}

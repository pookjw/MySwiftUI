// A34643117F00277B93DEBAB70EC06971

#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
public import UIKit
private import _UIKitPrivate

final class UIViewPlatformViewDefinition: PlatformViewDefinition {
    override class var system: PlatformViewDefinition.System {
        return .uiView
    }
    
    override class func makeView(kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        switch kind {
        case .shape:
            // <+356>
            fatalError("TODO")
        default:
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
    
    fileprivate static func initView(_ view: UIView, kind: PlatformViewDefinition.ViewKind) {
        if case .platformGroup = kind {
            // nop
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

// 224F277BFC3CFE3DE5EC209B46CB1BA4
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import _UIKitPrivate

final class UIViewResponder: PlatformViewResponderBase<UIView, UIViewContentResponder> {
    private weak var focusAccessibilityNode: AccessibilityNode? = nil
    package var keyPressHandlers: [KeyPress.Handler] = []
    private lazy var shouldUsePlatformViewAsParentContainer: Bool? = {
        fatalError("TODO")
    }()
    
    fileprivate var _shouldUsePlatformViewAsParentContainer: Bool {
        fatalError("TODO")
    }
    
    override init() {
        super.init()
    }
    
    // TODO
}

struct UIViewContentResponder: ContentResponder {
    weak var eventProvider: CurrentEventProvider?
    weak var platformView: UIView?
    
    // TODO
}

extension ViewResponder {
    var parentGestureContainer: (UIResponder & _UIGestureRecognizerContainer)? {
        // self -> x20 -> x19
        // x19
        var _parent: ViewResponder? = self
        
        while true {
            if let parent = _parent?.parent {
                // <+96>
                // parent -> x22
                if let gestureContainer = parent.gestureContainer {
                    return unsafeBitCast(gestureContainer, to: (UIResponder & _UIGestureRecognizerContainer).self)
                } else {
                    // <+112>
                    if
                        let casted = parent as? UIViewResponder,
                        casted._shouldUsePlatformViewAsParentContainer,
                        let representedView = casted.representedView
                    {
                        return representedView
                    } else {
                        // <+44>
                        if GraphHost.isUpdating {
                            // <+424>
                            if let host {
                                return host.uiView
                            } else {
                                return nil
                            }
                        } else {
                            _parent = parent
                            continue
                        }
                    }
                }
            } else {
                // <+184>
                if
                    let host = _parent?.host,
                    let eventHost = host.as(EventGraphHost.self),
                    let responderNode = eventHost.responderNode
                {
                    // responderNode -> x20
                    // <+320>
                    if _parent === responderNode {
                        // <+340>
                        return self.host?.uiView
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            }
        }
    }
}

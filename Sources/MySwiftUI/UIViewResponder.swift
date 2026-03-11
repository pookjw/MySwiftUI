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
    
    override var platformViewIsEnabled: Bool {
        guard let hostView else {
            return super.platformViewIsEnabled
        }
        
        return hostView.isUserInteractionEnabled
    }
    
    override init() {
        super.init()
    }
    
    override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        /*
         self -> x20
         points -> x0 -> x28
         cacheKey -> x1 -> x21
         options -> x2 -> x23
         return pointer -> x8 -> x27
         */
        // <+288>
        if UnifiedHitTestingFeature.isEnabled {
            return super.containsGlobalPoints(points, cacheKey: cacheKey, options: options)
        }
        
        fatalError("TODO")
    }
    
    override func platformViewHitTest(globalPoint: CGPoint, cacheKey: UInt32?) -> UIView? {
        fatalError("TODO")
    }
    
    override func platformViewHitTest(globalPoint: Point3D, cacheKey: UInt32?) -> UIView? {
        guard
            let hostView, // x19
            let window = hostView.window // x21
        else {
            return nil
        }
        
        let caPoint3D = CAPoint3D(globalPoint)
        let converted = hostView.convert(caPoint3D, from: window)
        
        // x20
        let event: UIEvent?
        if let host = self.host, let provider = host.as(CurrentEventProvider.self) {
            event = provider.currentEvent
        } else {
            event = nil
        }
        
        return hostView.hitTest(CGPoint(x: converted.x, y: converted.y), with: event)
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

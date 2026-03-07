@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class UIViewResponder: PlatformViewResponderBase<UIView, UIViewContentResponder> {
    private weak var focusAccessibilityNode: AccessibilityNode? = nil
    package var keyPressHandlers: [KeyPress.Handler] = []
    private lazy var shouldUsePlatformViewAsParentContainer: Bool? = {
        fatalError("TODO")
    }()
    
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

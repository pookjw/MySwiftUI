@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class UIViewResponder: PlatformViewResponderBase<UIView, UIViewContentResponder> {
    private weak var focusAccessibilityNode: AccessibilityNode? = nil
    private var keyPressHandlers: [KeyPress.Handler] = []
    private lazy var shouldUsePlatformViewAsParentContainer: Bool? = {
        fatalError("TODO")
    }()
    
    override init() {
        super.init()
    }
    
    // TODO
}

struct UIViewContentResponder: ContentResponder {
    // TODO
}

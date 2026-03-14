internal import _UIKitPrivate
private import MySwiftUICore

@objc final class UICoreHostingKeyboardTrackingElement: NSObject, UICoreKeyboardTrackingElement {
    weak var base: UIHostingViewBase?
    
    func prepareKeyboard(with size: CGSize, in window: UIWindow) -> Bool {
        assertUnimplemented()
    }
    
    func updateKeyboard() {
        assertUnimplemented()
    }
}

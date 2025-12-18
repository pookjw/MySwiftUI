internal import _UIKitPrivate

@objc final class UICoreHostingKeyboardTrackingElement: NSObject, UICoreKeyboardTrackingElement {
    weak var base: UIHostingViewBase?
    
    func prepareKeyboard(with size: CGSize, in window: UIWindow) -> Bool {
        fatalError("TODO")
    }
    
    func updateKeyboard() {
        fatalError("TODO")
    }
}

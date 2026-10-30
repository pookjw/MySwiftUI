internal import UIKit
internal import MySwiftUICore
internal import _UIKitPrivate

final class ViewHostingWindow : UIWindow {
    // TODO

    override init(windowScene: UIWindowScene) {
        assertUnimplemented()
    }

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override var clipsToBounds: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var _clipsToREBounds: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override func _canAffectStatusBarAppearance() -> Bool {
        assertUnimplemented()
    }
    
    override func _isInVolumetricContext() -> Bool {
        assertUnimplemented()
    }
}

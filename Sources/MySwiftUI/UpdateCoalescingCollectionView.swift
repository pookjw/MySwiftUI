internal import UIKit
internal import MySwiftUICore
private import _UIKitPrivate

final class UpdateCoalescingCollectionView : UICollectionView {
    // TODO

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override var _wantsConstraintBasedLayout: Bool {
        assertUnimplemented()
    }

    override var bounds: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override var contentSize: CGSize {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override var canBecomeFirstResponder: Bool {
        assertUnimplemented()
    }

    override func layoutSubviews() {
        assertUnimplemented()
    }

    override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        assertUnimplemented()
    }

    override func safeAreaInsetsDidChange() {
        assertUnimplemented()
    }

    override func didMoveToWindow() {
        assertUnimplemented()
    }
}

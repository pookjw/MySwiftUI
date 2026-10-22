internal import MySwiftUICore
internal import UIKit

class ListCollectionViewCellBase<T : View>: AnyListCollectionViewCell {
    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override var focusEffect: UIFocusEffect? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override var canBecomeFocused: Bool {
        assertUnimplemented()
    }

    override var isAccessibilityElement: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override func removeFromSuperview() {
        assertUnimplemented()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        assertUnimplemented()
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        assertUnimplemented()
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        assertUnimplemented()
    }

    override func layoutSubviews() {
        assertUnimplemented()
    }
}

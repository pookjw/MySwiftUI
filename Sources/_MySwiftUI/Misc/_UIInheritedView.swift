internal import UIKit
internal import UIAccessibility

final class _UIInheritedView: _UIGraphicsView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        fatalError("TODO")
    }
    
    override func _accessibilityOverridesInvalidFrames() -> Bool {
        return true
    }
}

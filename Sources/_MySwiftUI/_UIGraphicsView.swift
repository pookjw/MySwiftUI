internal import _MySwiftUIShims
internal import UIKit

class _UIGraphicsView: _MSUI_UIGraphicsViewBase {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

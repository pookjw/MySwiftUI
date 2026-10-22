@_spi(Internal) internal import MySwiftUICore
internal import UIKit

class UIKitBarItemHost<Content : View>: _UIHostingView<Content> {
    // TODO

    override class var defaultViewGraphOutputs: ViewGraph.Outputs {
        assertUnimplemented()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        assertUnimplemented()
    }

    override func layoutMarginsDidChange() {
        assertUnimplemented()
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        assertUnimplemented()
    }
}

internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import RenderBox

final class CGDrawingView : _UIGraphicsView {
    var options: PlatformDrawableOptions {
        didSet {
            if !(oldValue == self.options) {
                self.isOpaque = self.options.isOpaque
                self.layer.contentsFormat = self.options.caLayerContentsFormat
            }
        }
    }
    
    init(options: PlatformDrawableOptions) {
        self.options = options
        super.init(frame: .zero)
    }
    
    override class var layerClass: AnyClass {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    override init(frame: CGRect) {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
}

extension CGDrawingView : @preconcurrency PlatformDrawable {
    static var allowsContentsMultiplyColor: Bool {
        assertUnimplemented()
    }
    
    func update(content: PlatformDrawableContent?, required: Bool) -> Bool {
        assertUnimplemented()
    }
    
    func makeAsyncUpdate(content: PlatformDrawableContent, required: Bool, layer: CALayer, bounds: CGRect) -> (() -> Void)? {
        assertUnimplemented()
    }
    
    func setContentsScale(_ contentsScale: CGFloat) {
        assertUnimplemented()
    }
    
    func drawForTesting(in displayList: RBDisplayList) {
        assertUnimplemented()
    }
}

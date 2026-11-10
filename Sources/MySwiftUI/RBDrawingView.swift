// 65A81BD07F0108B0485D2E15DE104A75
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import RenderBox

final class RBDrawingView: RenderBoxView {
    var options: PlatformDrawableOptions {
        didSet {
            if !(oldValue == self.options) {
                self.updateOptions()
            }
        }
    }
    
    @AtomicBox private var state: RBDrawingView.State
    
    fileprivate func updateOptions() {
        self.isOpaque = self.options.isOpaque
        self.options.update(rbLayer: self.layer)
        self.rendersFirstFrameAsynchronously = self.options.rendersFirstFrameAsynchronously
    }
    
    init(options: PlatformDrawableOptions) {
        self._state = AtomicBox(wrappedValue: RBDrawingView.State())
        self.options = options
        super.init(frame: .zero)
        self.updateOptions()
    }
    
    override func draw(inDisplayList displayList: RBDisplayList) {
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

extension RBDrawingView {
    fileprivate struct State {
        private var content = PlatformDrawableContent()
        private var renderer = PlatformDrawableContent.State()
    }
}

extension RBDrawingView : @preconcurrency PlatformDrawable {
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
        self.layer.contentsScale = contentsScale
    }
    
    func drawForTesting(in displayList: RBDisplayList) {
        assertUnimplemented()
    }
}

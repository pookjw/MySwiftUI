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
        self.draw(in: displayList, size: self.bounds.size)
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
    
    fileprivate func draw(in displayList: RBDisplayList, size: CGSize) {
        // <+260>
        var newState = PlatformDrawableContent.State()
        
        self.$state.access { value in
            // $s7SwiftUI13RBDrawingViewC4draw33_65A81BD07F0108B0485D2E15DE104A75LL2in4sizeySo13RBDisplayListC_So6CGSizeVtFyAC5StateAELLVzXEfU_TA
            let oldState = value.renderer
            value.renderer = newState
            newState = oldState

        }
        
        let content = self.state.content
        content.draw(in: displayList, size: self.bounds.size, state: &newState)
        
        self.$state.access { value in
            // $s7SwiftUI13RBDrawingViewC4draw33_65A81BD07F0108B0485D2E15DE104A75LL2in4sizeySo13RBDisplayListC_So6CGSizeVtFyAC5StateAELLVzXEfU0_TA
            let oldState = value.renderer
            value.renderer = newState
            newState = oldState
        }
    }
}

extension RBDrawingView {
    fileprivate struct State {
        var content = PlatformDrawableContent()
        var renderer = PlatformDrawableContent.State()
    }
}

extension RBDrawingView : @preconcurrency PlatformDrawable {
    static var allowsContentsMultiplyColor: Bool {
        assertUnimplemented()
    }
    
    func update(content: PlatformDrawableContent?, required: Bool) -> Bool {
        if let content {
            // <+296>
            self.state.content = content
        }
        
        // <+424>
        self.layer.setNeedsDisplay()
        return true
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

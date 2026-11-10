// 0CB954C9DC99A8A907C58D7882F9389E
internal import UIKit
internal import RenderBox
private import _UIKitShims

class RenderBoxView: _UIGraphicsView, RBLayerDelegate {
    final var rendersFirstFrameAsynchronously: Bool
    
    override class var layerClass: AnyClass {
        return RenderBoxLayer.self
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
    
    override var isOpaque: Bool {
        get {
            return super.isOpaque
        }
        set {
            self.layer.isOpaque = newValue
            super.isOpaque = newValue
        }
    }
    
    override init(frame: CGRect) {
        self.rendersFirstFrameAsynchronously = false
        super.init(frame: frame)
        let layer = self.layer
        layer.delegate = self
        layer.isOpaque = self.isOpaque
    }
    
    override func didMoveToWindow() {
        guard let window else {
            return
        }
        
        let layer = self.layer
        layer.contentsScale = window.myUIScreen?.scale ?? 0
        
        self.setNeedsDisplay()
    }
    
    func draw(inDisplayList displayList: RBDisplayList) {
        assertUnimplemented()
    }
    
    func rbLayerDraw(_ layer: RBLayer, inDisplayList displayList: RBDisplayList) {
        self.draw(inDisplayList: displayList)
    }
    
    override func setNeedsDisplay() {
        self.layer.setNeedsDisplay()
    }
}

fileprivate final class RenderBoxLayer: RBLayer {
    override var needsSynchronousUpdate: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    override init(layer: Any) {
        assertUnimplemented()
    }
} 

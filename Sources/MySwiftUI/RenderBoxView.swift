internal import UIKit
internal import RenderBox

class RenderBoxView: _UIGraphicsView, RBLayerDelegate {
    private var rendersFirstFrameAsynchronously: Bool // final인지 검증
    
    override class var layerClass: AnyClass {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    deinit {
        assertUnimplemented()
    }
    
    override var isOpaque: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override init(frame: CGRect) {
        assertUnimplemented()
    }
    
    override func didMoveToWindow() {
        assertUnimplemented()
    }
    
    func draw(inDisplayList displayList: RBDisplayList) {
        assertUnimplemented()
    }
    
    func rbLayerDraw(_ layer: RBLayer, inDisplayList displayList: RBDisplayList) {
        assertUnimplemented()
    }
    
    override func setNeedsDisplay() {
        assertUnimplemented()
    }
}

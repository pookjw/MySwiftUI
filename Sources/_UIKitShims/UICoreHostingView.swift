internal import UIKit
internal import CoreGraphics
internal import QuartzCore
internal import MySwiftUICore
internal import _UIKitPrivate

class UICoreHostingView<Content : View>: UIView {
    override var frame: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var bounds: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    
    override var transform3D: CATransform3D {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var clipsToBounds: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var _layoutHeightDependsOnWidth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var transform: CGAffineTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override func didMoveToWindow() {
        assertUnimplemented()
    }
    
    override func layoutSubviews() {
        assertUnimplemented()
    }
    
    override func tintColorDidChange() {
        assertUnimplemented()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        assertUnimplemented()
    }
    
    override func safeAreaInsetsDidChange() {
        assertUnimplemented()
    }
    
    override func _safeAreaCornerInsetsDidChange() {
        assertUnimplemented()
    }
    
    override func _geometryChanged(_ context: UnsafeMutableRawPointer, forAncestor ancestor: UIView?) {
        assertUnimplemented()
    }
    
    override func _baselineOffsets(at size: CGSize) -> _UIBaselineOffsetPair {
        assertUnimplemented()
    }
    
    override func _layoutSizeThatFits(_ size: CGSize, fixedAxes axes: UIAxis) -> CGSize {
        assertUnimplemented()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    override init(frame: CGRect) {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}

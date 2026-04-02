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
}

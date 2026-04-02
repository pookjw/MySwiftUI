internal import CoreGraphics
internal import RenderBox

@usableFromInline
package struct FixedRoundedRect : Equatable {
    @usableFromInline
    package static func == (a: FixedRoundedRect, b: FixedRoundedRect) -> Bool {
        assertUnimplemented()
    }
    
    var rect: CGRect
    var cornerSize: CGSize
    var style: RoundedCornerStyle
    
    init(_ rect: CGRect) {
        assertUnimplemented()
    }
    
    func contains(_ other: FixedRoundedRect) -> Bool {
        assertUnimplemented()
    }
    
    var isUniform: Bool {
        assertUnimplemented()
    }
    
    var clampedCornerRadius: CGFloat {
        assertUnimplemented()
    }
    
    init(_ rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle) {
        assertUnimplemented()
    }
    
    var isRounded: Bool {
        assertUnimplemented()
    }
    
    var clampedCornerSize: CGSize {
        assertUnimplemented()
    }
    
    var cgPath: CGPath {
        assertUnimplemented()
    }
    
    func contains(_ point: CGPoint) -> Bool {
        assertUnimplemented()
    }
    
    func withTemporaryPath<T>(_ block: (RBPath) -> T) -> T {
        assertUnimplemented()
    }
    
    init(_ rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle) {
        assertUnimplemented()
    }
    
    func applying(_ transform: CGAffineTransform) -> FixedRoundedRect {
        assertUnimplemented()
    }
    
    func insetBy(dx: CGFloat, dy: CGFloat) -> FixedRoundedRect? {
        assertUnimplemented()
    }
    
    func hasIntersection(_ point: CGRect) -> Bool {
        assertUnimplemented()
    }
    
    func contains(path: Path, offsetBy: CGSize) -> Bool {
        assertUnimplemented()
    }
    
    func contains(rect: CGRect) -> Bool {
        assertUnimplemented()
    }
    
    var needsContinuousCorners: Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension FixedRoundedRect : Sendable {
}

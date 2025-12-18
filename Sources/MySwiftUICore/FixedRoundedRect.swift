internal import CoreGraphics
internal import RenderBox

@usableFromInline
package struct FixedRoundedRect: Equatable {
    @usableFromInline
    package static func == (a: FixedRoundedRect, b: FixedRoundedRect) -> Bool {
        fatalError("TODO")
    }
    
    var rect: CGRect
    var cornerSize: CGSize
    var style: RoundedCornerStyle
    
    init(_ rect: CGRect) {
        fatalError("TODO")
    }
    
    func contains(_ other: FixedRoundedRect) -> Bool {
        fatalError("TODO")
    }
    
    var isUniform: Bool {
        fatalError("TODO")
    }
    
    var clampedCornerRadius: CGFloat {
        fatalError("TODO")
    }
    
    init(_ rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle) {
        fatalError("TODO")
    }
    
    var isRounded: Bool {
        fatalError("TODO")
    }
    
    var clampedCornerSize: CGSize {
        fatalError("TODO")
    }
    
    var cgPath: CGPath {
        fatalError("TODO")
    }
    
    func contains(_ point: CGPoint) -> Bool {
        fatalError("TODO")
    }
    
    func withTemporaryPath<T>(_ block: (RBPath) -> T) -> T {
        fatalError("TODO")
    }
    
    init(_ rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle) {
        fatalError("TODO")
    }
    
    func applying(_ transform: CGAffineTransform) -> FixedRoundedRect {
        fatalError("TODO")
    }
    
    func insetBy(dx: CGFloat, dy: CGFloat) -> FixedRoundedRect? {
        fatalError("TODO")
    }
    
    func hasIntersection(_ point: CGRect) -> Bool {
        fatalError("TODO")
    }
    
    func contains(path: Path, offsetBy: CGSize) -> Bool {
        fatalError("TODO")
    }
    
    func contains(rect: CGRect) -> Bool {
        fatalError("TODO")
    }
    
    var needsContinuousCorners: Bool {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension FixedRoundedRect: Sendable {
}

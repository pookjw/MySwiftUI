public import CoreGraphics

@frozen public struct StrokeStyle : Equatable {
    public var lineWidth: CGFloat
    public var lineCap: CGLineCap
    public var lineJoin: CGLineJoin
    public var miterLimit: CGFloat
    public var dash: [CGFloat]
    public var dashPhase: CGFloat
    
    public init(lineWidth: CGFloat = 1, lineCap: CGLineCap = .butt, lineJoin: CGLineJoin = .miter, miterLimit: CGFloat = 10, dash: [CGFloat] = [CGFloat](), dashPhase: CGFloat = 0) {
        assertUnimplemented()
    }
    
    public static func == (a: StrokeStyle, b: StrokeStyle) -> Bool {
        assertUnimplemented()
    }
}

extension StrokeStyle : Animatable {
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>
    
    public var animatableData: StrokeStyle.AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

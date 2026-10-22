public import CoreGraphics

@frozen public struct StrokeStyle : Equatable {
    public var lineWidth: CGFloat // 0x0
    public var lineCap: CGLineCap // 0x8
    public var lineJoin: CGLineJoin // 0xc
    public var miterLimit: CGFloat // 0x10
    public var dash: [CGFloat] // 0x18
    public var dashPhase: CGFloat // 0x20
    
    public init(
        lineWidth: CGFloat = 1,
        lineCap: CGLineCap = .butt,
        lineJoin: CGLineJoin = .miter,
        miterLimit: CGFloat = 10,
        dash: [CGFloat] = [CGFloat](),
        dashPhase: CGFloat = 0
    ) {
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.dash = dash
        self.dashPhase = dashPhase
    }
    
    public static func == (a: StrokeStyle, b: StrokeStyle) -> Bool {
        assertUnimplemented()
    }
}

extension StrokeStyle : Animatable {
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>
    
    public var animatableData: StrokeStyle.AnimatableData {
        get {
            return AnimatablePair(self.lineWidth, AnimatablePair(self.miterLimit, self.dashPhase))
        }
        set {
            self.lineWidth = newValue.first
            self.miterLimit = newValue.second.first
            self.dashPhase = newValue.second.second
        }
    }
}

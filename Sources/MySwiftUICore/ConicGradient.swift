internal import CoreGraphics

struct ConicGradient {
    private(set) var gradient: ResolvedGradient
    private var center: CGPoint
    private(set) var angle: Angle
    
    init(angular: AngularGradient._Paint, bounds: CGRect) {
        assertUnimplemented()
    }
    
    init(gradient: ResolvedGradient, center: CGPoint, angle: Angle) {
        assertUnimplemented()
    }
    
    init(gradient: ResolvedGradient, center: CGPoint, startAngle: Angle, endAngle: Angle) {
        assertUnimplemented()
    }
}

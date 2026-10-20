internal import QuartzCore

final class GradientLayer : CAGradientLayer {
    static func clippedValues(gradient: ResolvedGradient, function: GradientLayer.Function) -> ([NSNumber], [CGColor], [CAMediaTimingFunction]?) {
        assertUnimplemented()
    }
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @inline(always) // 원래 없음
    func apply(size: CGSize, function: GradientLayer.Function, bounds: CGRect) {
        let geometry = GradientLayer.GradientGeometry(size: size, function: function, bounds: bounds)
        
        self.type = geometry.type
        self.startPoint = geometry.startPoint
        self.endPoint = geometry.endPoint
    }
}

extension GradientLayer {
    // nominal type descriptor가 없음
    enum Function {
        case unknown(UnitPoint, UnitPoint, CAGradientLayerType)
    }
    
    fileprivate struct GradientGeometry {
        private(set) var size: CGSize
        private(set) var startPoint: CGPoint
        private(set) var endPoint: CGPoint
        private(set) var type: CAGradientLayerType
        
        init(size: CGSize, function: GradientLayer.Function, bounds: CGRect) {
            func makeAxis(start: CGPoint, end: CGPoint) -> (CGPoint, CGPoint) {
                var d0 = start.x
                var d1 = start.y
                var d2 = end.x
                var d3 = end.y
                var d4 = size.width
                var d5 = size.height
                var d6 = (d4 <= d5) ? d5 : d4
                d0 = d0 / d6
                d1 = d1 / d6
                d2 = d2 / d6
                d3 = d3 / d6
                var d7 = d3 - d1
                d7 = d0 + d7
                var d16 = d2 - d0
                d16 = d1 - d16
                d4 = d6 / d4
                d5 = d6 / d5
                d0 = d0 * d4
                d1 = d1 * d5
                d2 = d2 * d4
                d3 = d3 * d5
                d4 = d4 * d7
                d5 = d5 * d16
                d4 = d4 - d0
                d5 = d5 - d1
                d6 = d4 * d4
                d7 = d5 * d5
                d6 = d6 + d7
                d7 = d2 - d0
                d16 = d3 - d1
                d7 = d7 * d4
                d16 = d16 * d5
                d7 = d7 + d16
                d6 = d7 / d6
                d4 = d4 * d6
                d5 = d5 * d6
                d2 = d2 - d4
                d3 = d3 - d5
                
                return (CGPoint(x: d0, y: d1), CGPoint(x: d2, y: d3))
            }
            
            self.size = size
            
            switch function {
            case .unknown(let start, let end, let type):
                let d9 = bounds.origin.x
                let d8 = bounds.origin.y
                let d11 = bounds.size.width
                let d10 = bounds.size.height
                
                var d0 = start.x
                var d1 = start.y
                d0 = d0 * d11
                d0 = d9 + d0
                d1 = d1 * d10
                d1 = d8 + d1
                var d2 = end.x
                d2 = d2 * d11
                d2 = d9 + d2
                var d3 = end.y
                d3 = d3 * d10
                d3 = d8 + d3
                
                let axis = makeAxis(start: CGPoint(x: d0, y: d1), end: CGPoint(x: d2, y: d3))
                self.startPoint = axis.0
                self.endPoint = axis.1
                self.type = type
            }
        }
    }
}

internal import QuartzCore
private import _DarwinFoundation1._math

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
        case unknown0(UnitPoint, UnitPoint)
        case unknown1(CGPoint, CGPoint)
        case unknown2(UnitPoint, CGFloat, CGFloat)
        case unknown3(UnitPoint, CGFloat, CGFloat)
        case unknown4(UnitPoint, CGFloat)
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
            
            var d8 = size.height
            var d9 = size.width
            var d2 = bounds.origin.x
            var d3 = bounds.origin.y
            var d4 = bounds.size.width
            let d5 = bounds.size.height
            
            switch function {
            case .unknown0(let start, let end):
                // <+184>
                let d13 = start.x
                let d12 = start.y
                let d14 = end.x
                let d6 = end.y
                let type = CAGradientLayerType.axial
                var d0 = d4 * d13
                d0 = d2 + d0
                var d1 = d5 * d12
                d1 = d3 + d1
                d4 = d4 * d14
                d2 = d2 + d4
                d4 = d5 * d6
                d3 = d3 + d4
                
                let axis = makeAxis(start: CGPoint(x: d0, y: d1), end: CGPoint(x: d2, y: d3))
                
                self.size = size
                self.startPoint = axis.0
                self.endPoint = axis.1
                self.type = type
            case .unknown1(let start, let end):
                // <+472>
                let type = CAGradientLayerType.axial
                let axis = makeAxis(start: start, end: end)
                self.size = size
                self.startPoint = axis.0
                self.endPoint = axis.1
                self.type = type
            case .unknown2(let center, let startRadius, let endRadius):
                // <+232>
                let type = CAGradientLayerType.radial
                var d13 = center.x
                var d12 = center.y
                var d14 = startRadius
                let d6 = endRadius
                var d10 = (d14 <= d6) ? d6 : d14
                d14 = d3
                let d15 = d5
                let sp0x8 = (d9, d8)
                d8 = d2
                d9 = d4
                var d0 = CGRect(x: d8, y: d14, width: d9, height: d15).width
                d0 = d10 / d0
                let sp = d0
                d0 = CGRect(x: d8, y: d14, width: d9, height: d15).height
                d0 = d10 / d0
                var d1 = d9 * d13
                d1 = d8 + d1
                d2 = d15 * d12
                d2 = d14 + d2
                d3 = sp0x8.0
                d10 = d1 / d3
                d1 = sp0x8.1
                let d11 = d2 / d1
                d1 = sp
                d1 = d13 - d1
                d0 = d12 - d0
                d1 = d9 * d1
                d1 = d8 + d1
                d9 = sp0x8.0
                d8 = sp0x8.1
                d0 = d15 * d0
                d0 = d14 + d0
                d12 = d1 / d9
                d13 = d0 / d8
                
                self.size = CGSize(width: d9, height: d8)
                self.startPoint = CGPoint(x: d10, y: d11)
                self.endPoint = CGPoint(x: d12, y: d13)
                self.type = type
            case .unknown3(let center, let startRadiusFraction, let endRadiusFraction):
                // <+96>
                let type = CAGradientLayerType.radial
                var d13 = center.x
                var d12 = center.y
                let d14 = startRadiusFraction
                let d6 = endRadiusFraction
                var d0 = d4 * d13
                d0 = d2 + d0
                var d1 = d5 * d12
                d1 = d3 + d1
                let d10 = d0 / d9
                let d11 = d1 / d8
                d0 = (d14 <= d6) ? d6 : d14
                d1 = d13 - d0
                d0 = d12 - d0
                d1 = d4 * d1
                d1 = d2 + d1
                d0 = d5 * d0
                d0 = d3 + d0
                d12 = d1 / d9
                d13 = d0 / d8
                
                self.size = CGSize(width: d9, height: d8)
                self.startPoint = CGPoint(x: d10, y: d11)
                self.endPoint = CGPoint(x: d12, y: d13)
                self.type = type
            case .unknown4(let center, let angle):
                // <+408>
                let type = CAGradientLayerType.conic
                var d13 = center.x
                var d12 = center.y
                let d14 = angle
                var d0 = d4 * d13
                d0 = d2 + d0
                var d1 = d5 * d12
                d1 = d3 + d1
                let d10 = d0 / d9
                let d11 = d1 / d8
                d0 = d14
                do {
                    let values = __sincos_stret(d0)
                    d0 = values.__sinval
                    d1 = values.__cosval
                }
                d12 = d10 + d1
                d13 = d11 + d0
                
                self.size = CGSize(width: d9, height: d8)
                self.startPoint = CGPoint(x: d10, y: d11)
                self.endPoint = CGPoint(x: d12, y: d13)
                self.type = type
            }
        }
    }
}

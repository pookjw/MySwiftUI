// E19F490D25D5E0EC8A24903AF958E341
internal import QuartzCore

struct ShapeLayerHelper {
    static func layerType(_ path: Path, _ paint: AnyResolvedPaint, mayClip: Bool) -> CALayer.Type {
        struct Visitor : ResolvedPaintVisitor {
            private(set) var shapeType: ShapeType
            private(set) var mayClip: Bool
            private(set) var requiredType: CALayer.Type?
            
            mutating func visitPaint<T>(_ paint: T) where T : ResolvedPaint {
                let paintType = PaintType(paint)
                self.requiredType = contentLayerType(self.shapeType, paintType, mayClip: self.mayClip)
            }
        }
        
        var visitor = Visitor(
            shapeType: ShapeType(path),
            mayClip: mayClip,
            requiredType: nil
        )
        
        paint.visit(&visitor)
        return visitor.requiredType!
    }
    
    var layer: CALayer // 0x0
    private(set) var layerType: CALayer.Type // 0x8
    private(set) var path: Path // 0x10
    var origin: CGPoint // 0x38
    private(set) var paint: AnyResolvedPaint // 0x48
    var paintBounds: CGRect // 0x50
    private(set) var style: FillStyle // 0x70
    private(set) var contentsScale: CGFloat // 0x78
    private(set) var mayClip: Bool // 0x80
}

extension ShapeLayerHelper : ResolvedPaintVisitor {
    mutating func visitPaint<T>(_ paint: T) where T : ResolvedPaint {
        assertUnimplemented()
    }
}

fileprivate enum PaintType {
    case color(Color.ResolvedHDR)
    case linearGradient(LinearGradient._Paint)
    case linearGradientAbs(LinearGradient.AbsolutePaint)
    case radialGradient(RadialGradient._Paint)
    case ellipticalGradient(EllipticalGradient._Paint)
    case angularGradient(AngularGradient._Paint)
    case other
    
    init<T : ResolvedPaint>(_ paint: T) {
        if let casted = paint as? Color.Resolved {
            self = .color(Color.ResolvedHDR(casted))
        } else if let casted = paint as? ColorView {
            self = .color(casted.color)
        } else if let casted = paint as? LinearGradient._Paint {
            if let constantColor = casted.gradient.constantColor {
                self = .color(constantColor)
            } else {
                self = .linearGradient(casted)
            }
        } else if let casted = paint as? LinearGradient.AbsolutePaint {
            if let constantColor = casted.gradient.constantColor {
                self = .color(constantColor)
            } else {
                self = .linearGradientAbs(casted)
            }
        } else if let casted = paint as? RadialGradient._Paint {
            if let constantColor = casted.gradient.constantColor {
                self = .color(constantColor)
            } else {
                self = .radialGradient(casted)
            }
        } else if let casted = paint as? EllipticalGradient._Paint {
            if let constantColor = casted.gradient.constantColor {
                self = .color(constantColor)
            } else {
                self = .ellipticalGradient(casted)
            }
        } else if let casted = paint as? AngularGradient._Paint {
            if let constantColor = casted.gradient.constantColor {
                self = .color(constantColor)
            } else {
                self = .angularGradient(casted)
            }
        } else {
            self = .other
        }
    }
}

fileprivate func contentLayerType(_ shapeType: ShapeType, _ paintType: PaintType, mayClip: Bool) -> CALayer.Type {
    switch shapeType {
    case .rect(_, _, _):
        // <+148>
        switch paintType {
        case .color(_):
            // <+448>
            return CALayer.self
        case .linearGradient, .linearGradientAbs, .radialGradient, .ellipticalGradient, .angularGradient:
            // <+168>
            if mayClip {
                return GradientLayer.self
            } else {
                return UnclippedGradientLayer.self
            }
        case .other:
            // <+520>
            return PaintShapeLayer.self
        }
    case .rectBorder(_, _, _, _):
        // <+288>
        switch paintType {
        case .color:
            // <+448>
            return CALayer.self
        case .linearGradient, .linearGradientAbs, .radialGradient, .ellipticalGradient, .angularGradient, .other:
            // <+520>
            return PaintShapeLayer.self
        }
    case .strokedPath(_, _):
        // <+244>
        switch paintType {
        case .color:
            // <+380>
            return ColorShapeLayer.self
        case .linearGradient, .linearGradientAbs, .radialGradient, .ellipticalGradient, .angularGradient, .other:
            // <+256>
            return PaintShapeLayer.self
        }
    case .empty:
        return CALayer.self
    case .other:
        switch paintType {
        case .color:
            // <+380>
            return ColorShapeLayer.self
        case .linearGradient, .linearGradientAbs, .radialGradient, .ellipticalGradient, .angularGradient, .other:
            // <+520>
            return PaintShapeLayer.self
        }
    }
}

fileprivate final class UnclippedGradientLayer : CALayer {
    override init() {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override init(layer: Any) {
        assertUnimplemented()
    }
}

fileprivate final class PaintShapeLayer : CALayer {
    // TODO
    
    override init() {
        assertUnimplemented()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override init(layer: Any) {
        assertUnimplemented()
    }
}

fileprivate final class ColorShapeLayer : CAShapeLayer {
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
}

extension CALayer {
    @inline(always) // 원래 없음
    static var isPaintShapeLayer: Bool {
        return self == PaintShapeLayer.self
    }
    
    @inline(always) // 원래 없음
    static var isColorShapeLayer: Bool {
        return self == ColorShapeLayer.self
    }
}

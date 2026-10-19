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
    
    // TODO
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

fileprivate func contentLayerType(_: ShapeType, _: PaintType, mayClip: Bool) -> CALayer.Type {
    assertUnimplemented()
}

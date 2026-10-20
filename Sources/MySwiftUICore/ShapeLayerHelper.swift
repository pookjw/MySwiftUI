// E19F490D25D5E0EC8A24903AF958E341
internal import QuartzCore
private import _QuartzCorePrivate
private import _MySwiftUICoreShims

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
        /*
         self -> x20
         paint -> x0 -> x28
         x19 -> sp + 0x20
         x29 -> sp + 0x430
         */
        // <+128>
        // x19 + 0x2c8 (sp + 0x2e8) -> x21 + 0x40 (sp + 0x160)
        let shapeType = ShapeType(self.path)
        // x29 - 0xf0 (sp + 0x340) -> x21 + 0x140 (sp + 0x260)
        let paintType = PaintType(paint)
        let layerType = contentLayerType(shapeType, paintType, mayClip: self.mayClip)
        
        guard layerType == self.layerType else {
            self.layerType = layerType
            return
        }
        
        // <+392>
        self.layer.allowsEdgeAntialiasing = self.style.isAntialiased
        
        /*
         paintType -> x21 + 0x40 (sp + 0x160)
         shapeType -> x21 + 0x80 (sp + 0x1a0)
         */
        
        switch shapeType {
        case .rect(let rect, let radius, let style):
            // <+556>
            // paintType -> x19 + 0x100 (sp + 0x120)
            switch paintType {
            case .color(let resolved):
                // <+568>
                updateContent(layer: self.layer, color: resolved, radius: radius, style: style)
                // <+3324>
                assertUnimplemented()
            case .linearGradient(let paint):
                // <+1652>
                // <+1672>
                // x19 + 0x240 (sp + 0x260)
                let copy_1 = self
                
                let gradientLayer = self.gradientLayer()
                gradientLayer.cornerRadius = radius
                gradientLayer.cornerCurve = (style == .continuous) ? .continuous : .circular
                
                if !self.mayClip {
                    gradientLayer.bounds = self.paintBounds
                }
                
                if isLinkedOnOrAfter(.v4) {
                    gradientLayer.premultiplied = true
                }
                
                // <+4632>
                let function = GradientLayer.Function.unknown(paint.startPoint, paint.endPoint, .axial)
                // inlined
                gradientLayer.apply(
                    size: rect.size,
                    function: function,
                    bounds: copy_1.paintBounds
                )
                
                let clippedValues = GradientLayer.clippedValues(gradient: paint.gradient, function: function)
                gradientLayer.colors = clippedValues.1
                gradientLayer.locations = clippedValues.0
                gradientLayer.interpolations = clippedValues.2
                
                // <+6484>
                let colorSpace: CGColorSpace
                switch paint.gradient.colorSpace {
                case .device:
                    // <+6776>
                    colorSpace = Color.Resolved.srgbExtended
                case .linear:
                    // <+6744>
                    colorSpace = Color.Resolved.srgbExtendedLinear
                case .perceptual:
                    // <+6500>
                    colorSpace = unsafe _CGColorSpaceGetPerceptual().takeUnretainedValue()
                }
                
                gradientLayer.colorSpace = colorSpace
                // <+3324>
                assertUnimplemented()
            case .linearGradientAbs(let absolutePaint):
                // <+2608>
                assertUnimplemented()
            case .radialGradient(let _Paint):
                // <+1268>
                assertUnimplemented()
            case .ellipticalGradient(let _Paint):
                // <+2992>
                assertUnimplemented()
            case .angularGradient(let _Paint):
                // <+2048>
                assertUnimplemented()
            case .other:
                // <+3012>
                assertUnimplemented()
            }
        case .rectBorder(let rect, let radius, let style, let lineWidth):
            // <+856>
            assertUnimplemented()
        case .strokedPath(let path, let style):
            // <+656>
            assertUnimplemented()
        case .empty, .other:
            // <+1076>
            assertUnimplemented()
        }
    }
    
    fileprivate func gradientLayer() -> GradientLayer {
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

fileprivate func updateContent(layer: CALayer, color: Color.ResolvedHDR, radius: CGFloat, style: RoundedCornerStyle) {
    assertUnimplemented()
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

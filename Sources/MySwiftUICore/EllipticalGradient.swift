public import CoreGraphics

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct EllipticalGradient : ShapeStyle, View, Sendable {
  package var gradient: Gradient
  package var center: UnitPoint
  package var startRadiusFraction: CGFloat
  package var endRadiusFraction: CGFloat
    
    public init(gradient: Gradient, center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) {
        assertUnimplemented()
    }
    
    public init(colors: [Color], center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) {
        assertUnimplemented()
    }
    
    public init(stops: [Gradient.Stop], center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) {
        assertUnimplemented()
    }
    
  public typealias Body = _ShapeView<Rectangle, EllipticalGradient>
  public typealias Resolved = Never
    
    func resolvePaint(in environment: EnvironmentValues) -> EllipticalGradient._Paint {
        assertUnimplemented()
    }
    
    func fallbackColor(in environment: EnvironmentValues) -> Color? {
        assertUnimplemented()
    }
}

extension EllipticalGradient {
    struct _Paint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: EllipticalGradient._Paint, rhs: EllipticalGradient._Paint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private(set) var center: UnitPoint
        private(set) var startRadiusFraction: CGFloat
        private(set) var endRadiusFraction: CGFloat
        private(set) var allowedDynamicRange: Image.DynamicRange
        
        var isClear: Bool {
            assertUnimplemented()
        }
        
        var isOpaque: Bool {
            assertUnimplemented()
        }
        
        var resolvedGradient: ResolvedGradient? {
            assertUnimplemented()
        }
        
        var isCALayerCompatible: Bool {
            assertUnimplemented()
        }
        
        var contentHeadroom: Float {
            assertUnimplemented()
        }
        
        func encodePaint(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        func draw(path: Path, style: PathDrawingStyle, in context: GraphicsContext, bounds: CGRect?) {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        var animatableData: AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, ResolvedGradientVector>, AnimatablePair<CGFloat, CGFloat>> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
@frozen public struct _AnyEllipticalGradient : ShapeStyle, Paint {
    @usableFromInline
    internal var gradient: AnyGradient
    @usableFromInline
    internal var center: UnitPoint
    @usableFromInline
    internal var startRadiusFraction: CGFloat
    @usableFromInline
    internal var endRadiusFraction: CGFloat
    
    @inlinable internal init(gradient: AnyGradient, center: UnitPoint = .center, startRadiusFraction: CGFloat, endRadiusFraction: CGFloat) {
        self.gradient = gradient
        self.center = center
        self.startRadiusFraction = startRadiusFraction
        self.endRadiusFraction = endRadiusFraction
    }
    
    public typealias Resolved = Never
    
    func resolvePaint(in environment: EnvironmentValues) -> EllipticalGradient._Paint {
        assertUnimplemented()
    }
    
    func fallbackColor(in environment: EnvironmentValues) -> Color? {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension ShapeStyle where Self == EllipticalGradient {
    @_alwaysEmitIntoClient public static func ellipticalGradient(_ gradient: AnyGradient, center: UnitPoint = .center, startRadiusFraction: CGFloat = 0, endRadiusFraction: CGFloat = 0.5) -> some ShapeStyle {
        return _AnyEllipticalGradient(
            gradient: gradient,
            center: center,
            startRadiusFraction: startRadiusFraction,
            endRadiusFraction: endRadiusFraction
        )
    }
}

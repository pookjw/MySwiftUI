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
}

extension EllipticalGradient {
    struct _Paint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: EllipticalGradient._Paint, rhs: EllipticalGradient._Paint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private var center: UnitPoint
        private var startRadiusFraction: CGFloat
        private var endRadiusFraction: CGFloat
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

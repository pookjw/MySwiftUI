internal import CoreGraphics

@frozen public struct AngularGradient : @preconcurrency ShapeStyle, View, Sendable {
    package var gradient: Gradient
    package var center: UnitPoint
    package var startAngle: Angle
    package var endAngle: Angle
    
    public init(gradient: Gradient, center: UnitPoint, startAngle: Angle = .zero, endAngle: Angle = .zero) {
        assertUnimplemented()
    }
    
    @_alwaysEmitIntoClient public init(colors: [Color], center: UnitPoint, startAngle: Angle, endAngle: Angle) {
        self.init(gradient: Gradient(colors: colors), center: center,
                  startAngle: startAngle, endAngle: endAngle)
    }
    
    @_alwaysEmitIntoClient public init(stops: [Gradient.Stop], center: UnitPoint, startAngle: Angle, endAngle: Angle) {
        self.init(gradient: Gradient(stops: stops), center: center,
                  startAngle: startAngle, endAngle: endAngle)
    }
    
    public init(gradient: Gradient, center: UnitPoint, angle: Angle = .zero) {
        assertUnimplemented()
    }
    
    @_alwaysEmitIntoClient public init(colors: [Color], center: UnitPoint, angle: Angle = .zero) {
        self.init(gradient: Gradient(colors: colors), center: center,
                  angle: angle)
    }
    
    @_alwaysEmitIntoClient public init(stops: [Gradient.Stop], center: UnitPoint, angle: Angle = .zero) {
        self.init(gradient: Gradient(stops: stops), center: center,
                  angle: angle)
    }
    
    @available(*, deprecated, message: "obsolete")
    @_alwaysEmitIntoClient public static func _makeView<S>(view: _GraphValue<_ShapeView<S, AngularGradient>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        _ShapeView<S, Self>._makeView(view: view, inputs: inputs)
    }
    
    public typealias Body = _ShapeView<Rectangle, AngularGradient>
    public typealias Resolved = Never
}

extension AngularGradient {
    struct _Paint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: AngularGradient._Paint, rhs: AngularGradient._Paint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private var center: UnitPoint
        private var startAngle: Angle
        private var endAngle: Angle
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
        
        var animatableData: AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, ResolvedGradientVector>, AnimatablePair<Double, Double>> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
}

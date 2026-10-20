public import CoreGraphics

@frozen public struct RadialGradient : @preconcurrency ShapeStyle, View, Sendable {
    package var gradient: Gradient
    package var center: UnitPoint
    package var startRadius: CGFloat
    package var endRadius: CGFloat
    
    public init(gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        assertUnimplemented()
    }
    
    @_alwaysEmitIntoClient public init(colors: [Color], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(colors: colors), center: center,
                  startRadius: startRadius, endRadius: endRadius)
    }
    
    @_alwaysEmitIntoClient public init(stops: [Gradient.Stop], center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(stops: stops), center: center,
                  startRadius: startRadius, endRadius: endRadius)
    }
    
    @available(*, deprecated, message: "obsolete")
    @_alwaysEmitIntoClient public static func _makeView<S>(view: _GraphValue<_ShapeView<S, RadialGradient>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        _ShapeView<S, Self>._makeView(view: view, inputs: inputs)
    }
    
    public typealias Body = _ShapeView<Rectangle, RadialGradient>
    public typealias Resolved = Never
}

extension RadialGradient {
    struct _Paint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: RadialGradient._Paint, rhs: RadialGradient._Paint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private(set) var center: UnitPoint
        private(set) var startRadius: CGFloat
        private(set) var endRadius: CGFloat
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

internal import CoreGraphics

@frozen public struct LinearGradient : @preconcurrency ShapeStyle, View, Sendable {
    package var gradient: Gradient
    package var startPoint: UnitPoint
    package var endPoint: UnitPoint
    
    public init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) {
        assertUnimplemented()
    }
    
    @_alwaysEmitIntoClient public init(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(colors: colors),
                  startPoint: startPoint, endPoint: endPoint)
    }
    
    @_alwaysEmitIntoClient public init(stops: [Gradient.Stop], startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(stops: stops),
                  startPoint: startPoint, endPoint: endPoint)
    }
    
    @available(*, deprecated, message: "obsolete")
    @_alwaysEmitIntoClient public static func _makeView<S>(view: _GraphValue<_ShapeView<S, LinearGradient>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        _ShapeView<S, Self>._makeView(view: view, inputs: inputs)
    }
    
    public typealias Body = _ShapeView<Rectangle, LinearGradient>
    public typealias Resolved = Never
}

extension LinearGradient {
    struct _Paint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: LinearGradient._Paint, rhs: LinearGradient._Paint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private(set) var startPoint: UnitPoint
        private(set) var endPoint: UnitPoint
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
        
        var animatableData: AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>, ResolvedGradientVector> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
    
    struct AbsolutePaint : ResolvedPaint, ProtobufDecodableMessage {
        static func == (lhs: LinearGradient.AbsolutePaint, rhs: LinearGradient.AbsolutePaint) -> Bool {
            assertUnimplemented()
        }
        
        var gradient: ResolvedGradient
        private var startPoint: CGPoint
        private var endPoint: CGPoint
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
        
        var animatableData: AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>, ResolvedGradientVector> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
}

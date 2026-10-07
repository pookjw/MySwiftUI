// 4DBF651155A4B32ED86C55EAB1B96C61

struct _ShapeStyle_Pack : Equatable, Animatable {
    @safe static nonisolated(unsafe) let defaultValue: _ShapeStyle_Pack = {
        assertUnimplemented()
    }()
    
    static func == (lhs: _ShapeStyle_Pack, rhs: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
    
    private var styles: [(key: _ShapeStyle_Pack.Key, style: _ShapeStyle_Pack.Style)]
    
    init() {
        self.styles = []
    }
    
    subscript(name: _ShapeStyle_Name, index: Int) -> _ShapeStyle_Pack.Style {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var animatableData: KeyedAnimatableArray<_ShapeStyle_Pack.Key, AnimatablePair<_ShapeStyle_Pack.Fill.AnimatableData, AnimatablePair<Float, AnimatableArray<AnimatablePair<Float, _ShapeStyle_Pack.Effect.Kind.AnimatableData>>>>> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    mutating func createOpacities(count: Int, name: _ShapeStyle_Name, environment: EnvironmentValues) {
        assertUnimplemented()
    }
}

extension _ShapeStyle_Pack {
    struct Style {
        var fill: _ShapeStyle_Pack.Fill // 0x0
        var opacity: Float = 1 // 0x58
        var _blend: GraphicsBlendMode? = nil // 0x60
        var effects: [_ShapeStyle_Pack.Effect] = [] // 0x70
        
        init(_ fill: _ShapeStyle_Pack.Fill) {
            self.fill = fill
        }
        
        mutating func applyOpacity(_ opacity: Float) {
            assertUnimplemented()
        }
        
        func applyingOpacity(_ opacity: Float) -> _ShapeStyle_Pack.Style {
            assertUnimplemented()
        }
        
        static var clear: _ShapeStyle_Pack.Style {
            assertUnimplemented()
        }
        
        static func == (lhs: _ShapeStyle_Pack.Style, rhs: _ShapeStyle_Pack.Style) -> Bool {
            assertUnimplemented()
        }
        
        var isClear: Bool {
            assertUnimplemented()
        }
        
        var color: Color.ResolvedHDR? {
            assertUnimplemented()
        }
        
        var ignoresBackdrop: Bool {
            assertUnimplemented()
        }
        
//        var animatableData: AnimatablePair<_ShapeStyle_Pack.Fill.AnimatableData, AnimatablePair<Float, AnimatableArray<AnimatablePair<Float, _ShapeStyle_Pack.Effect.Kind.AnimatableData>>>> {
//            get {
//                assertUnimplemented()
//            }
//            set {
//                assertUnimplemented()
//            }
//        }
        
//        fileprivate func modifyStyle(for layer: RBSymbolUpdateLayer) {
//            assertUnimplemented()
//        }
        
//        func draw(_: Path, style: PathDrawingStyle, in: GraphicsContext, bounds: CGRect?) {
//            assertUnimplemented()
//        }
    }
    
    enum Fill : Animatable {
        case color(Color.ResolvedHDR)
        case paint(AnyResolvedPaint)
//        case foregroundMaterial(Color.ResolvedHDR, ContentStyle.MaterialResolved)
        case backgroundMaterial(Material.ResolvedMaterial)
//        case duotoneColor(Color.ResolvedDuotone)
        case vibrantMatrix(GraphicsFilter.VibrantColorMatrix)
        case multicolor(ResolvedMulticolorStyle)
        
        var animatableData: _ShapeStyle_Pack.Fill.AnimatableData {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
    
    struct Effect {
        private var kind: _ShapeStyle_Pack.Effect.Kind
        private var opacity: Float
        private var _blend: GraphicsBlendMode?
    }
    
    struct Key : Comparable {
        static func < (lhs: _ShapeStyle_Pack.Key, rhs: _ShapeStyle_Pack.Key) -> Bool {
            assertUnimplemented()
        }
        
        static func == (lhs: _ShapeStyle_Pack.Key, rhs: _ShapeStyle_Pack.Key) -> Bool {
            assertUnimplemented()
        }
        
        private var name: _ShapeStyle_Name
        private var _level: UInt8
    }
}

extension _ShapeStyle_Pack.Effect {
    enum Kind : Equatable, Animatable {
        static func == (lhs: _ShapeStyle_Pack.Effect.Kind, rhs: _ShapeStyle_Pack.Effect.Kind) -> Bool {
            assertUnimplemented()
        }
        
        case shadow(ResolvedShadowStyle)
        case none
        
        var animatableData: _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
}

extension _ShapeStyle_Pack.Effect.Kind {
    enum AnimatableData : VectorArithmetic {
        static func == (lhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) -> Bool {
            assertUnimplemented()
        }
        
        static var zero: _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            assertUnimplemented()
        }
        
        static func + (lhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) -> _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            assertUnimplemented()
        }
        
        static func += (lhs: inout _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) {
            assertUnimplemented()
        }
        
        static func - (lhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) -> _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            assertUnimplemented()
        }
        
        static func -= (lhs: inout _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) {
            assertUnimplemented()
        }
        
        mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        var magnitudeSquared: Double {
            assertUnimplemented()
        }
        
        // TODO
    }
}

extension _ShapeStyle_Pack.Fill {
    enum AnimatableData : VectorArithmetic {
        static func == (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> Bool {
            assertUnimplemented()
        }
        
        static var zero: _ShapeStyle_Pack.Fill.AnimatableData {
            assertUnimplemented()
        }
        
        static func + (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> _ShapeStyle_Pack.Fill.AnimatableData {
            assertUnimplemented()
        }
        
        static func += (lhs: inout _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) {
            assertUnimplemented()
        }
        
        static func - (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> _ShapeStyle_Pack.Fill.AnimatableData {
            assertUnimplemented()
        }
        
        static func -= (lhs: inout _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) {
            assertUnimplemented()
        }
        
        mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        var magnitudeSquared: Double {
            assertUnimplemented()
        }
        
        // TODO
    }
}

extension _ShapeStyle_Pack.Fill.AnimatableData {
    fileprivate struct PaintSetVisitor {
        // TODO
    }
    
    fileprivate struct PaintInitVisitor {
        // TODO
    }
}

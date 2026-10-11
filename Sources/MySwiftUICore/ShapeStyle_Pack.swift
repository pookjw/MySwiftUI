// 4DBF651155A4B32ED86C55EAB1B96C61
internal import CoreGraphics

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
            let key = _ShapeStyle_Pack.Key(name: name, _level: UInt8(truncatingIfNeeded: index))
            
            for i in self.styles.indices {
                let value = self.styles[i]
                
                if value.key == key {
                    return value.style
                } else if (name < value.key.name) || (!(value.key._level <= key._level) && (value.key.name == key.name)) {
                    if i == self.styles.startIndex {
                        break
                    }
                    
                    let before = self.styles[self.styles.indices.index(before: i)]
                    
                    if before.key.name != key.name {
                        break
                    }
                    
                    return before.style
                }
            }
            
            // <+308>
            return _ShapeStyle_Pack.Style.clear
        }
        set {
            let key = _ShapeStyle_Pack.Key(name: name, _level: UInt8(truncatingIfNeeded: index))
            
            for i in self.styles.indices {
                let value = self.styles[i]
                
                if value.key == key {
                    // <+224>
                    self.styles[i] = (key: key, style: newValue)
                    return
                } else if (name < value.key.name) || (!(value.key._level <= key._level) && (value.key.name == key.name)) {
                    // <+388>
                    self.styles.insert((key: key, style: newValue), at: i)
                    return
                }
            }
            
            // <+164>
            self.styles.insert((key: key, style: newValue), at: self.styles.endIndex)
        }
    }
    
    var animatableData: KeyedAnimatableArray<_ShapeStyle_Pack.Key, AnimatablePair<_ShapeStyle_Pack.Fill.AnimatableData, AnimatablePair<Float, AnimatableArray<AnimatablePair<Float, _ShapeStyle_Pack.Effect.Kind.AnimatableData>>>>> {
        get {
            var elements: [KeyedAnimatableArray<_ShapeStyle_Pack.Key, AnimatablePair<_ShapeStyle_Pack.Fill.AnimatableData, AnimatablePair<Float, AnimatableArray<AnimatablePair<Float, _ShapeStyle_Pack.Effect.Kind.AnimatableData>>>>>.Element] = []
            
            if !self.styles.isEmpty {
                elements.reserveCapacity(self.styles.count)
                
                for style in self.styles {
                    // inlined
                    elements.append(
                        KeyedAnimatableArray.Element(
                            key: style.key,
                            data: style.style.animatableData
                        )
                    )
                }
            }
            
            return KeyedAnimatableArray(elements)
        }
        set {
            var startIndex = self.styles.startIndex
            
            for incoming in newValue.elements {
                for index in startIndex..<self.styles.endIndex {
                    let key = self.styles[index].key
                    
                    if incoming.key == key {
                        // inlined
                        self.styles[index].style.animatableData = incoming.data
                        startIndex = self.styles.index(after: index)
                        break
                    } else if (key.name < incoming.key.name) || (!(key._level >= incoming.key._level) && (key.name == incoming.key.name)) {
                        startIndex = self.styles.index(after: index)
                        continue
                    } else {
                        startIndex = index
                        break
                    }
                }
            }
        }
    }
    
    mutating func createOpacities(count: Int, name: _ShapeStyle_Name, environment: EnvironmentValues) {
        /*
         self -> x20 -> x19
         count -> x0 -> x21
         name -> x1 -> sp + 0x34 / x29 - 0xf0
         environment -> x2 -> x25/x27
         */
        let indices = self.indices(of: name)
        
        guard (indices.count == 1) && !(count < 2) else {
            return
        }
        
        let definition = environment.systemColorDefinition
        let firstStyle = self.styles[indices.lowerBound]
        
        for index in 1..<count {
            // <+284>
            let opacity = definition.opacity(at: index, environment: environment)
            self.styles.insert(
                (
                    key: _ShapeStyle_Pack.Key(name: name, _level: UInt8(truncatingIfNeeded: index)),
                    style: firstStyle.style.applyingOpacity(opacity)
                ),
                at: indices.lowerBound &+ index
            )
        }
    }
    
    fileprivate func indices(of name: _ShapeStyle_Name) -> Range<Int> {
        var lowerBound = 0
        var upperBound = self.styles.indices.upperBound
        
        for style in self.styles {
            if style.key.name == name {
                break
            }
            
            lowerBound &+= 1
        }
        
        // <+60>
        if lowerBound >= upperBound {
            upperBound = lowerBound
        } else {
            var x9 = lowerBound
            
            var found = false
            for index in lowerBound..<upperBound {
                if self.styles[index].key.name != name {
                    found = true
                    break
                }
                
                x9 &+= 1
            }
            
            if found {
                upperBound = x9
            } else {
                x9 = upperBound
            }
            
            // <+124>
            assert(!(x9 < lowerBound))
        }
        
        return lowerBound..<upperBound
    }
}

extension _ShapeStyle_Pack {
    struct Style : Animatable, Equatable {
        static func == (lhs: _ShapeStyle_Pack.Style, rhs: _ShapeStyle_Pack.Style) -> Bool {
            assertUnimplemented()
        }
        
        @safe static nonisolated(unsafe) let clear: _ShapeStyle_Pack.Style = {
            assertUnimplemented()
        }()
        
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
        
        var isClear: Bool {
            assertUnimplemented()
        }
        
        var color: Color.ResolvedHDR? {
            assertUnimplemented()
        }
        
        var ignoresBackdrop: Bool {
            assertUnimplemented()
        }
        
        var animatableData: AnimatablePair<_ShapeStyle_Pack.Fill.AnimatableData, AnimatablePair<Float, AnimatableArray<AnimatablePair<Float, _ShapeStyle_Pack.Effect.Kind.AnimatableData>>>> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
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
        case foregroundMaterial(Color.ResolvedHDR, ContentStyle.MaterialResolved)
        case backgroundMaterial(Material.ResolvedMaterial)
        case duotoneColor(Color.ResolvedDuotone)
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
        var opacity: Float
        private var _blend: GraphicsBlendMode?
    }
    
    struct Key : Comparable {
        static func < (lhs: _ShapeStyle_Pack.Key, rhs: _ShapeStyle_Pack.Key) -> Bool {
            assertUnimplemented()
        }
        
        static func == (lhs: _ShapeStyle_Pack.Key, rhs: _ShapeStyle_Pack.Key) -> Bool {
            assertUnimplemented()
        }
        
        private(set) var name: _ShapeStyle_Name
        private(set) var _level: UInt8
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
        
        static func + (lhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) -> _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            assertUnimplemented()
        }
        
        static func - (lhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData, rhs: _ShapeStyle_Pack.Effect.Kind.AnimatableData) -> _ShapeStyle_Pack.Effect.Kind.AnimatableData {
            assertUnimplemented()
        }
        
        case shadow(AnimatablePair<AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>>, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>)
        case zero
        
        init(_: _ShapeStyle_Pack.Effect.Kind) {
            assertUnimplemented()
        }
        
        mutating func set(effect: inout _ShapeStyle_Pack.Effect.Kind) {
            assertUnimplemented()
        }
        
        mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        var magnitudeSquared: Double {
            assertUnimplemented()
        }
    }
}

extension _ShapeStyle_Pack.Fill {
    enum AnimatableData : VectorArithmetic {
        static func == (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> Bool {
            assertUnimplemented()
        }
        
        static func + (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> _ShapeStyle_Pack.Fill.AnimatableData {
            assertUnimplemented()
        }
        
        static func - (lhs: _ShapeStyle_Pack.Fill.AnimatableData, rhs: _ShapeStyle_Pack.Fill.AnimatableData) -> _ShapeStyle_Pack.Fill.AnimatableData {
            assertUnimplemented()
        }
        
        case color(Color.ResolvedHDR._Animatable)
        case duotoneColor(AnimatablePair<AnimatablePair<Float, AnimatablePair<Float, Float>>, AnimatablePair<Float, AnimatablePair<Float, Float>>>)
        case linearGradient(AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>>, ResolvedGradientVector>)
        case radialGradient(AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, ResolvedGradientVector>, AnimatablePair<CGFloat, CGFloat>>)
        case ellipticalGradient(AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, ResolvedGradientVector>, AnimatablePair<CGFloat, CGFloat>>)
        case angularGradient(AnimatablePair<AnimatablePair<AnimatablePair<CGFloat, CGFloat>, ResolvedGradientVector>, AnimatablePair<Double, Double>>)
        case meshGradient(AnimatablePair<AnimatableArray<Float>, AnimatablePair<AnimatableArray<AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>>>, Color.ResolvedHDR._Animatable>>)
        case shader(ShaderVectorData)
        case colorMatrix(_ColorMatrix)
        case zero
        
        mutating func scale(by rhs: Double) {
            assertUnimplemented()
        }
        
        var magnitudeSquared: Double {
            assertUnimplemented()
        }
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

// 4F6988968057BB8D11F78AD2EE32ACB1
internal import AttributeGraph
public import CoreGraphics
public import Spatial

extension View {
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `background(alignment:content:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `background(alignment:content:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `background(alignment:content:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `background(alignment:content:)` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use `background(alignment:content:)` instead.")
    @inlinable @_disfavoredOverload nonisolated public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View {
        return modifier(
            _BackgroundModifier(background: background, alignment: alignment))
    }
    
}
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @inlinable nonisolated public func background<V>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View {
        modifier(
            _BackgroundModifier(background: content(), alignment: alignment))
    }
    
    @inlinable nonisolated public func background(ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
        modifier(_BackgroundStyleModifier(
            style: .background, ignoresSafeAreaEdges: edges))
    }
    
    @inlinable nonisolated public func background<S>(_ style: S, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View where S : ShapeStyle {
        modifier(_BackgroundStyleModifier(
            style: style, ignoresSafeAreaEdges: edges))
    }
    
    @inlinable nonisolated public func background<S>(in shape: S, fillStyle: FillStyle = FillStyle()) -> some View where S : Shape {
        modifier(_BackgroundShapeModifier(
            style: .background, shape: shape, fillStyle: fillStyle))
    }
    
    @inlinable nonisolated public func background<S, T>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View where S : ShapeStyle, T : Shape {
        modifier(_BackgroundShapeModifier(
            style: style, shape: shape, fillStyle: fillStyle))
    }
    
    @inlinable nonisolated public func background<S>(in shape: S, fillStyle: FillStyle = FillStyle()) -> some View where S : InsettableShape {
        modifier(_InsettableBackgroundShapeModifier(
            style: .background, shape: shape, fillStyle: fillStyle))
    }
    
    @inlinable nonisolated public func background<S, T>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View where S : ShapeStyle, T : InsettableShape {
        modifier(_InsettableBackgroundShapeModifier(
            style: style, shape: shape, fillStyle: fillStyle))
    }
}

@frozen public struct _BackgroundModifier<Background> : ViewModifier where Background : View {
    @safe public nonisolated(unsafe) var background: Background
    @safe public nonisolated(unsafe) var alignment: Alignment
    
    @inlinable public nonisolated init(background: Background, alignment: Alignment = .center) {
        self.background = background
        self.alignment = alignment
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_BackgroundModifier<Background>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return makeSecondaryLayerView(
            secondaryLayer: modifier[{ .of(&$0.background)}].value,
            alignment: modifier[{ .of(&$0.alignment)}].value,
            inputs: inputs,
            body: body,
            flipOrder: true
        )
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _BackgroundModifier : Sendable {
}

extension _BackgroundModifier : Equatable where Background : Equatable {
    public static func == (a: _BackgroundModifier<Background>, b: _BackgroundModifier<Background>) -> Bool {
        assertUnimplemented()
    }
}

extension _BackgroundModifier : MultiViewModifier, PrimitiveViewModifier {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _BackgroundStyleModifier<Style> : ViewModifier where Style : ShapeStyle {
    public var style: Style
    public var ignoresSafeAreaEdges: Edge.Set
    
    @inlinable public init(style: Style, ignoresSafeAreaEdges: Edge.Set) {
        self.style = style
        self.ignoresSafeAreaEdges = ignoresSafeAreaEdges
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_BackgroundStyleModifier<Style>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return _BackgroundStyleModifier.makeShapeView(modifier: modifier, inputs: inputs, shapeIsBackground: true, body: body)
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
    
    nonisolated static func makeShapeView(modifier: _GraphValue<_BackgroundStyleModifier<Style>>, inputs: _ViewInputs, shapeIsBackground: Bool, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w27
         inputs -> x1 -> x20
         shapeIsBackground -> w2 -> x19 + 0x40 (sp + 0x40)
         body -> x19 + 0x18 (sp + 0x18)
         */
        // x26 + 0x160 (sp + 0x1f0)
        let copy_1 = inputs
        
        let backgroundInfo = _BackgroundStyleModifier<Style>.BackgroundInfo(
            modifier: modifier.value,
            environment: copy_1.environment,
            size: copy_1.size,
            position: copy_1.position,
            transform: copy_1.transform,
            safeAreaInsets: copy_1.safeAreaInsets
        )
        
        let value = Attribute(backgroundInfo)
        
        // x26 + 0xf0 (sp + 0x180)
        var copy_2 = inputs
        // x19 + 0x120 (sp + 0x120)
        let copy_3 = copy_1
        
        copy_2.implicitRootType = _ZStackLayout.self
        copy_2.position = value.frame.origin
        copy_2.size = value.frame.size
        
        let resolver = ShapeStyleResolver(
            style: OptionalAttribute(value.style),
            mode: OptionalAttribute(),
            environment: copy_1.environment,
            role: .fill,
            substrate: copy_3.materialSubstrate,
            animationsDisabled: copy_1.base.animationsDisabled,
            helper: AnimatableAttributeHelper<_ShapeStyle_Pack>(
                phase: copy_1.viewPhase,
                time: copy_1.time,
                transaction: copy_1.transaction
            )
        )
        
        let pack = Attribute(resolver)
        pack.flags = [.unknown0]
        
        // x26 + 0x90 (sp + 0x120)
        var copy_4 = copy_1
        
        if shapeIsBackground {
            // <+996>
            // x19 + 0x90 (sp + 0x90)
            let _ = copy_1
            
            copy_4.applyBackgroundStyle(
                value: modifier.value,
                offset: .offset({ .of(&$0.style) })
            )
            
            // <+1152>
        } else {
            // <+1068>
            // <+1152>
        }
        
        // <+1152>
        // x27, w23, x19 + 0x38
        let outputs_1 = body(_Graph(), copy_4)
        // x19 + 0x90 (sp + 0x90)
        let copy_5 = copy_2
        
        // x19 + 0xf0
        let outputs_2 = _BackgroundStyleModifier<Style>.makeLeafView(
            view: modifier,
            inputs: copy_5,
            styles: pack,
            interpolatorGroup: nil
        )
        
        // <+1272>
        var visitor: PairwisePreferenceCombinerVisitor
        if shapeIsBackground {
            visitor = PairwisePreferenceCombinerVisitor(outputs: (outputs_2.preferences, outputs_1.preferences))
        } else {
            visitor = PairwisePreferenceCombinerVisitor(outputs: (outputs_1.preferences, outputs_2.preferences))
        }
        
        for key in copy_1.preferences.keys {
            key.visitKey(&visitor)
        }
        
        return _ViewOutputs(
            preferences: visitor.result,
            layoutComputer: OptionalAttribute(outputs_1.layoutComputer)
        )
    }
}

@available(*, unavailable)
extension _BackgroundStyleModifier : Sendable {
}

extension _BackgroundStyleModifier : MultiViewModifier, PrimitiveViewModifier {}

extension _BackgroundStyleModifier : @preconcurrency ShapeStyledLeafView {
    typealias ShapeUpdateData = Void
    
    static var animatesSize: Bool {
        assertUnimplemented()
    }
    
    func mustUpdate(data: Self.ShapeUpdateData, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool {
        assertUnimplemented()
    }
    
    func shape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    static var hasBackground: Bool {
        assertUnimplemented()
    }
    
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    func isClear(styles: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
    
    func finalPlacement(oldIndex: Int, oldPlacedSubviews: [_LazyLayout_PlacedSubview], newPlacedSubviews: [_LazyLayout_PlacedSubview], wasRemovedFromSubviews: Bool, context: AnyRuleContext) -> _Placement {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
}

extension _BackgroundStyleModifier {
    fileprivate struct BackgroundInfo : AsyncAttribute, Rule {
        @Attribute private(set) var modifier: _BackgroundStyleModifier<Style>
        @Attribute private(set) var environment: EnvironmentValues
        @Attribute private(set) var size: ViewSize
        @Attribute private(set) var position: CGPoint
        @Attribute private(set) var transform: ViewTransform
        @OptionalAttribute var safeAreaInsets: SafeAreaInsets?
        
        var value: _BackgroundStyleModifier<Style>.BackgroundInfo.Value {
            let position = self.position
            let size = self.size
            
            let shapeStyle = _AnchoredShapeStyle(
                style: self.modifier.style,
                bounds: CGRect(origin: .zero, size: self.size.value)
            )
            
            // x29 - 0x100
            var value = _BackgroundStyleModifier<Style>.BackgroundInfo.Value(
                frame: ViewFrame(origin: position, size: size),
                style: shapeStyle
            )
            
            let ignoresSafeAreaEdges = self.modifier.ignoresSafeAreaEdges
            
            guard !ignoresSafeAreaEdges.isEmpty else {
                return value
            }
            
            // <+588>
            let context = self.context
            var insets = EdgeInsets.zero
            
            if let attribute = self.$safeAreaInsets {
                let safeAreaInsets = context[attribute]
                
                let placementContext = _PositionAwarePlacementContext(
                    context: AnyRuleContext(context),
                    size: self.$size,
                    environment: self.$environment,
                    transform: self.$transform,
                    position: self.$position,
                    safeAreaInsets: OptionalAttribute(attribute)
                )
                
                insets = safeAreaInsets.resolve(
                    regions: .container,
                    cornerAdaptation: [],
                    in: placementContext
                )
            }
            
            // <+768>
            let d12: CGFloat = 0
            var d11 = insets.top
            var d10 = insets.leading
            let d8 = insets.bottom
            var d9 = insets.trailing
            
            d11 = ignoresSafeAreaEdges.contains(.top) ? d11 : d12
            d10 = ignoresSafeAreaEdges.contains(.leading) ? d10 : d12
            let containsBottom = ignoresSafeAreaEdges.contains(.bottom)
            d9 = ignoresSafeAreaEdges.contains(.trailing) ? d9 : d12
            
            let spacingContext = SizeAndSpacingContext(
                context: AnyRuleContext(context),
                owner: context.attribute.identifier,
                environment: self.$environment
            )
            
            let layoutDirection = spacingContext.layoutDirection
            let d13 = (layoutDirection == .leftToRight) ? d10 : d9
            var d0 = value.style.bounds.origin.x
            var d1 = value.style.bounds.origin.y
            d0 = d13 + d0
            d1 = d11 + d1
            value.style.bounds.origin.x = d0
            value.style.bounds.origin.y = d1
            d0 = value.frame.origin.x
            d1 = value.frame.origin.y
            d0 = d0 - d13
            d1 = d1 - d11
            value.frame.origin.x = d0
            value.frame.origin.y = d1
            d0 = value.frame.size.value.width
            d1 = value.frame.size.value.height
            var d2 = -d8
            var d3: CGFloat = -0
            d2 = containsBottom ? d2 : d3
            d3 = -d9
            d3 = d3 - d10
            d0 = d0 - d3
            d0 = (d0 >= 0) ? d0 : d12
            d2 = d2 - d11
            d1 = d1 - d2
            d1 = (d1 >= 0) ? d1 : d12
            value.frame.size.value.width = d0
            value.frame.size.value.height = d1
            
            return value
        }
    }
}

extension _BackgroundStyleModifier.BackgroundInfo {
    fileprivate struct Value {
        var frame: ViewFrame
        var style: _AnchoredShapeStyle<Style>
        
        init(frame: ViewFrame, style: _AnchoredShapeStyle<Style>) {
            self.frame = frame
            self.style = style
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _BackgroundShapeModifier<Style, Bounds> : ViewModifier where Style : ShapeStyle, Bounds : Shape {
    public var style: Style
    public var shape: Bounds
    public var fillStyle: FillStyle
    
    @inlinable public init(style: Style, shape: Bounds, fillStyle: FillStyle) {
        self.style = style
        self.shape = shape
        self.fillStyle = fillStyle
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_BackgroundShapeModifier<Style, Bounds>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _BackgroundShapeModifier : Sendable {
}

extension _BackgroundShapeModifier : MultiViewModifier, PrimitiveViewModifier {}

extension _BackgroundShapeModifier : ShapeStyledLeafView {
    typealias ShapeUpdateData = Never // TODO
    
    static var animatesSize: Bool {
        assertUnimplemented()
    }
    
    func mustUpdate(data: Self.ShapeUpdateData, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool {
        assertUnimplemented()
    }
    
    func shape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    static var hasBackground: Bool {
        assertUnimplemented()
    }
    
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    func isClear(styles: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
    
    func finalPlacement(oldIndex: Int, oldPlacedSubviews: [_LazyLayout_PlacedSubview], newPlacedSubviews: [_LazyLayout_PlacedSubview], wasRemovedFromSubviews: Bool, context: AnyRuleContext) -> _Placement {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct _InsettableBackgroundShapeModifier<Style, Bounds> : ViewModifier where Style : ShapeStyle, Bounds : InsettableShape {
    public var style: Style
    public var shape: Bounds
    public var fillStyle: FillStyle
    
    @inlinable public init(style: Style, shape: Bounds, fillStyle: FillStyle) {
        self.style = style
        self.shape = shape
        self.fillStyle = fillStyle
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_InsettableBackgroundShapeModifier<Style, Bounds>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _InsettableBackgroundShapeModifier : Sendable {
}

extension _InsettableBackgroundShapeModifier : MultiViewModifier, PrimitiveViewModifier {}

extension _ViewInputs {
    fileprivate mutating func applyBackgroundStyle<T, U>(value: Attribute<T>, offset: PointerOffset<T, U>) where U : ShapeStyle {
        /*
         self -> x20 -> x19
         value -> w0 -> w24
         offset -> x1 -> x23
         */
        var shapeType = _ShapeStyle_ShapeType(operation: .modifiesBackground, result: .none)
        U._apply(to: &shapeType)
        
        switch shapeType.result {
        case .bool(let value):
            guard value else {
                return
            }
        case .none:
            return
        }
        
        let environment = ForegroundEnvironment(
            style: value.applying(offset: offset),
            environment: self.environment
        )
        
        self.environment = Attribute(environment)
    }
}

fileprivate struct ForegroundEnvironment<T : ShapeStyle> : AsyncAttribute, Rule {
    @Attribute var style: T
    @Attribute var environment: EnvironmentValues
    
    var value: EnvironmentValues {
        assertUnimplemented()
    }
}

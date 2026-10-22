internal import AttributeGraph
public import CoreGraphics

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
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _BackgroundStyleModifier : Sendable {
}

extension _BackgroundStyleModifier : MultiViewModifier, PrimitiveViewModifier {}

extension _BackgroundStyleModifier : ShapeStyledLeafView {
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
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<CGPoint>, size: CGSize) -> BitVector64 {
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
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<CGPoint>, size: CGSize) -> BitVector64 {
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

func makeSecondaryLayerView<T : View>(
    secondaryLayer: Attribute<T>,
    alignment: Attribute<Alignment>?,
    inputs: _ViewInputs,
    body: (_Graph, _ViewInputs) -> _ViewOutputs,
    flipOrder: Bool
) -> _ViewOutputs {
    /*
     secondaryLayer -> x0 -> x19 + 0x30 (sp + 0x30)
     alignment -> x1 -> x21
     inputs -> x2
     body -> x3/x4 -> x24/x28
     flipOrder -> w5 -> w22
     */
    // x25 + 0x120 (sp + 0x1f0)
    let copy_1 = inputs
    // x25 + 0x60 (sp + 0x130)
    let copy_2 = inputs
    // x19 + 0x190 (sp + 0x190)
    let _ = copy_1
    copy_2.base.pushStableIndex(0)
    
    // <+180>
    // x19 + 0x190 (sp + 0x190)
    let outputs_1 = body(_Graph(), copy_2)
    // x25 (sp + 0xd0)
    var copy_4 = copy_1
    copy_4.base.pushStableIndex(1)
    
    // <+280>
    // x19 + 0x14 (sp + 0x14)
    let geometry: Attribute<ViewGeometry>!
    
    if !copy_1.base.options.contains(.viewNeedsGeometry) {
        // <+292>
        geometry = nil
        // <+580>
    } else {
        // <+300>
        // x19 + 0x190
        let query = SecondaryLayerGeometryQuery(
            alignment: OptionalAttribute(alignment),
            layoutDirection: copy_1
                .base
                .cachedEnvironment
                .value
                .attribute(
                    id: .layoutDirection,
                    { environment in
                        return environment.layoutDirection
                    }
                ),
            primaryPosition: copy_1.position,
            primarySize: copy_1.size,
            primaryLayoutComputer: OptionalAttribute(outputs_1.layoutComputer),
            secondaryLayoutComputer: OptionalAttribute()
        )
        
        let attribute = Attribute(query)
        geometry = attribute
        
        copy_4.position = attribute.origin()
        copy_4.size = attribute.size()
    }
    
    // <+580>
    if isLinkedOnOrAfter(.v3) {
        // <+700>
        copy_4.implicitRootType = _ZStackLayout.self
    }
    
    // <+764>
    // x25 + 0xc0 (sp + 0x190)
    let copy_5 = copy_2
    // x19 + 0x60 (sp + 0x60)
    let copy_6 = copy_2.base
    
    let newBody: (_Graph, _ViewInputs) -> _ViewOutputs = { _, incoming in
        // $s7SwiftUI22makeSecondaryLayerView09secondaryE09alignment6inputs4body9flipOrderAA01_F7OutputsV14AttributeGraph0N0VyxG_ALyAA9AlignmentVGSgAA01_F6InputsVAiA01_O0V_AStcSbtAA0F0RzlFAiU_AStcfU_
        return T.makeDebuggableView(view: _GraphValue(secondaryLayer), inputs: incoming)
    }
    
    let outputs_2: _ViewOutputs
    
    if IsVisionEnabledPredicate.evaluate(inputs: copy_6) {
        // <+860>
        outputs_2 = makePlatformSecondaryView(
            primaryInputs: copy_5,
            primaryOutputs: outputs_1,
            secondaryInputs: copy_4,
            flipOrder: flipOrder,
            body: newBody
        )
    } else {
        // <+1076>
        outputs_2 = newBody(_Graph(), copy_4)
    }
    
    if copy_1.base.options.contains(.viewNeedsGeometry) {
        // <+1152>
        geometry.mutateBody(as: SecondaryLayerGeometryQuery.self, invalidating: true) { query in
            // $s7SwiftUI22makeSecondaryLayerView09secondaryE09alignment6inputs4body9flipOrderAA01_F7OutputsV14AttributeGraph0N0VyxG_ALyAA9AlignmentVGSgAA01_F6InputsVAiA01_O0V_AStcSbtAA0F0RzlFyAA0dE13GeometryQueryVzXEfU0_TA
            query.$secondaryLayoutComputer = outputs_2.layoutComputer
        }
    }
    
    // <+1264>
    var visitor: PairwisePreferenceCombinerVisitor
    if flipOrder {
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

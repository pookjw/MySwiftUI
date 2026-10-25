// F41195D4CD7D6A29110580DFD3D4F891
public import CoreGraphics
private import AttributeGraph

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct Canvas<Symbols> where Symbols : View {
    public var symbols: Symbols
    public var renderer: (inout GraphicsContext, CGSize) -> Void
    private var rasterizationOptions: RasterizationOptions
    private var preservesMetadata: Bool
    
    public var isOpaque: Bool {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var colorMode: ColorRenderingMode {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var rendersAsynchronously: Bool {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void, @ViewBuilder symbols: () -> Symbols) {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(view: _GraphValue<Canvas<Symbols>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> w26
         inouts -> x1 -> x20
         return pointer -> x8 -> x28
         */
        // x22 + 0xe0 (sp + 0x400)
        let copy_1 = inputs
        var outputs = _ViewOutputs()
        
        if inputs.preferences.contains(DisplayList.Key.self) {
            // <+164>
            let usesGraphicsRenderer = copy_1[UsingGraphicsRenderer.self]
            let environment = Attribute(Canvas.ChildEnvironment(environment: copy_1.environment))
            let symbols: OptionalAttribute<[CanvasSymbols.Child]>
            
            if Symbols.self != EmptyView.self {
                // <+416>
                let listInputs = _ViewListInputs(
                    copy_1.base,
                    implicitID: 0,
                    options: []
                )
                
                let listOutputs = Symbols
                    .makeDebuggableViewList(
                        view: view[{ .of(&$0.symbols) }],
                        inputs: listInputs
                    )
                
                // x19 + 0x4
                let viewList = listOutputs.makeAttribute(inputs: listInputs)
                let viewGraph = ViewGraph.current
                
                // x23 + 0xb8 (sp + 0x280)
                var copy_2 = copy_1
                
                copy_2.position = viewGraph.$zeroPoint
                copy_2.containerPosition = viewGraph.$zeroPoint
                
                copy_2.transform = viewGraph.intern(
                    ViewTransform(),
                    for: ViewTransform.self,
                    id: .defaultValue
                )
                
                copy_2.preferences = PreferencesInputs(
                    hostKeys: viewGraph.intern(
                        PreferenceKeys(),
                        for: PreferenceKeys.self,
                        id: .defaultValue
                    )
                )
                
                copy_2.preferences.add(DisplayList.Key.self)
                copy_2.base.options.formUnion([.viewRequestsLayoutComputer, .viewNeedsGeometry])
                
                if !usesGraphicsRenderer {
                    // <+992>
                    copy_2[UsingGraphicsRenderer.self] = true
                    copy_2.environment = environment
                }
                
                // <+1172>
                // <+1244>
                symbols = OptionalAttribute(
                    Attribute(
                        CanvasSymbols(
                            list: viewList,
                            inputs: copy_2,
                            parentSubgraph: .current!,
                            children: [:],
                            seed: 0
                        )
                    )
                )
            } else {
                // <+1544>
                symbols = OptionalAttribute()
            }
            
            // <+1548>
            let identity: _DisplayList_Identity
            if copy_1.base.options.contains(.needsStableDisplayListIDs) {
                // <+2732>
                identity = copy_1[_DisplayList_StableIdentityScope.self].attribute!.value.pushIdentity()
                // <+1580>
            } else {
                // <+1564>
                identity = _DisplayList_Identity()
                // <+1580>
            }
            
            // <+1580>
            let displayListRule = CanvasDisplayList(
                identity: identity,
                view: view.value,
                position: copy_1.animatedPosition(),
                containerPosition: copy_1.containerPosition,
                size: copy_1.animatedCGSize(),
                transform: copy_1.transform,
                environment: environment,
                symbols: symbols,
                lastBounds: .infinite,
                isFlattened: usesGraphicsRenderer,
                cachedSymbols: nil
            )
            
            outputs.preferences[DisplayList.Key.self] = Attribute(displayListRule)
        }
        
        // <+2016>
        let respondersRule = LeafResponderFilter(
            data: view.value,
            size: copy_1.animatedSize(),
            position: copy_1.animatedPosition(),
            transform: copy_1.transform
        )
        
        if copy_1.preferences.contains(ViewRespondersKey.self) {
            outputs.preferences[ViewRespondersKey.self] = Attribute(respondersRule)
        }
        
        // <+2556>
        outputs.makeContentPathPreferenceWriter(
            inputs: copy_1,
            contentResponder: view.value, // $s7SwiftUI19ShapeStyledLeafViewPAAE04makeeF04view6inputs6styles17interpolatorGroup4dataAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsV09AttributeO00R0VyAA01_C10Style_PackVGAA01_cs13_InterpolatorL0CSg0C10UpdateDataQztFZASyxGyXEfu0_TA
            kinds: OptionalAttribute()
        )
        
        return outputs
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension Canvas : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Canvas where Symbols == EmptyView {
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void) {
        assertUnimplemented()
    }
}

extension Canvas : UnaryView, PrimitiveView {}

@_spi(Internal) extension Canvas : ContentResponder {
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

extension Canvas {
    fileprivate struct ChildEnvironment : AsyncAttribute, Rule {
        @Attribute private(set) var environment: EnvironmentValues
        
        var value: EnvironmentValues {
            assertUnimplemented()
        }
    }
}

fileprivate struct CanvasSymbols : AsyncAttribute, StatefulRule {
    @Attribute private(set) var list: ViewList
    let inputs: _ViewInputs
    let parentSubgraph: Subgraph
    private(set) var children: [_ViewList_ID.Canonical: CanvasSymbols.Child]
    private(set) var seed: UInt32
    
    typealias Value = [CanvasSymbols.Child]
    
    func updateValue() {
        assertUnimplemented()
    }
}

extension CanvasSymbols {
    fileprivate struct Child {
        private var subgraph: Subgraph
        private var release: _ViewList_SubgraphRelease?
        private var seed: UInt32
        private var traits: ViewTraitCollection
        private var size: Attribute<ViewSize>
        private var list: OptionalAttribute<DisplayList>
        private let renderer: DisplayList.GraphicsRenderer
    }
    
    fileprivate struct SymbolSize {
        @Attribute var size: ViewSize
        @OptionalAttribute var layoutComputer: LayoutComputer?
    }
}

fileprivate struct CanvasDisplayList<T : View> : AsyncAttribute, StatefulRule {
    private let identity: _DisplayList_Identity // 0x0
    @Attribute private var view: Canvas<T> // 0x4
    @Attribute private var position: CGPoint // 0x8
    @Attribute private var containerPosition: CGPoint // 0xc
    @Attribute private var size: CGSize // 0x10
    @Attribute private var transform: ViewTransform // 0x14
    @Attribute private var environment: EnvironmentValues // 0x18
    @OptionalAttribute private var symbols: [CanvasSymbols.Child]? // 0x1c
    private let tracker: PropertyList.Tracker // 0x20
    private var lastBounds: CGRect // 0x28
    private let isFlattened: Bool // 0x48
    private var cachedSymbols: SymbolRenderer? // 0x50
    
    init(
        identity: _DisplayList_Identity,
        view: Attribute<Canvas<T>>,
        position: Attribute<CGPoint>,
        containerPosition: Attribute<CGPoint>,
        size: Attribute<CGSize>,
        transform: Attribute<ViewTransform>,
        environment: Attribute<EnvironmentValues>,
        symbols: OptionalAttribute<[CanvasSymbols.Child]>,
        lastBounds: CGRect,
        isFlattened: Bool,
        cachedSymbols: SymbolRenderer?
    ) {
        self.identity = identity
        self._view = view
        self._position = position
        self._containerPosition = containerPosition
        self._size = size
        self._transform = transform
        self._environment = environment
        self._symbols = symbols
        self.tracker = PropertyList.Tracker()
        self.lastBounds = lastBounds
        self.isFlattened = isFlattened
        self.cachedSymbols = cachedSymbols
    }
    
    typealias Value = DisplayList
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate final class SymbolRenderer : GraphicsContextSymbols {
    // TODO
}

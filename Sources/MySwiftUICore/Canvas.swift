// F41195D4CD7D6A29110580DFD3D4F891
public import CoreGraphics
private import AttributeGraph
public import Spatial

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct Canvas<Symbols> where Symbols : View {
    public var symbols: Symbols
    public var renderer: (inout GraphicsContext, CGSize) -> Void // 0x24 (offset field)
    private var rasterizationOptions: RasterizationOptions // 0x28 (offset field)
    private var preservesMetadata: Bool // 0x2c (offset field)
    
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

    public init(
        opaque: Bool = false,
        colorMode: ColorRenderingMode = .nonLinear,
        rendersAsynchronously: Bool = false,
        renderer: @escaping (inout GraphicsContext, CGSize) -> Void,
        @ViewBuilder symbols: () -> Symbols
    ) {
        /*
         opaque -> w0 -> w26
         colorMode -> x1 -> w27
         rendersAsynchronously -> w2 -> w24
         renderer -> x3/x4 -> x21/x19
         symbols -> x5/x6 -> x22/x20
         */
        var options = _RendererConfiguration.RasterizationOptions()
        options.colorMode = colorMode
        options.isOpaque = opaque
        options.rendersAsynchronously = rendersAsynchronously
        
        self.rasterizationOptions = RasterizationOptions(options)
        self.preservesMetadata = false
        self.symbols = symbols()
        self.renderer = renderer
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
    public init(
        opaque: Bool = false,
        colorMode: ColorRenderingMode = .nonLinear,
        rendersAsynchronously: Bool = false,
        renderer: @escaping (inout GraphicsContext, CGSize) -> Void
    ) {
        self.init(
            opaque: opaque,
            colorMode: colorMode,
            rendersAsynchronously: rendersAsynchronously,
            renderer: renderer,
            symbols: {
                EmptyView()
            }
        )
    }
}

extension Canvas : UnaryView, PrimitiveView {}

@_spi(Internal) extension Canvas : ContentResponder {
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
    
    mutating func updateValue() {
        /*
         self -> x20
         T -> x0 -> x21
         */
        // <+564>
        var d8: CGFloat
        var d12: CGFloat
        // x19 + 0x138 (sp + 0x2b8)
        let sizeChanged: Bool
        do {
            let (size, changed) = self.$size.changedValue(options: [])
            d8 = size.width
            d12 = size.height
            sizeChanged = changed
        }
        
        // x19 + 0xf0 (sp + 0x270) / w22
        let (position, positionChanged) = self.$position.changedValue(options: [])
        // x28 + 0x110 (sp + 0x430)
        let (transform, transformChanged) = self.$transform.changedValue(options: [])
        // x19 + 0x1a0 (sp + 0x320)
        let copy_1: ViewTransform
        // w26
        let modified: Bool
        
        if sizeChanged || positionChanged || transformChanged {
            // <+732>
            // x28 + 0xb0 / x19 + 0x250 (sp + 0x3d0)
            var copy_2 = transform
            copy_2.appendPosition(position)
            copy_1 = transform
            
            let x190x78 = d12
            var d14: CGFloat!
            var d11: CGFloat!
            var d15: CGFloat!
            var d10: CGFloat!
            
            if let containingScrollGeometry = copy_2.containingScrollGeometry {
                let d9 = containingScrollGeometry.visibleRect.origin.x
                d12 = containingScrollGeometry.visibleRect.origin.y
                let d13 = containingScrollGeometry.visibleRect.size.width
                let d3 = containingScrollGeometry.visibleRect.size.height
                let x190x128 = d3
                
                var d0 = CGRect(x: d9, y: d12, width: d13, height: d3).width
                d0 = d0 + d0
                
                let flag: Bool
                
                if d0 <= d8 {
                    // <+944>
                    flag = true
                } else {
                    d0 = CGRect(x: d9, y: d12, width: d13, height: d3).height
                    d0 = d0 + d0
                    d14 = 0
                    d10 = x190x78
                    d11 = 0
                    d15 = d8
                    
                    if !(d0 <= d10) {
                        // <+1088>
                        flag = false
                    } else {
                        // <+944>
                        flag = true
                    }
                }
                
                if flag {
                    // <+944>
                    d0 = 0.0078125
                    var d1 = d9 * d0
                    d1 = floor(d1)
                    d15 = 128
                    d1 = d1 * d15
                    let x190x120 = d1
                    d0 = d12 * d0
                    d0 = floor(d0)
                    d11 = d0 * d15
                    d10 = x190x128
                    d0 = CGRect(x: d9, y: d12, width: d13, height: d10).width
                    d14 = d0 + d15
                    d0 = CGRect(x: d9, y: d12, width: d13, height: d10).height
                    let d7 = d0 + d15
                    
                    let intersection = CGRect(x: 0, y: 0, width: d8, height: x190x78)
                        .intersection(CGRect(x: x190x120, y: d11, width: d14, height: d7))
                    d14 = intersection.origin.x
                    d11 = intersection.origin.y
                    d15 = intersection.size.width
                    d10 = intersection.size.height
                    // <+1088>
                }
                
                // <+1088>
            } else {
                // <+836>
                d14 = 0
                d11 = 0
                d15 = d8
                d10 = d12
                // <+1088>
            }
            
            // <+1088>
            if CGRect(x: d14, y: d11, width: d15, height: d10) == self.lastBounds {
                d12 = x190x78
                
                if sizeChanged {
                    modified = true
                    // <+1156>
                } else {
                    // <+720>
                    modified = Graph.currentAttributeWasModified
                    // <+1156>
                }
            } else {
                // <+1140>
                self.lastBounds = CGRect(x: d14, y: d11, width: d15, height: d10)
                modified = true
                d12 = x190x78
                // <+1156>
            }
            
            // <+1156>
        } else {
            // <+708>
            copy_1 = transform
            modified = Graph.currentAttributeWasModified
            // <+1156>
        }
        
        // <+1156>
        // x19 + 0x15f (sp + 0x2df)
        var x190x15f = modified
        
        guard !self.lastBounds.isEmpty else {
            self.value = DisplayList()
            return
        }
        
        // <+1224>
        // x27
        let (view, viewChanged) = self.$view.changedValue(options: [])
        // self -> x19 + 0x128 (sp + 0x2a8)
        let (environment, environmentChanged) = self.$environment.changedValue(options: [])
        
        if modified {
            // <+1360>
            // <+1440>
        } else {
            // <+1384>
            if viewChanged {
                // <+1420>
                x190x15f = true
                // <+1440>
            } else {
                if environmentChanged {
                    // <+2728>
                    if self.tracker.hasDifferentUsedValues(environment.plist) {
                        // <+1432>
                        x190x15f = true
                    } else {
                        // <+1440>
                    }
                } else {
                    // <+1404>
                    // <+1440>
                }
            }
        }
        
        // <+1440>
        if let attribute = self.$symbols {
            // <+1472>
            Graph.registerDependency(attribute: attribute.identifier, flags: 0)
            
            let attributes = (self.$view, self.$position, self.$containerPosition, self.$size, self.$transform, self.$environment)
            let count: UInt = 6
            
            withUnsafePointer(to: attributes) { pointer in
                let changed = unsafe AGGraphAnyInputsChanged(
                    UnsafeRawPointer(pointer)
                        .unsafelyUnwrapped
                        .assumingMemoryBound(to: AnyAttribute.self),
                    count
                )
                
                if changed {
                    self.cachedSymbols = nil
                    x190x15f = true
                }
            }
        }
        
        // <+1796>
        let d9: CGFloat
        let x190x30: CGFloat
        let containerPositionChanged: Bool
        do {
            let (containerPosition, changed) = self.$containerPosition.changedValue(options: [])
            d9 = containerPosition.x
            x190x30 = containerPosition.y
            containerPositionChanged = changed
        }
        
        let d14 = self.lastBounds.size.width
        let x190xc8 = self.lastBounds.size.height
        
        if x190x15f {
            // <+1972>
            assertUnimplemented()
        } else {
            // <+1836>
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
}

fileprivate final class SymbolRenderer : GraphicsContextSymbols {
    // TODO
}

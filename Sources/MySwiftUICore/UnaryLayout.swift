// 1C3B77B617AD058A6802F719E38F5D79
internal import CoreGraphics
private import AttributeGraph

protocol UnaryLayout : Animatable, MultiViewModifier, PrimitiveViewModifier {
    associatedtype PlacementContextType
    
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing
    nonisolated func placement(of proxy: LayoutProxy, in context: Self.PlacementContextType) -> _Placement
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize
    nonisolated func layoutPriority(child: LayoutProxy) -> Double
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
}

extension UnaryLayout where PlacementContextType == PlacementContext {
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         inputs -> x1 -> x21
         body -> x2/x3 -> x23/x24
         */
        // w28
        let options = inputs.base.options
        
        guard !options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty else {
            return body(_Graph(), inputs)
        }
        
        // <+84>
        // modifier -> x0 -> x20
        let childLayoutComputer = OptionalAttribute<LayoutComputer>()
        let layoutComputer = UnaryLayoutComputer<Self>(
            layout: modifier.value,
            environment: inputs.base.cachedEnvironment.value.environment,
            childLayoutComputer: childLayoutComputer
        )
        
        // w22
        let layoutComputerAttribute = Attribute(layoutComputer)
        // x29 - 0x90
        var positionAttribute = inputs.position
        // w26
        let geometryAttribute: Attribute<ViewGeometry>!
        
        if options.contains(.viewNeedsGeometry) {
            // <+360>
            let layoutDirectionAttribute = inputs.base.cachedEnvironment.value.attribute(id: .layoutDirection) { environment in
                return environment.layoutDirection
            }
            
            let geometry = UnaryChildGeometry<Self>(
                parentSize: inputs.size,
                layoutDirection: layoutDirectionAttribute,
                parentLayoutComputer: layoutComputerAttribute,
                childLayoutComputer: OptionalAttribute()
            )
            
            // w26
            geometryAttribute = Attribute(geometry)
            // x29 - 0x88
            let sizeAttribute = geometryAttribute[keyPath: \.dimensions.size]
            // x29 - 0x13c
            let originAttribute = geometryAttribute[keyPath: \.origin]
            
            let query = LayoutPositionQuery(
                parentPosition: inputs.position,
                localPosition: originAttribute
            )
            
            // x29 - 0x90
            positionAttribute = Attribute(query)
            // <+724>
        } else {
            // <+724>
            geometryAttribute = nil
        }
        
        // <+724>
        // x29 - 0x140
        var outputs = body(_Graph(), inputs)
        
        if inputs.base.options.contains(.viewNeedsGeometry) {
            // <+768>
            layoutComputerAttribute.mutateBody(as: UnaryLayoutComputer<Self>.self, invalidating: true) { rule in
                // $s7SwiftUI13UnaryLayout3DPAAE05_makeC12LayoutView3D8modifier6inputs4bodyAA12_ViewOutputsVAA11_GraphValueVyxG_AA01_K6InputsVAiA01_M0V_ANtctFZyAA0cF10Computer3D33_ED0B38D5641AD05527359F0D11736A2CLLVyxGzXEfU1_AA012_AspectRatioD1DV_Tg5TA
                rule.$childLayoutComputer = childLayoutComputer.attribute
            }
            
            geometryAttribute.mutateBody(as: UnaryChildGeometry<Self>.self, invalidating: true) { rule in
                // $s7SwiftUI11UnaryLayoutPA2A16PlacementContextV0eF4TypeRtzrlE12makeViewImpl8modifier6inputs4bodyAA01_I7OutputsVAA11_GraphValueVyxG_AA01_I6InputsVAmA01_O0V_ARtctFZyAA0C13ChildGeometry33_1C3B77B617AD058A6802F719E38F5D79LLVyxGzXEfU0_AA14MoveTransitionV04MoveD0V_Tg5TA
                /*
                 rule -> x0 -> x19
                 inputs -> x1 -> x23
                 layoutComputerAttribute -> w2 -> w22
                 outputs -> x3 -> dead
                 childLayoutComputer -> x4 -> x20 (x4 >> 32)
                 */
                if inputs[EnableLayoutDepthStashing.self] {
                    // <+72>
                    // w21
                    let transformAttribute = inputs.transform
                    let depthAttribute = transformAttribute[keyPath: \.depth]
                    let layoutComputer = DepthStashingLayoutComputer(layoutComputer: layoutComputerAttribute, depth: depthAttribute)
                    let parentLayoutComputer = Attribute(layoutComputer)
                    rule.$parentLayoutComputer = parentLayoutComputer
                    
                    if let attribute = childLayoutComputer.attribute {
                        // <+184>
                        let layoutComputer = DepthStashingLayoutComputer(layoutComputer: attribute, depth: depthAttribute)
                        let childLayoutComputer = Attribute(layoutComputer)
                        // <+256>
                        rule.$childLayoutComputer = childLayoutComputer
                    } else {
                        // <+256>
                        rule.$childLayoutComputer = childLayoutComputer.attribute
                    }
                } else {
                    // <+256>
                    rule.$childLayoutComputer = childLayoutComputer.attribute
                }
            }
        }
        
        // <+1036>
        outputs.layoutComputer = childLayoutComputer.attribute
        
        if options.contains(.viewRequestsLayoutComputer) {
            outputs.preferences.debugProperties.formUnion(.layoutComputer)
            outputs.layoutComputer = layoutComputerAttribute
        }
        
        return outputs
    }
}

extension UnaryLayout where PlacementContextType == _PositionAwarePlacementContext {
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct UnaryLayoutComputer<T : UnaryLayout> : StatefulRule, AsyncAttribute, CustomStringConvertible where T.PlacementContextType == PlacementContext {
    @Attribute private(set) var layout: T
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        // w19
        let current = AnyAttribute.current!
        // x27
        let layout = self.layout
        // x26
        let engine = UnaryLayoutEngine<T>(
            layout: layout,
            layoutContext: SizeAndSpacingContext(
                context: AnyRuleContext(attribute: current),
                owner: current,
                environment: $environment
            ),
            child: LayoutProxy(
                context: AnyRuleContext(attribute: current),
                layoutComputer: $childLayoutComputer
            )
        )
        
        self.update(to: engine)
    }
}

fileprivate struct UnaryChildGeometry<T> : Rule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var parentSize: ViewSize
    @Attribute private(set) var layoutDirection: LayoutDirection
    @Attribute var parentLayoutComputer: LayoutComputer
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    var description: String {
        assertUnimplemented()
    }
    
    var value: ViewGeometry {
        assertUnimplemented()
    }
}

struct LayoutPositionQuery : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var parentPosition: CGPoint
    @Attribute fileprivate private(set) var localPosition: CGPoint
    
    var value: CGPoint {
        assertUnimplemented()
    }
}

fileprivate struct UnaryLayoutEngine<T : UnaryLayout> : LayoutEngine where T.PlacementContextType == PlacementContext {
    // _FrameLayout 기준
    private let layout: T // 0x0
    private let layoutContext: SizeAndSpacingContext // 0x30
    private let child: LayoutProxy // 0x3c
    private var dimensionsCache = ViewSizeCache() // 0x48
    private var placementCache = ViewPlacementCache() // 0x90
    
    init(layout: T, layoutContext: SizeAndSpacingContext, child: LayoutProxy) {
        self.layout = layout
        self.layoutContext = layoutContext
        self.child = child
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    func ignoresAutomaticPadding() -> Bool {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        // self -> x20 -> x22
        // x29 - 0x140
        let copy_1 = proposedSize
        let layout = self.layout
        // d10 / x29 - 0x178
        let layoutContext = self.layoutContext
        // d11 / x29 - 0x17c
        let child = self.child
        // dimensionsCache -> x23
        
        // <+340>
        return self.dimensionsCache.get(copy_1) { 
            // <+1032>
            return layout.sizeThatFits(in: copy_1, context: layoutContext, child: child)
        }
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    mutating func childPlacement(at viewSize: ViewSize) -> _Placement {
        let layout = self.layout
        let child = self.child
        let layoutContext = self.layoutContext
        
        return self.placementCache.get(viewSize) { 
            return layout.placement(of: child, in: PlacementContext(base: layoutContext, parentSize: viewSize))
        }
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        /*
         proposedSize -> x21/w22 / x23/w24 / x25/w26
         */
        let size = self.sizeThatFits(
            _ProposedSize(
                width: proposedSize.width,
                height: proposedSize.height
            )
        )
        
        let placement = self.childPlacement(
            at: ViewSize(
                size,
                proposal: _ProposedSize(width: proposedSize.width, height: proposedSize.height)
            )
        )
        
        let unspecified = placement.proposedSize_.fixingUnspecifiedDimensions()
        
        return child.depth(
            in: _ProposedSize3D(
                width: unspecified.width,
                height: unspecified.height,
                depth: proposedSize.depth
            )
        )
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
}

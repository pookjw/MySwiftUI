// 34D3AEC4362799DA2D0B148FCF3EBBB0
package import CoreGraphics
internal import AttributeGraph

package protocol UnaryDepthLayout : Animatable, MultiViewModifier, PrimitiveViewModifier {
    nonisolated func depthThatFits(in size: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat
    nonisolated func depthPlacement(of proxy: LayoutProxy, in context: PlacementContext3D) -> DepthPlacement
    nonisolated func depthOffered(to: LayoutProxy, for size: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat?
}

extension UnaryDepthLayout {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         body (context) -> x4 -> x24
         return pointer -> x8 -> x22
         */
        // x26 + 0x60
        let copy_1 = inputs
        // x26 + 0xc0
        let copy_2 = inputs
        let w27 = copy_2.base.options
        
        guard !w27.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty else {
            // <+524>
            // x19 + 0x80
            let copy_3 = inputs
            return body(_Graph(), copy_3)
        }
        
        // <+124>
        // x19 + 0x18
        let modifierAttribute = modifier.value
        // x19 + 0x80
        let copy_3 = inputs.base
        // inputs -> x1 -> x25
        // body (closure) -> x2 -> x19
        // x19 + 0x28
        let _ = copy_1.base
        // w20
        let animatableAttribute = Self.makeAnimatable(value: _GraphValue(modifierAttribute), inputs: copy_3)
        _ = consume copy_3
        
        // <+204>
        // x19 + 0x80
        var copy_4 = inputs
        copy_4.base.options = w27.union(.viewRequestsLayoutComputer)
        
        // x19 + 0x24
        var geometryAttribute = OptionalAttribute<ViewDepthGeometry>()
        
        // x19 + 0x28
        let _ = copy_1
        
        // x22
        var outputs = _ViewOutputs.makeDepthTransform(
            inputs: copy_4,
            geometry: {
                // $s7SwiftUI16UnaryDepthLayoutPAAE9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VyAA0gD8GeometryVGyXEfU_TA
                /*
                 animatableAttribute -> w0 -> w23
                 copy_1 -> x1 -> x22
                 attribute -> x2 -> x19
                 Self -> x3/x4 -> x21/x20
                 */
                // sp + 0xc
                let geometryRule = UnaryDepthLayoutGeometry<Self>(
                    layout: animatableAttribute,
                    parentSize: copy_1.size,
                    parentDepth: copy_1.transform[keyPath: \.depth],
                    environment: copy_1.environment,
                    childLayoutComputer: OptionalAttribute()
                )
                
                let result = Attribute(geometryRule)
                geometryAttribute = OptionalAttribute(result)
                return result
            },
            body: { inputs in
                return body(_Graph(), inputs)
            }
        )
        
        // <+364>
        if let attribute = geometryAttribute.attribute {
            attribute.mutateBody(as: UnaryDepthLayoutGeometry<Self>.self, invalidating: true) { geometry in
                geometry.$childLayoutComputer = outputs.layoutComputer
            }
        }
        
        // <+508>
        guard w27.contains(.viewRequestsLayoutComputer) else {
            return outputs
        }
        
        // <+576>
        // x19 + 0x18
        let layoutComputerRule = UnaryDepthLayoutComputer<Self>(
            layout: animatableAttribute,
            environment: copy_2.environment,
            childLayoutComputer: OptionalAttribute(outputs.layoutComputer)
        )
        
        outputs.layoutComputer = Attribute(layoutComputerRule)
        return outputs
    }
    
    package func depthThatFits(in: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat {
        assertUnimplemented()
    }
    
    package func depthPlacement(of: LayoutProxy, in: PlacementContext3D) -> DepthPlacement {
        assertUnimplemented()
    }
    
    package func depthOffered(to: LayoutProxy, for: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat? {
        assertUnimplemented()
    }
}

struct UnaryDepthLayoutGeometry<T : UnaryDepthLayout> : Rule, AsyncAttribute {
    @Attribute private var layout: T
    @Attribute private var parentSize: ViewSize
    @Attribute private var parentDepth: ViewDepth
    @Attribute private var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    init(
        layout: Attribute<T>,
        parentSize: Attribute<ViewSize>,
        parentDepth: Attribute<ViewDepth>,
        environment: Attribute<EnvironmentValues>,
        childLayoutComputer: OptionalAttribute<LayoutComputer>
    ) {
        self._layout = layout
        self._parentSize = parentSize
        self._parentDepth = parentDepth
        self._environment = environment
        self._childLayoutComputer = childLayoutComputer
    }
    
    var value: ViewDepthGeometry {
        // self -> x20
        // w26
        let current_1 = AnyAttribute.current!
        
        // x29 - 0xc0
        let context = PlacementContext3D(
            base: PlacementContext(
                base: SizeAndSpacingContext(
                    context: AnyRuleContext(attribute: current_1),
                    owner: current_1,
                    environment: self.$environment
                ),
                parentSize: self.parentSize
            ),
            _depth: self.parentDepth
        )
        
        // <+300>
        // w25
        let current_2 = AnyAttribute.current!
        
        let proxy = LayoutProxy(
            context: AnyRuleContext(attribute: current_2),
            attributes: LayoutProxyAttributes(
                layoutComputer: self._childLayoutComputer,
                traitsList: OptionalAttribute()
            )
        )
        
        // x20
        let depth = self.layout.depthOffered(
            to: proxy,
            for: context.proposedSize, // inlined
            context: SizeAndSpacingContext(
                context: AnyRuleContext(attribute: current_2),
                owner: current_2,
                environment: self.$environment
            )
        )
        
        // <+628>
        let block: () -> DepthPlacement = {
            // $s7SwiftUI24UnaryDepthLayoutGeometryV5valueAA04ViewdF0VvgAA0D9PlacementVyXEfU_
            return self.layout.depthPlacement(
                of: proxy,
                in: context
            )
        }
        
        // x29 - 0x110
        let placement: DepthPlacement
        
        if EnableLayoutDepthStashing.isEnabled {
            // <+636>
            var data = LayoutDepthData(depthProposal: depth)
            
            placement = withUnsafeMutablePointer(to: &data) { pointer in
                let old = unsafe LayoutDepthData.current
                unsafe LayoutDepthData.current = unsafe pointer
                let result = block()
                unsafe LayoutDepthData.current = unsafe old
                return result
            }
            
            // <+816>
        } else {
            // <+748>
            placement = block()
            // <+816>
        }
        
        // <+816>
        let d8 = placement.anchor.value
        let d9 = placement.offset
        
        let parentSize = self.parentSize
        
        let d0 = proxy.depth(
            in: _ProposedSize3D(
                width: parentSize.proposal.width,
                height: parentSize.proposal.height,
                depth: placement.proposal
            )
        )
        
        var d1 = d8 * d0
        d1 = d9 - d1
        
        return ViewDepthGeometry(
            origin: d1,
            size: d0,
            proposal: placement.proposal
        )
    }
}

fileprivate struct UnaryDepthLayoutComputer<L : UnaryDepthLayout> : AsyncAttribute, StatefulRule {
    @Attribute var layout: L
    @Attribute var environment: EnvironmentValues
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        let current = AnyAttribute.current!
        
        let engine = UnaryDepthLayoutComputer<L>.Engine(
            layout: self.layout,
            layoutContext: SizeAndSpacingContext(
                context: AnyRuleContext(attribute: current),
                owner: current,
                environment: self.$environment
            ),
            child: LayoutProxy(
                context: AnyRuleContext(attribute: current),
                attributes: LayoutProxyAttributes(
                    layoutComputer: self._childLayoutComputer,
                    traitsList: OptionalAttribute()
                )
            ),
            cache: Cache3()
        )
        
        self.update(to: engine)
    }
}

extension UnaryDepthLayoutComputer {
    struct Engine : LayoutEngine {
        let layout: L
        let layoutContext: SizeAndSpacingContext // 0x24
        let child: LayoutProxy // 0x28
        private(set) var cache: Cache3<_ProposedSize3D, CGFloat> // 0x2c
        
        mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
            /*
             proposedSize -> x0 -> x21
             self -> x20 -> x23
             Self -> x1 -> x22
             */
            // <+148>
            let copy = self
            
            // <+196>
            return self.cache.get(proposedSize) { 
                return copy.layout.depthThatFits(
                    in: proposedSize,
                    context: copy.layoutContext,
                    child: copy.child
                )
            }
        }
        
        func layoutPriority() -> Double {
            assertUnimplemented()
        }
        
        func ignoresAutomaticPadding() -> Bool {
            assertUnimplemented()
        }
        
        func requiresSpacingProjection() -> Bool {
            return self.child.requiresSpacingProjection
        }
        
        func requiresTrueDepthLayout() -> Bool {
            assertUnimplemented()
        }
        
        func spacing() -> Spacing {
            return self.child.spacing()
        }
        
        func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
            return self.withUpdatedDepthProposal(proposal2D: proposedSize) { 
                // $s7SwiftUI24UnaryDepthLayoutComputer33_34D3AEC4362799DA2D0B148FCF3EBBB0LLV6EngineV12sizeThatFitsySo6CGSizeVAA13_ProposedSizeVFAIyXEfU_TA
                return self.child.size(in: proposedSize)
            }
        }
        
        func withUpdatedDepthProposal<T>(proposal2D: _ProposedSize, run: () -> T) -> T {
            if EnableLayoutDepthStashing.isEnabled {
                return withStashedDepthProposal { depth in
                    // $s7SwiftUI24UnaryDepthLayoutComputer33_34D3AEC4362799DA2D0B148FCF3EBBB0LLV6EngineV011withUpdatedD8Proposal10proposal2D3runqd__AA13_ProposedSizeV_qd__yXEtlF
                    let depthOffered = self.layout.depthOffered(
                        to: self.child,
                        for: _ProposedSize3D(proposal2D, depth: depth),
                        context: self.layoutContext
                    )
                    
                    return withDepthProposalStashing(depth: depthOffered) { 
                        // $s7SwiftUI14LayoutComputerV17withMutableEngine4type2doq_xm_q_xzXEtAA0cG0Rzr0_lFq_xzXEfU_TA
                        return run()
                    }
                }
            } else {
                return run()
            }
        }
        
        func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
            return withUpdatedDepthProposal(proposal2D: viewSize.proposal) { 
                // $s7SwiftUI24UnaryDepthLayoutComputer33_34D3AEC4362799DA2D0B148FCF3EBBB0LLV6EngineV17explicitAlignment_2at12CoreGraphics7CGFloatVSgAA0P3KeyV_AA8ViewSizeVtFALyXEfU_TA
                return self.child.explicitAlignment(alignmentKey, at: viewSize)
            }
        }
        
        func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
            assertUnimplemented()
        }
    }
}

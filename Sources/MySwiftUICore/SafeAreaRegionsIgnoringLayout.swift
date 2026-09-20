internal import CoreGraphics

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct _SafeAreaRegionsIgnoringLayout {
    public var regions: SafeAreaRegions
    public var edges: Edge.Set
    @inlinable package init(regions: SafeAreaRegions, edges: Edge.Set) {
        self.regions = regions
        self.edges = edges
    }
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias AnimatableData = EmptyAnimatableData
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SafeAreaRegionsIgnoringLayout : Animatable {}
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SafeAreaRegionsIgnoringLayout : ViewModifier {}
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SafeAreaRegionsIgnoringLayout : Sendable {}
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SafeAreaRegionsIgnoringLayout : BitwiseCopyable {}

extension _SafeAreaRegionsIgnoringLayout : UnaryLayout {
    typealias PlacementContextType = Never
    
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    nonisolated func placement(of proxy: LayoutProxy, in context: Self.PlacementContextType) -> _Placement {
        assertUnimplemented()
    }
    
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        assertUnimplemented()
    }
    
    nonisolated func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
    
    static nonisolated func makeViewImpl(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension _SafeAreaRegionsIgnoringLayout : MultiViewModifier {}
extension _SafeAreaRegionsIgnoringLayout : PrimitiveViewModifier {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    @inlinable nonisolated public func ignoresSafeArea(_ regions: SafeAreaRegions = .all, edges: Edge.Set = .all) -> some View {
        return modifier(_SafeAreaRegionsIgnoringLayout(
            regions: regions, edges: edges))
    }
    
}

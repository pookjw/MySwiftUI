// A5372118658F90C947BF499CB95E323D
public import CoreGraphics

@frozen public struct _PaddingLayout {
    public var edges: Edge.Set
    public var insets: EdgeInsets?
    
    @inlinable public init(edges: Edge.Set = .all, insets: EdgeInsets?) {
        self.edges = edges
        self.insets = insets
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
    
    fileprivate func effectiveInsets(in contect: SizeAndSpacingContext) -> EdgeInsets {
        assertUnimplemented()
    }
}

extension View {
    @inlinable nonisolated public func padding(_ insets: EdgeInsets) -> some View {
        return modifier(_PaddingLayout(insets: insets))
    }
    
    @inlinable nonisolated public func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
        let insets = length.map { EdgeInsets(_all: $0) }
        return modifier(_PaddingLayout(edges: edges, insets: insets))
    }
    
    @inlinable nonisolated public func padding(_ length: CGFloat) -> some View {
        return padding(.all, length)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @MainActor @preconcurrency public func _tightPadding() -> some View {
        assertUnimplemented()
    }
}

extension _PaddingLayout : Animatable {}
extension _PaddingLayout : ViewModifier {}
extension _PaddingLayout : Sendable {}
extension _PaddingLayout : BitwiseCopyable {}

extension _PaddingLayout : UnaryLayout {
    nonisolated func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    nonisolated func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
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
}

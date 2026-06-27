internal import CoreGraphics

protocol DerivedLayout : Layout {
    associatedtype Base : Layout
    
    var base: Base { get }
}

extension DerivedLayout {
    public static var layoutProperties: LayoutProperties {
        assertUnimplemented()
    }
    
    public func makeCache(subviews: LayoutSubviews) -> Cache {
        assertUnimplemented()
    }
    
    public func updateCache(_ cache: inout Cache, subviews: LayoutSubviews) {
        assertUnimplemented()
    }
    
    public func spacing(subviews: LayoutSubviews, cache: inout Cache) -> ViewSpacing {
        assertUnimplemented()
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Cache) -> CGSize {
        assertUnimplemented()
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Cache) {
        assertUnimplemented()
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Cache) -> CGFloat? {
        assertUnimplemented()
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Cache) -> CGFloat? {
        assertUnimplemented()
    }
}

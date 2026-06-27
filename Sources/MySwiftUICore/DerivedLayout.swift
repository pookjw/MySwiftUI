internal import CoreGraphics

protocol DerivedLayout : Layout {
    associatedtype Base : Layout
    
    var base: Base { get }
}

extension DerivedLayout {
    public static var layoutProperties: LayoutProperties {
        return Self.Base.layoutProperties
    }
    
    public func makeCache(subviews: LayoutSubviews) -> Base.Cache {
        return self.base.makeCache(subviews: subviews)
    }
    
    public func updateCache(_ cache: inout Base.Cache, subviews: LayoutSubviews) {
        return self.base.updateCache(&cache, subviews: subviews)
    }
    
    public func spacing(subviews: LayoutSubviews, cache: inout Base.Cache) -> ViewSpacing {
        return self.base.spacing(subviews: subviews, cache: &cache)
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Base.Cache) -> CGSize {
        return self.base.sizeThatFits(proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Base.Cache) {
        return self.base.placeSubviews(in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Base.Cache) -> CGFloat? {
        return self.base.explicitAlignment(of: guide, in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
    
    public func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout Base.Cache) -> CGFloat? {
        return self.base.explicitAlignment(of: guide, in: bounds, proposal: proposal, subviews: subviews, cache: &cache)
    }
}

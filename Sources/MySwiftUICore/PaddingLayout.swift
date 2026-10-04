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
    
    fileprivate func effectiveInsets(in context: SizeAndSpacingContext) -> EdgeInsets {
        var insets = self.insets ?? context.defaultPadding
        
        // <+372>
        insets.top = self.edges.contains(.top) ? insets.top : 0
        insets.leading = self.edges.contains(.leading) ? insets.leading : 0
        insets.bottom = self.edges.contains(.bottom) ? insets.bottom : 0
        insets.trailing = self.edges.contains(.trailing) ? insets.trailing : 0
        
        return insets
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
        let spacingContext = SizeAndSpacingContext(context)
        
        let d8: CGFloat
        let d9: CGFloat
        let d10: CGFloat
        let d11: CGFloat
        do {
            let insets = self.effectiveInsets(in: spacingContext)
            d8 = insets.top
            d9 = insets.leading
            d10 = insets.bottom
            d11 = insets.trailing
        }
        
        let proposedSize = context.proposedSize
        
        let width: CGFloat?
        if var d0 = proposedSize.width {
            let d1 = d9 + d11
            d0 = d0 - d1
            d0 = (d0 >= 0) ? d0 : 0
            width = d0
        } else {
            width = nil
        }
        
        let height: CGFloat?
        if var d1 = proposedSize.height {
            let d2 = d8 + d10
            d1 = d1 - d2
            d1 = (d1 >= 0) ? d1 : 0
            height = d1
        } else {
            height = nil
        }
        
        return _Placement(
            proposedSize: _ProposedSize(width: width, height: height),
            anchoring: UnitPoint(x: 0, y: 0),
            at: CGPoint(x: d9, y: d8)
        )
    }
    
    nonisolated func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        var d0: CGFloat
        var d1: CGFloat
        var d2: CGFloat
        var d3: CGFloat
        do {
            let insets = self.effectiveInsets(in: context)
            d0 = insets.top
            d1 = insets.leading
            d2 = insets.bottom
            d3 = insets.trailing
        }
        
        let d8 = d0
        let d9 = d1
        let d10 = d2
        let d11 = d3
        let d15: CGFloat = 0
        
        let width: CGFloat?
        if let d12 = size.width {
            d0 = d1 + d3
            d0 = d12 - d0
            d0 = (d0 >= 0) ? d0 : d15
            width = d0
        } else {
            width = nil
        }
        
        let height: CGFloat?
        if let d13 = size.height {
            d1 = d8 + d2
            d1 = d13 - d1
            d1 = (d1 >= 0) ? d1 : d15
            height = d1
        } else {
            height = nil
        }
        
        do {
            let size = child.size(in: _ProposedSize(width: width, height: height))
            d0 = size.width
            d1 = size.height
        }
        
        d2 = d15 - d8
        d3 = d15 - d9
        let d4 = d15 - d10
        let d5 = d15 - d11
        d3 = d3 + d5
        d0 = d0 - d3
        d0 = (d0 >= 0) ? d0 : d15
        d2 = d2 + d4
        d1 = d1 - d2
        d1 = (d1 >= 0) ? d1 : d15
        
        return CGSize(width: d0, height: d1)
    }
    
    nonisolated func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    nonisolated func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
}

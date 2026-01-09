// 00690F480F8D293143B214DBE6D72CD0
public import CoreGraphics

@frozen public struct _VStackLayout {
    public var alignment: HorizontalAlignment
    public var spacing: CGFloat?
    
    @inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil) {
        self.alignment = alignment
        self.spacing = spacing
    }
}

extension _VStackLayout {
    public typealias Body = Never
}

extension _VStackLayout: _VariadicView_ImplicitRoot {
    static nonisolated var implicitRoot: _VStackLayout {
        return _VStackLayout(alignment: .center, spacing: nil)
    }
}

extension _VStackLayout: Layout, HVStack {
    public typealias Cache = _StackLayoutCache
    public typealias AnimatableData = EmptyAnimatableData
    
    static var majorAxis: Axis {
        return .vertical
    }
}

protocol HVStack: Layout, _VariadicView_UnaryViewRoot {
    associatedtype MinorAxisAlignment: AlignmentGuide
    
    var spacing: CGFloat? { get }
    var alignment: Self.MinorAxisAlignment { get }
    static var majorAxis: Axis { get }
    static var resizeChildrenWithTrailingOverflow: Bool { get }
}

extension HVStack {
    static var resizeChildrenWithTrailingOverflow: Bool {
        return false
    }
    
    public static nonisolated func _makeView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        return Self.makeLayoutView(root: root, inputs: inputs, body: body)
    }
    
    public static nonisolated var layoutProperties: LayoutProperties {
        return LayoutProperties()
    }
    
    public nonisolated func makeCache(subviews: LayoutSubviews) -> _StackLayoutCache {
        let majorAxis = Self.majorAxis
        let alignment = alignment
        let alignmentKey = alignment.key
        let spacing = spacing
        let resizeChildrenWithTrailingOverflow = Self.resizeChildrenWithTrailingOverflow
        
        let header = StackLayout.Header(
            minorAxisAlignment: alignmentKey, // x29 - 0xe0
            uniformSpacing: spacing, // x29 - 0xd8
            majorAxis: majorAxis, // x29 - 0xd0
            internalSpacing: 0, // x29 - 0xc8
            lastProposedSize: ProposedViewSize(width: -.infinity, height: -.infinity), // x29 - 0xc0
            stackSize: .zero, // x29 - 0xa0
            proxies: subviews, // x29 - 0x90
            resizeChildrenWithTrailingOverflow: resizeChildrenWithTrailingOverflow // x29 - 0x7e
        )
        
        var stack = StackLayout(
            header: header,
            children: []
        )
        
        stack.makeChildren()
        
        let cache = _StackLayoutCache(stack: stack)
        return cache
    }
    
    public nonisolated func updateCache(_: inout _StackLayoutCache, subviews: LayoutSubviews) {
        fatalError("TODO")
    }
    
    public nonisolated func spacing(subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> ViewSpacing {
        fatalError("TODO")
    }
    
    public nonisolated func sizeThatFits(proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGSize {
        fatalError("TODO")
    }
    
    public nonisolated func placeSubviews(in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) {
        fatalError("TODO")
    }
    
    public nonisolated func explicitAlignment(of: HorizontalAlignment, in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGFloat? {
        fatalError("TODO")
    }
    
    public nonisolated func explicitAlignment(of: VerticalAlignment, in: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) -> CGFloat? {
        fatalError("TODO")
    }
}

public struct _StackLayoutCache {
    fileprivate var stack: StackLayout
}

@available(*, unavailable)
extension _StackLayoutCache: Sendable {
}

struct StackLayout {
    fileprivate private(set) var header: StackLayout.Header
    fileprivate private(set) var children: [StackLayout.Child]
    
    func explicitAlignment(_: AlignmentKey, in: CGRect, proposal: ProposedViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    fileprivate mutating func makeChildren() {
        // self = x19
        
        fatalError("TODO")
    }
}

extension StackLayout {
    fileprivate struct Header {
        fileprivate let minorAxisAlignment: AlignmentKey // 0x0
        fileprivate let uniformSpacing: CGFloat? // 0x8
        fileprivate let majorAxis: Axis // 0x10
        fileprivate private(set) var internalSpacing: CGFloat // 0x18
        fileprivate private(set) var lastProposedSize: ProposedViewSize // 0x20
        fileprivate private(set) var stackSize: CGSize // 0x40
        fileprivate let proxies: LayoutSubviews // 0x50
        fileprivate let resizeChildrenWithTrailingOverflow: Bool // 0x68 
    }
    
    fileprivate struct Child {
        private var layoutPriority: Double
        private var majorAxisRangeCache: StackLayout.MajorAxisRangeCache
        private let distanceToPrevious: CGFloat
        private var fittingOrder: Int
        private var geometry: ViewGeometry
    }
    
    fileprivate struct MajorAxisRangeCache {
        private var min: CGFloat?
        private var max: CGFloat?
    }
}

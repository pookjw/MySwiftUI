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
            minorAxisAlignment: alignmentKey,
            uniformSpacing: spacing,
            majorAxis: majorAxis,
            internalSpacing: 0,
            lastProposedSize: ProposedViewSize(width: -.infinity, height: -.infinity),
            stackSize: .zero,
            proxies: subviews,
            resizeChildrenWithTrailingOverflow: resizeChildrenWithTrailingOverflow
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
    
    public nonisolated func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: LayoutSubviews, cache: inout _StackLayoutCache) {
        /*
         rect -> d11, d10, d9, d8
         proposal -> x22
         subviews -> x24, x20, x23
         cache -> x19
         */
        return withUnmanagedImplementation(stackLayout: &cache.stack) { unmanaged in
            return unmanaged.commitPlacements(in: bounds, proposedSize: proposal)
        }
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
    fileprivate var header: StackLayout.Header
    fileprivate var children: [StackLayout.Child]
    
    func explicitAlignment(_: AlignmentKey, in: CGRect, proposal: ProposedViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    fileprivate mutating func makeChildren() {
        // self = x19
        children.reserveCapacity(max(header.proxies.count, children.count))
        header.internalSpacing = 0
        
        // AGAttributeNil -> sp + 0x3c
        var d9: CGFloat = 0
        for index in header.proxies.indices {
            let d10: CGFloat
            if index == 0 {
                d10 = 0
            } else {
                if let uniformSpacing = header.uniformSpacing {
                    d10 = uniformSpacing
                } else {
                    let prevSpacing = header.proxies[index &- 1].spacing
                    let currentSpacing = header.proxies[index].spacing
                    d10 = prevSpacing.distance(to: currentSpacing, along: header.majorAxis)
                }
                
                d9 += d10
                header.internalSpacing = d9
            }
            
            let child = StackLayout.Child(
                layoutPriority: header.proxies[index].priority,
                majorAxisRangeCache: MajorAxisRangeCache(min: nil, max: nil),
                distanceToPrevious: d10,
                fittingOrder: index,
                geometry: .invalidValue
            )
            
            children.append(child)
        }
    }
}

extension StackLayout {
    fileprivate struct Header {
        fileprivate let minorAxisAlignment: AlignmentKey // 0x0
        fileprivate let uniformSpacing: CGFloat? // 0x8
        fileprivate let majorAxis: Axis // 0x11
        fileprivate var internalSpacing: CGFloat // 0x18
        fileprivate private(set) var lastProposedSize: ProposedViewSize // 0x20
        fileprivate private(set) var stackSize: CGSize // 0x40
        fileprivate let proxies: LayoutSubviews // 0x50
        fileprivate let resizeChildrenWithTrailingOverflow: Bool // 0x68 
    }
    
    fileprivate struct Child {
        fileprivate private(set) var layoutPriority: Double
        fileprivate private(set) var majorAxisRangeCache: StackLayout.MajorAxisRangeCache
        fileprivate let distanceToPrevious: CGFloat
        fileprivate private(set) var fittingOrder: Int
        fileprivate private(set) var geometry: ViewGeometry
    }
    
    fileprivate struct MajorAxisRangeCache {
        var min: CGFloat?
        var max: CGFloat?
    }
    
    fileprivate struct UnmanagedImplementation {
        let header: UnsafeMutablePointer<StackLayout.Header>
        let children: UnsafeMutableBufferPointer<StackLayout.Child>
        
        func prioritize(_: UnsafeMutableBufferPointer<StackLayout.Child>, proposedSize: ProposedViewSize) {
            fatalError("TODO")
        }
        
        func commitPlacements(in bounds: CGRect, proposedSize: ProposedViewSize) {
            /*
             bounds -> d0, d1, d2, d3
             proposedSize -> x0
             header -> x4
             children -> x5
             */
            fatalError("TODO")
        }
        
        func spacing() -> Spacing {
            fatalError("TODO")
        }
        
        func explicitAlignment(_ key: AlignmentKey, at size: ViewSize) -> CGFloat? {
            fatalError("TODO")
        }
        
        func placeChildren(in size: ProposedViewSize) {
            fatalError("TODO")
        }
        
        func proposalWhenPlacing(in size: ViewSize) -> ProposedViewSize {
            fatalError("TODO")
        }
        
        func resizeAnyChildrenWithTrailingOverflow(in size: ProposedViewSize) {
            fatalError("TODO")
        }
    }
}

@inline(__always)
fileprivate func withUnmanagedImplementation<T>(stackLayout: inout StackLayout, body: (StackLayout.UnmanagedImplementation) throws -> T) rethrows -> T {
    return try stackLayout.children.withUnsafeMutableBufferPointer { children in
        return try body(StackLayout.UnmanagedImplementation(header: &stackLayout.header, children: children))
    }
}

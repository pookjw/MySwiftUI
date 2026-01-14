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
        return cache.stack.withUnmanagedImplementation { unmanaged in
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
    
    @inline(__always)
    fileprivate mutating func withUnmanagedImplementation<T>(body: (StackLayout.UnmanagedImplementation) throws -> T) rethrows -> T {
        return try children.withUnsafeMutableBufferPointer { children in
            return try body(StackLayout.UnmanagedImplementation(header: &header, children: children))
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
        fileprivate var stackSize: CGSize // 0x40
        fileprivate let proxies: LayoutSubviews // 0x50
        fileprivate let resizeChildrenWithTrailingOverflow: Bool // 0x62
    }
    
    fileprivate struct Child {
        fileprivate var layoutPriority: Double // 0x0
        fileprivate var majorAxisRangeCache: StackLayout.MajorAxisRangeCache // 0x8
        fileprivate let distanceToPrevious: CGFloat // 0x28
        fileprivate var fittingOrder: Int // 0x30
        fileprivate var geometry: ViewGeometry
        /*
         origin.x -> 0x38
         origin.y -> 0x40
         dimensions.guideComputer -> 0x48/0x50
         dimensions.size.value -> 0x58/0x60
         dimensions.size._proposal -> 0x68/0x70
         */
    }
    
    fileprivate struct MajorAxisRangeCache {
        var min: CGFloat?
        var max: CGFloat?
    }
    
    fileprivate struct UnmanagedImplementation {
        let header: UnsafeMutablePointer<StackLayout.Header>
        let children: UnsafeMutableBufferPointer<StackLayout.Child>
        
        func prioritize(_ children: UnsafeMutableBufferPointer<StackLayout.Child>, proposedSize: ProposedViewSize) {
            /*
             children (arg) -> x0
             header -> x6 -> x19
             */
            let majorAxis = header.pointee.majorAxis
            guard
                header.pointee.lastProposedSize[majorAxis] != proposedSize[majorAxis] ||
                header.pointee.lastProposedSize[majorAxis] == nil
            else {
                return
            }
            
            for index in children.indices.reversed() {
                children[index].majorAxisRangeCache = StackLayout.MajorAxisRangeCache(min: nil, max: nil)
            }
            
            // <+224>
            // x28
            let layoutPriorityBuffer = UnsafeMutableBufferProjectionPointer(children, \.layoutPriority)
            // x21
            var majorAxisRangeCacheBuffer = UnsafeMutableBufferProjectionPointer(children, \.majorAxisRangeCache)
            // x23 -> sp + 0xb8
            var fittingOrderBuffer = UnsafeMutableBufferProjectionPointer(children, \.fittingOrder)
            /*
             count -> sp + 0xc0
             AGAttributeNil -> sp + 0x4c
             fittingOrderBuffer -> sp + 0x50
             layoutPriorityBuffer -> sp + 0x58
             x21 -> sp + 0x38
             */
            
            /*
             lengthThatFits
             */
            // <+2504>에서 fittingOrderBuffer로 slowPath하고 있기에 fittingOrderBuffer임
            fittingOrderBuffer.insertionSort { lhs, rhs in
                // inlined
                // <+460>
                // d1
                let lhsLayoutPriority = layoutPriorityBuffer[lhs]
                // d0
                let rhsLayoutPriority = layoutPriorityBuffer[rhs]
                
                guard lhsLayoutPriority == rhsLayoutPriority else {
                    return !(lhsLayoutPriority < rhsLayoutPriority)
                }
                
                // <+632>
                // d8
                let rhsRangeMin: CGFloat
                if let min = majorAxisRangeCacheBuffer[rhs].min {
                    rhsRangeMin = min
                } else {
                    let min = header.pointee.proxies[rhs].lengthThatFits(
                        ProposedViewSize(0, in: header.pointee.majorAxis, by: proposedSize[header.pointee.majorAxis]),
                        in: header.pointee.majorAxis
                    )
                    majorAxisRangeCacheBuffer[rhs].min = min
                    rhsRangeMin = min
                }
                
                // <+980>
                // d9
                let rhsRangeMax: CGFloat
                if let max = majorAxisRangeCacheBuffer[rhs].max {
                    rhsRangeMax = max
                } else {
                    let max = header.pointee.proxies[rhs].lengthThatFits(
                        ProposedViewSize(.infinity, in: header.pointee.majorAxis, by: proposedSize[header.pointee.majorAxis]),
                        in: header.pointee.majorAxis
                    )
                    majorAxisRangeCacheBuffer[rhs].max = max
                    rhsRangeMax = max
                }
                
                // <+1188>
                // d10
                let lhsRangeMin: CGFloat
                if let min = majorAxisRangeCacheBuffer[lhs].min {
                    lhsRangeMin = min
                } else {
                    let min = header.pointee.proxies[lhs].lengthThatFits(
                        ProposedViewSize(0, in: header.pointee.majorAxis, by: proposedSize[header.pointee.majorAxis]),
                        in: header.pointee.majorAxis
                    )
                    majorAxisRangeCacheBuffer[lhs].min = min
                    lhsRangeMin = min
                }
                
                // <+1712>
                // d11
                let lhsRangeMax: CGFloat
                if let max = majorAxisRangeCacheBuffer[lhs].max {
                    lhsRangeMax = max
                } else {
                    let max = header.pointee.proxies[lhs].lengthThatFits(
                        ProposedViewSize(.infinity, in: header.pointee.majorAxis, by: proposedSize[header.pointee.majorAxis]),
                        in: header.pointee.majorAxis
                    )
                    majorAxisRangeCacheBuffer[lhs].max = max
                    lhsRangeMax = max
                }
                
                // <+1920>
                let rhsEstimate = _LayoutTraits.FlexibilityEstimate(minLength: rhsRangeMin, maxLength: rhsRangeMax)
                let lhsEstimate = _LayoutTraits.FlexibilityEstimate(minLength: lhsRangeMin, maxLength: lhsRangeMax)
                return lhsEstimate < rhsEstimate
            }
            
            // <+2508>
            // d9
            let firstLayoutPriority = layoutPriorityBuffer[fittingOrderBuffer[0]]
            for index in fittingOrderBuffer.indices.reversed() {
                let fittingOrder = fittingOrderBuffer[index]
                // d0
                let layoutPriority = layoutPriorityBuffer[fittingOrder]
                guard layoutPriority != firstLayoutPriority else {
                    return
                }
                
                let majorAxisRangeCache = majorAxisRangeCacheBuffer[fittingOrder]
                guard majorAxisRangeCache.min == nil else {
                    continue
                }
                
                // <+2776>
                let min = header.pointee.proxies[fittingOrder].lengthThatFits(
                    ProposedViewSize(0, in: header.pointee.majorAxis, by: proposedSize[header.pointee.majorAxis]),
                    in: header.pointee.majorAxis
                )
                majorAxisRangeCacheBuffer[fittingOrder].min = min
            }
        }
        
        func commitPlacements(in bounds: CGRect, proposedSize: ProposedViewSize) {
            /*
             bounds -> d0, d1, d2, d3 -> d13, d10, d15, d11
             proposedSize -> x0
             header -> x4 -> x21
             children -> x5, x6 -> x27, x20
             */
            var d0 = bounds.origin.x
            var d1 = bounds.origin.y
            var d2 = bounds.size.width
            var d3 = bounds.size.height
            var d13 = d0
            var d10 = d1
            var d15 = d2
            var d11 = d3
            
            let proposal = proposalWhenPlacing(
                in: ViewSize(
                    bounds.size,
                    proposal: _ProposedSize(width: proposedSize.width, height: proposedSize.height)
                )
            )
            
            placeChildren(in: proposal)
            
            // w23
            let layoutDirection = header.pointee.proxies.layoutDirection
            /*
             bounds.size.width -> sp + 0x30
             bounds.origin.y -> sp + 0x40
             bounds.origin.x -> sp + 0x48
             */
            
            switch header.pointee.majorAxis {
            case .vertical:
                d13 = bounds.minY
                
                // sp + 0x250
                let copy_1 = header.pointee
                // sp + 0x1d0
                let copy_2 = copy_1
                
                // children -> x26
                // x28(index), x26, x25
                for (child, proxy) in zip(children, copy_1.proxies) {
                    // <+536>
                    // sp + 0x1d0
                    let copy_3 = child
                    
                    // <+640>
                    // sp + 0x50
                    let dimensions = child.geometry.dimensions
                    var d14 = copy_3.geometry.origin.x
                    d0 = copy_3.distanceToPrevious
                    var d8 = d13 + d0
                    
                    // <+672>
                    d0 = copy_3.geometry.origin.y
                    d13 = copy_3.geometry.dimensions.size.height
                    
                    var d12: CGFloat
                    if d0.bitPattern & 0xfffffffffffff != 0 {
                        d12 = d8
                    } else {
                        d12 = d0
                    }
                    
                    // <+704>
                    // inlined
                    
                    switch layoutDirection {
                    case .rightToLeft:
                        // <+708>
                        d10 = copy_3.geometry.dimensions.size.value.width
                        d0 = d14
                        d1 = d12
                        d2 = d10
                        d10 = bounds.origin.y
                        var d3 = d13
                        d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
                        d14 = d15 - d0
                        // <+792>
                    case .leftToRight:
                        // <+768>
                        // <+792>
                        break
                    }
                    d0 = bounds.origin.x
                    d1 = d10
                    d2 = d15
                    d3 = d11
                    
                    d0 = CGRect(x: d0, y: d1, width: d2, height: d3).minX
                    var d9 = d14 + d0
                    proxy.place(
                        in: ViewGeometry(
                            origin: CGPoint(x: d9, y: d12),
                            dimensions: dimensions
                        ),
                        layoutDirection: layoutDirection
                    )
                    
                    // <+476>
                    d13 += d8
                }
            case .horizontal:
                // <+1040>
                fatalError("TODO")
            }
        }
        
        func spacing() -> Spacing {
            fatalError("TODO")
        }
        
        func explicitAlignment(_ key: AlignmentKey, at size: ViewSize) -> CGFloat? {
            fatalError("TODO")
        }
        
        func placeChildren(in size: ProposedViewSize) {
            /*
             header -> x4
             children -> x5, x6 -> x25, x24
             */
            guard size != header.pointee.lastProposedSize else {
                return
            }
            
            let minorProposal: CGFloat?
            switch header.pointee.majorAxis {
            case .horizontal:
                minorProposal = size[.vertical]
            case .vertical:
                minorProposal = size[.horizontal]
            }
            placeChildren1(in: size) { _ in
                return minorProposal
            }
            
            if header.pointee.resizeChildrenWithTrailingOverflow {
                resizeAnyChildrenWithTrailingOverflow(in: size)
            }
        }
        
        func proposalWhenPlacing(in size: ViewSize) -> ProposedViewSize {
            return ProposedViewSize(
                width: size.proposal.width,
                height: size.proposal.height
            )
        }
        
        func resizeAnyChildrenWithTrailingOverflow(in size: ProposedViewSize) {
            fatalError("TODO")
        }
        
        func placeChildren1(in size: ProposedViewSize, minorProposalForChild: (StackLayout.Child) -> CGFloat?) {
            /*
             header -> x4
             children -> x5, x6 -> x21, x20
             minorProposalForChild의 결과값 -> x7
             */
            if size[header.pointee.majorAxis] == nil {
                sizeChildrenIdeally(in: size, minorProposalForChild: minorProposalForChild)
            } else {
                sizeChildrenGenerallyWithConcreteMajorProposal(in: size, minorProposalForChild: minorProposalForChild)
            }
            
            var d14: CGFloat = 0
            var d13: CGFloat = 0
            var d12: CGFloat = 0
            var d15: CGFloat = 0
            
            for child in children {
                // sp + 0x80
                let copy = child
                // w26
                let majorAxis = header.pointee.majorAxis
                // d8, d9, d10, d11
                let frame = copy.geometry.frame
                // frame
                
                var d0: CGFloat = 0
                var d1: CGFloat = 0
                if !frame.isNull {
                    d0 = (majorAxis == .horizontal) ? frame.size.height : frame.size.width
                    d1 = (majorAxis == .horizontal) ? frame.origin.y : frame.origin.x
                    
                    d0 += d1
                    
                    let d2: CGFloat
                    if d0 < d1 {
                        d2 = d0
                    } else {
                        d2 = d1
                    }
                    
                    if d1 > d0 {
                        d0 = d1
                    }
                    
                    if d2 <= d0 {
                        d1 = d2
                    } else {
                        d0 = d15
                        d1 = d15
                    }
                }
                
                // <+344>
                if d1 < d13 {
                    d13 = d1
                }
                
                if d12 <= d0 {
                    d12 = d0
                }
                
                assert(d13 < d12)
            }
            
            // <+380>
            if !children.isEmpty {
                let majorAxis = header.pointee.majorAxis
                d14 = 0
                
                for index in children.indices {
                    var d0 = children[index].distanceToPrevious
                    d0 += d14
                    
                    if d0.bitPattern & 0xfffffffffffff == 0 {
                        switch majorAxis {
                        case .horizontal:
                            children[index].geometry.origin.x = d0
                        case .vertical:
                            children[index].geometry.origin.y = d0
                        }
                    }
                    
                    var d1: CGFloat
                    switch majorAxis {
                    case .horizontal:
                        d1 = children[index].geometry.origin.y
                    case .vertical:
                        d1 = children[index].geometry.origin.x
                    }
                    
                    d1 -= d13
                    
                    if d1.bitPattern & 0xfffffffffffff == 0 {
                        switch majorAxis {
                        case .horizontal:
                            children[index].geometry.origin.y = d1
                        case .vertical:
                            children[index].geometry.origin.x = d1
                        }
                    }
                    
                    // <+432>
                    switch majorAxis {
                    case .horizontal:
                        d1 = children[index].geometry.dimensions.size.width
                    case .vertical:
                        d1 = children[index].geometry.dimensions.size.height
                    }
                    
                    d14 = d0 + d1
                }
            }
            
            // <+536>
            var d0 = d12 - d13
            let d1: CGFloat
            switch header.pointee.majorAxis {
            case .horizontal:
                d1 = d14
            case .vertical:
                d1 = d0
                d0 = d14
            }
            
            header.pointee.stackSize = CGSize(width: d1, height: d0)
        }
        
        func sizeChildrenIdeally(in size: ProposedViewSize, minorProposalForChild: (StackLayout.Child) -> CGFloat?) {
            fatalError("TODO")
        }
        
        func sizeChildrenGenerallyWithConcreteMajorProposal(in size: ProposedViewSize, minorProposalForChild: (StackLayout.Child) -> CGFloat?) {
            /*
             children -> x25, x21
             */
            // w19
            let majorAxis = header.pointee.majorAxis
            assert(size[header.pointee.majorAxis] != nil)
            let internalSpacing = header.pointee.internalSpacing
            prioritize(children, proposedSize: size)
            
            guard !children.isEmpty else {
                return
            }
            
            // x14
            let fittingOrderBuffer = UnsafeMutableBufferProjectionPointer(children, \.fittingOrder)
            // d0
            let length = size[majorAxis]!
            var d10 = length - internalSpacing
            // d11 -> 0
            var w15 = false
            // x8
            var index = 0
            while !w15 {
                // x10
                let fittingOrder = fittingOrderBuffer[index]
                // d0
                let layoutPriority = children[fittingOrder].layoutPriority
                
                // x19
                var otherIndex = index
                // d1
                var otherLayoutPriority: CGFloat
                while true {
                    otherLayoutPriority = children[fittingOrderBuffer[otherIndex]].layoutPriority
                    guard otherLayoutPriority == layoutPriority else {
                        break
                    }
                    otherIndex &+= 1
                    
                    if otherIndex != children.count {
                        w15 = false 
                        continue
                    } else {
                        w15 = true
                        otherIndex = children.count
                        break
                    }
                }
                
                assert(otherIndex >= index)
                assert(otherIndex <= children.count)
                
                // <+388>
                // x11
                let firstFittingOrder = fittingOrderBuffer[0]
                // d0
                var total: CGFloat = 0
                // x28
                let dist: Int
                if fittingOrder == firstFittingOrder {
                    // <+404>
                    var x10 = otherIndex
                    while children.count != x10 {
                        // d1
                        let min = children[fittingOrderBuffer[x10]].majorAxisRangeCache.min!
                        x10 &+= 1
                        total += min
                    }
                    
                    // <+476>
                    d10 -= total
                    dist = otherIndex &- index
                    if dist == 0 {
                        index = otherIndex
                        continue
                    }
                } else {
                    // <+492>
                    if otherIndex != index {
                        var x11 = index
                        repeat {
                            let min = children[fittingOrderBuffer[x11]].majorAxisRangeCache.min!
                            x11 &+= 1
                            total += min
                        } while x11 != otherIndex
                    }
                    
                    dist = otherIndex &- index
                    if dist == 0 {
                        index = otherIndex
                        continue
                    }
                }
                
                // fittingOrder은 더 이상 x10이 아님
                // <+588>
                // w15 -> sp + 0x1c
                var x22 = index &+ 1
                let sp40 = -otherIndex
                let sp48 = -max(index, children.count)
                // <+636>
                repeat {
                    // x21
                    let fittingOrder2 = fittingOrderBuffer[x22 &+ sp48]
                    var d0 = d10 / CGFloat(dist)
                    if d0 <= 0 {
                        d0 = 0
                    }
                    // index는 더 이상 x8이 아님
                    // sp + 0x60
                    let size2 = ProposedViewSize(
                        d0,
                        in: header.pointee.majorAxis,
                        by: minorProposalForChild(children[fittingOrder2])
                    )
                    let proxy = header.pointee.proxies[fittingOrder2]
                    // d9/d8
                    let sizeThatFits = proxy.sizeThatFits(size2)
                    // d0
                    var explicitAlignment = proxy.proxy.explicitAlignment(
                        header.pointee.minorAxisAlignment,
                        at: ViewSize(sizeThatFits, proposal: _ProposedSize(width: size.width, height: size.height))
                    )
                    if explicitAlignment == nil {
                        let dimensions = ViewDimensions(
                            guideComputer: proxy.proxy.layoutComputer,
                            size: sizeThatFits,
                            proposal: _ProposedSize(width: size.width, height: size.height)
                        )
                        
                        explicitAlignment = header.pointee.minorAxisAlignment.id.defaultValue(in: dimensions)
                    }
                    
                    // <+1264>
                    let x20 = x22 &+ sp40
                    var d1: CGFloat
                    if explicitAlignment!.bitPattern & 0xfffffffffffff != 0 {
                        d1 = .infinity
                    } else {
                        d1 = explicitAlignment!
                    }
                    
                    explicitAlignment = -explicitAlignment!
                    children[fittingOrder2].geometry = ViewGeometry(
                        origin: CGPoint(0, in: header.pointee.majorAxis, by: explicitAlignment!),
                        dimensions: ViewDimensions(
                            guideComputer: proxy.proxy.layoutComputer,
                            size: sizeThatFits,
                            proposal: _ProposedSize(width: size.width, height: size.height)
                        )
                    )
                    
                    // <+1412>
                    switch header.pointee.majorAxis {
                    case .horizontal:
                        d0 = children[fittingOrder2].geometry.dimensions.size.proposal.width ?? 0
                    case .vertical:
                        d0 = children[fittingOrder2].geometry.dimensions.size.proposal.height ?? 0
                    }
                    
                    d0 = d10 - d0
                    
                    if d0.bitPattern & 0xfffffffffffff == 0 {
                        d1 = d0
                    } else {
                        d1 = d10
                    }
                    
                    if d0.bitPattern & 0x7ff0000000000000 == 0 {
                        d10 = d1
                    } else {
                        d10 = d0
                    }
                    
                    if x20 == 0 {
                        break
                    }
                    
                    x22 &+= 1
                } while true
                
                index = otherIndex
            }
        }
    }
}

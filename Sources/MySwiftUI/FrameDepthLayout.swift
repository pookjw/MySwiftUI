// D774BB874EFE5F8DFB42C3039888E54A
@_spi(Internal) public import MySwiftUICore
public import CoreGraphics
public import os.log

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension View {
    @_alwaysEmitIntoClient nonisolated public func frame(depth: CGFloat?, alignment: DepthAlignment = .center) -> some View {
        modifier(_FrameDepthLayout(depth: depth, alignment: alignment))
    }
    
    @_alwaysEmitIntoClient nonisolated public func frame(minDepth: CGFloat? = nil, idealDepth: CGFloat? = nil, maxDepth: CGFloat? = nil, alignment: DepthAlignment = .center) -> some View {
        func areInNondecreasingOrder(
            _ min: CGFloat?, _ ideal: CGFloat?, _ max: CGFloat?
        ) -> Bool {
            let min = min ?? -.infinity
            let ideal = ideal ?? min
            let max = max ?? ideal
            return min <= ideal && ideal <= max
        }
        
        if !areInNondecreasingOrder(minDepth, idealDepth, maxDepth) {
            unsafe os_log(
                .fault, log: Log.runtimeIssuesLog,
                "Contradictory frame constraints specified.")
        }
        
        return modifier(_FlexFrameDepthLayout(
            minDepth: minDepth, idealDepth: idealDepth, maxDepth: maxDepth,
            alignment: alignment))
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct _FrameDepthLayout {
    public var depth: CGFloat?
    public var alignment: DepthAlignment
    
    @inlinable public init(depth: CGFloat?, alignment: DepthAlignment) {
        self.depth = depth
        self.alignment = alignment
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias AnimatableData = EmptyAnimatableData
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias Body = Never
}

@available(*, unavailable)
extension _FrameDepthLayout : Sendable {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct _FlexFrameDepthLayout {
    public var minDepth: CGFloat?
    public var idealDepth: CGFloat?
    public var maxDepth: CGFloat?
    
    public var alignment: DepthAlignment
    @inlinable public init(minDepth: CGFloat?, idealDepth: CGFloat?, maxDepth: CGFloat?, alignment: DepthAlignment) {
        self.minDepth = minDepth
        self.idealDepth = idealDepth
        self.maxDepth = maxDepth
        self.alignment = alignment
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias AnimatableData = EmptyAnimatableData
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias Body = Never
}

@available(*, unavailable)
extension _FlexFrameDepthLayout : Sendable {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _FrameDepthLayout : Animatable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _FrameDepthLayout : ViewModifier, FrameDepthLayout {
    package func depthThatFits(in size: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat {
        if let depth {
            return depth
        }
        
        return child.depth(in: size)
    }
    
    package func depthPlacement(of proxy: LayoutProxy, in context: PlacementContext3D) -> DepthPlacement {
        /*
         self -> x20 -> x22
         proxy -> x0 -> x29 - 0x90
         context -> x1 -> x19
         */
        // <+388>
        // x24
        var proposedSize = context.proposedSize
        
        if let depth {
            proposedSize.depth = depth
        } 
        
        // <+424>
        // x27
        let dimensions_1 = ViewDimensions3D(
            guideComputer: .defaultValue,
            size: context.size,
            proposal: context.proposedSize
        )
        
        // x25
        let dimensions_2 = proxy.dimensions3D(in: proposedSize)
        // <+608>
        var d8 = self.alignment.depthKey.id.defaultValue(in: dimensions_1)
        let d0 = dimensions_2[self.alignment]
        d8 = d8 - d0
        
        // x29 - 0x78
        let placement = DepthPlacement(proposal: proposedSize.depth, offset: d8)
        return placement
    }
    
    package func depthOffered(to proxy: LayoutProxy, for size: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat? {
        if let depth {
            return depth
        }
        
        return size.depth
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _FlexFrameDepthLayout : Animatable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension _FlexFrameDepthLayout : ViewModifier, FrameDepthLayout {
    package func depthThatFits(in size: _ProposedSize3D, context: SizeAndSpacingContext, child: LayoutProxy) -> CGFloat {
        /*
         self -> x20 -> x22
         size -> x0 -> x20
         child -> x2 -> x23
         */
        // <+96>
        if size.depth == nil, let idealDepth {
            return idealDepth
        }
        
        // <+124>
        if
            let depth = size.depth,
            let minDepth,
            let maxDepth,
            minDepth <= maxDepth
        {
            let d1 = minDepth
            let d0 = maxDepth
            // <+640>
            let d2 = depth
            let d8 = (d1 <= d2) ? d2 : d1
            if !(d0 < d8) {
                return d8
            } else {
                return d0
            }
        }
        
        // <+180>
        // x21
        var copy_1 = size
        
        if var d0 = copy_1.depth ?? self.idealDepth {
            // <+244>
            var d1 = self.minDepth ?? -.infinity
            d0 = (d1 <= d0) ? d0 : d1
            d1 = self.maxDepth ?? .infinity
            d0 = (d1 < d0) ? d1 : d0
            copy_1.depth = d0
        } else {
            // <+320>
            copy_1.depth = nil
        }
        
        // <+328>
        var d8 = child.depth(in: copy_1)
        
        if let d9 = self.minDepth {
            // <+388>
            if let d10 = self.maxDepth {
                // <+560>
                assert(d9 <= d10)
                let d0 = (d9 <= d8) ? d8 : d9
                d8 = (d10 < d0) ? d10 : d0
                return d8
            } else {
                // <+404>
                var d0 = copy_1.depth ?? .infinity
                d0 = (d0 < d8) ? d0 : d8
                d8 = (d9 <= d0) ? d0 : d9
                return d8
            }
        } else if let d9 = self.maxDepth {
            // <+484>
            var d0 = copy_1.depth ?? -.infinity
            d0 = (d8 <= d0) ? d0 : d8
            d8 = (d0 < d9) ? d0 : d9
            return d8
        } else {
            return d8
        }
    }
    
    package func depthPlacement(of proxy: LayoutProxy, in context: PlacementContext3D) -> DepthPlacement {
        /*
         self -> x20 -> x27
         proxy -> x0 -> x29 - 0x88
         context -> x1 -> x20
         */
        // <+384>
        // x19
        let proposed = _ProposedSize3D(context.size)
        // x26
        let dimensions_1 = ViewDimensions3D(
            guideComputer: .defaultValue,
            size: context.size,
            proposal: context.proposedSize
        )
        // x24
        let dimensions_2 = proxy.dimensions3D(in: proposed)
        var d8 = self.alignment.depthKey.id.defaultValue(in: dimensions_1)
        let d0 = dimensions_2[self.alignment]
        d8 = d8 - d0
        // x29 - 0x78
        let placement = DepthPlacement(proposal: proposed.depth, offset: d8)
        return placement
    }
    
    package func depthOffered(to: LayoutProxy, for size: _ProposedSize3D, context: SizeAndSpacingContext) -> CGFloat? {
        if let minDepth {
            return minDepth
        } else {
            return size.depth
        }
    }
}

fileprivate protocol FrameDepthLayout : UnaryDepthLayout {
}

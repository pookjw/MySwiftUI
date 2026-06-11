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
            os_log(
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

fileprivate protocol FrameDepthLayout : UnaryDepthLayout {
}

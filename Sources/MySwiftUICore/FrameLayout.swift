// 73C64038119BBD0A6D8557B14379A404
public import CoreGraphics
public import os.log

extension View {
    @inlinable nonisolated public func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        return modifier(
            _FrameLayout(width: width, height: height, alignment: alignment))
    }
    
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @inlinable nonisolated public func frame() -> some View {
        return frame(width: nil, height: nil, alignment: .center)
    }
}

@frozen public struct _FrameLayout {
    internal let width: CGFloat?
    internal let height: CGFloat?
    internal let alignment: Alignment
    
    @usableFromInline
    package init(width: CGFloat?, height: CGFloat?, alignment: Alignment) {
        /*
         width -> x0/x1 -> x24/x22
         height -> x2/x3 -> x23/x25
         alignment -> x4/x5 -> x20/x19
         return pointer -> x8 -> x21
         */
        if isLinkedOnOrAfter(.v2) {
            // <+176>
            let flag: Bool
            if let width, (width < 0 || !width.isFinite) {
                flag = true
            } else if let height, (height < 0 || !height.isFinite) {
                flag = true
            } else {
                flag = false
            }
            
            if flag {
                unsafe os_log(.fault, log: .runtimeIssuesLog, "Invalid frame dimension (negative or non-finite).")
            }
        }
        
        // <+400>
        self.width = width
        self.height = height
        self.alignment = alignment
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

extension _FrameLayout : Animatable {}
extension _FrameLayout : ViewModifier {}
extension _FrameLayout : Sendable {}
extension _FrameLayout : BitwiseCopyable {}

extension _FrameLayout : UnaryLayout {
    func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        /*
         context.owner -> w21
         context.$environment -> w22
         child.context -> w24
         child.attributes.layoutComputer -> w25
         child.attributes.traitsList -> d8
         */
        if !isLinkedOnOrAfter(.v3) || child.requiresSpacingProjection {
            // <+204>
            return child.spacing()
        } else {
            // <+380>
            // x19
            var spacing = child.spacing()
            // w23
            var edge = Edge.Set()
            if self.height != nil {
                edge.formUnion(.vertical)
            }
            if self.width != nil {
                edge.formUnion(.horizontal)
            }
            
            // sp + 0x60
            let layoutDirection = context.layoutDirection
            // sp + 0x18
            let absoluteEdge = AbsoluteEdge.Set(edge, layoutDirection: layoutDirection)
            
            spacing.reset(absoluteEdge)
            return spacing
        }
    }
    
    func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
        var childProposal = context.proposedSize
        if let width {
            childProposal.width = width
        }
        if let height {
            childProposal.height = height
        }
        
        return self.commonPlacement(of: proxy, in: context, childProposal: childProposal)
    }
    
    func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        if let width, let height {
            return CGSize(width: width, height: height)
        }
        
        // <+96>
        var size = size
        if let width {
            size.width = width
        }
        if let height {
            size.height = height
        }
        
        var result = child.size(in: size)
        if let width {
            result.width = width
        }
        if let height {
            result.height = height
        }
        
        return result
    }
    
    func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
}

extension _FrameLayout : FrameLayoutCommon {
    func commonPlacement(
        of proxy: LayoutProxy,
        in context: PlacementContext,
        childProposal: _ProposedSize
    ) -> _Placement {
        /*
         proxy -> x0 -> x28
         context -> x1/x2 -> x23/x22
         childProposal -> x3/w4/x5/w6 -> sp + 0x10 / sp + 0x1c / sp + 0x20 / sp + 0x2c
         return pointer -> x8 -> x21
         */
        let alignment = self.alignment
        let size = context.size
        var d10 = size.width
        var d9 = size.height
        var d8 = d10
        let d12 = d9
        
        // x27
        let defaultComputer = LayoutComputer.defaultValue
        // sp + 0x58
        // x28/x25/d13/d14/d15/d11
        let dimensions = proxy.dimensions(in: childProposal)
        let horizontalKey = alignment.horizontal.key
        let verticalKey = alignment.vertical.key
        
        var d0 = horizontalKey.id.defaultValue(
            in: ViewDimensions(
                guideComputer: defaultComputer,
                size: ViewSize(
                    CGSize(
                        width: d8,
                        height: d12
                    ),
                    proposal: _ProposedSize(
                        width: d10,
                        height: d9
                    )
                )
            )
        )
        let d1 = d8
        d8 = d0
        
        d0 = verticalKey.id.defaultValue(
            in: ViewDimensions(
                guideComputer: defaultComputer,
                size: ViewSize(
                    CGSize(
                        width: d1,
                        height: d12
                    ),
                    proposal: _ProposedSize(
                        width: d10,
                        height: d9
                    )
                )
            )
        )
        d9 = d0
        
        d0 = dimensions[horizontalKey]
        d10 = d8 - d0
        
        d0 = dimensions[verticalKey]
        d8 = d0
        d0 = d9 - d8
        
        return _Placement(
            proposedSize: childProposal,
            anchoring: .zero,
            at: CGPoint(x: d10, y: d0)
        )
    }
}

fileprivate protocol FrameLayoutCommon {
    func commonPlacement(of proxy: LayoutProxy, in context: PlacementContext, childProposal: _ProposedSize) -> _Placement
}

@frozen public struct _FlexFrameLayout {
    internal let minWidth: CGFloat? // 0x0
    internal let idealWidth: CGFloat? // 0x10
    internal let maxWidth: CGFloat? // 0x20
    internal let minHeight: CGFloat? // 0x30
    internal let idealHeight: CGFloat? // 0x40
    internal let maxHeight: CGFloat? // 0x50
    internal let alignment: Alignment // 0x60
    
    @usableFromInline
    package init(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment) {
        if var minWidth {
            if minWidth <= 0 {
                minWidth = 0
            }
            self.minWidth = minWidth
        } else {
            self.minWidth = minWidth
        }
        
        // <+76>
        if let idealWidth {
            let d0 = (self.minWidth ?? 0)
            self.idealWidth = (d0 >= idealWidth) ? d0 : idealWidth
        } else {
            self.idealWidth = idealWidth
        }
        
        // <+128>
        if let maxWidth {
            let d2 = (self.idealWidth ?? 0)
            self.maxWidth = (d2 >= maxWidth) ? d2 : maxWidth
        } else {
            self.maxWidth = maxWidth
        }
        
        // <+200>
        if var minHeight {
            if minHeight <= 0 {
                minHeight = 0
            }
            self.minHeight = minHeight
        } else {
            self.minHeight = minHeight
        }
        
        // <+240>
        if let idealHeight {
            let d2 = (self.minHeight ?? 0)
            self.idealHeight = (d2 >= idealHeight) ? d2 : idealHeight
        } else {
            self.idealHeight = idealHeight
        }
        
        // <+300>
        if let maxHeight {
            let d3 = (self.idealHeight ?? 0)
            self.maxHeight = (d3 >= maxHeight) ? d3 : maxHeight
        } else {
            self.maxHeight = maxHeight
        }
        
        // <+364>
        var d1 = minWidth ?? 0
        let w12: Bool
        if (idealWidth != nil) || (maxWidth != nil) {
            // <+436>
            var d2 = idealWidth ?? maxWidth!
            if d1 <= d2 {
                // <+916>
                d2 = idealWidth ?? 0
                
                if let d3 = maxWidth {
                    // <+948>
                    if d2 <= d3 {
                        // <+412>
                        w12 = (d1 == .infinity)
                    } else {
                        // <+456>
                        w12 = true
                    }
                } else {
                    // <+1012>
                    if d2.isNaN {
                        w12 = true
                    } else {
                        w12 = (d1 == .infinity)
                    }
                }
            } else {
                w12 = true
            }
            
            // <+460>
        } else {
            // <+404>
            w12 = d1.isNaN || (d1 == .infinity)
            // <+460>
        }
        
        // <+460>
        // w12 -> sp + 0x4
        d1 = 0
        let d0 = minHeight ?? d1
        let w24: Bool
        if (idealHeight != nil) || (maxHeight != nil) {
            // <+552>
            d1 = idealHeight ?? maxHeight!
            if d0 <= d1 {
                // <+964>
                d1 = idealHeight ?? 0
                
                if let d2 = maxHeight {
                    if d1 <= d2 {
                        // <+524>
                        w24 = (d0 == .infinity)
                    } else {
                        // <+572>
                        w24 = true
                    }
                } else {
                    // <+1024>
                    if d1.isNaN {
                        w24 = true
                    } else {
                        w24 = (d0 == .infinity)
                    }
                }
            } else {
                w24 = true
            }
        } else {
            // <+516>
            w24 = d0.isNaN || (d0 == .infinity)
        }
        
        // <+580>
        if isLinkedOnOrAfter(.v3) && (w12 || w24) {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Invalid frame dimension (negative or non-finite).")
        }
        
        self.alignment = alignment
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = Never
}

extension View {
    @inlinable nonisolated public func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        func areInNondecreasingOrder(
            _ min: CGFloat?, _ ideal: CGFloat?, _ max: CGFloat?
        ) -> Bool {
            let min = min ?? -.infinity
            let ideal = ideal ?? min
            let max = max ?? ideal
            return min <= ideal && ideal <= max
        }
        
        if !areInNondecreasingOrder(minWidth, idealWidth, maxWidth)
            || !areInNondecreasingOrder(minHeight, idealHeight, maxHeight)
        {
            unsafe os_log(
                .fault, log: Log.runtimeIssuesLog,
                "Contradictory frame constraints specified.")
        }
        
        return modifier(
            _FlexFrameLayout(
                minWidth: minWidth,
                idealWidth: idealWidth, maxWidth: maxWidth,
                minHeight: minHeight,
                idealHeight: idealHeight, maxHeight: maxHeight,
                alignment: alignment))
    }
}

extension _FlexFrameLayout : Animatable {}
extension _FlexFrameLayout : ViewModifier {}
extension _FlexFrameLayout : Sendable {}
extension _FlexFrameLayout : BitwiseCopyable {}

extension _FlexFrameLayout : UnaryLayout {
    typealias PlacementContextType = PlacementContext
    
    func spacing(in context: SizeAndSpacingContext, child: LayoutProxy) -> Spacing {
        assertUnimplemented()
    }
    
    func placement(of proxy: LayoutProxy, in context: PlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    func sizeThatFits(in size: _ProposedSize, context: SizeAndSpacingContext, child: LayoutProxy) -> CGSize {
        assertUnimplemented()
    }
    
    func layoutPriority(child: LayoutProxy) -> Double {
        assertUnimplemented()
    }
    
    func ignoresAutomaticPadding(child: LayoutProxy) -> Bool {
        assertUnimplemented()
    }
}

extension _FlexFrameLayout : FrameLayoutCommon {
    func commonPlacement(of proxy: LayoutProxy, in context: PlacementContext, childProposal: _ProposedSize) -> _Placement {
        assertUnimplemented()
    }
}

extension _FlexFrameLayout : MultiViewModifier {}
extension _FlexFrameLayout : PrimitiveViewModifier {}

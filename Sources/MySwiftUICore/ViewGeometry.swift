internal import AttributeGraph
internal import CoreGraphics

struct ViewGeometry {
    var origin: CGPoint
    var dimensions: ViewDimensions
    
    mutating func finalizeLayoutDirection(_ layoutDirection: LayoutDirection, parentSize: CGSize) {
        guard layoutDirection == .rightToLeft else {
            return
        }
        
        origin.x = (parentSize.width - frame.maxX)
    }
    
    var frame: CGRect {
        return CGRect(origin: origin, size: dimensions.size.value)
    }
}

struct RootGeometry: Rule, AsyncAttribute {
    @OptionalAttribute var layoutDirection: LayoutDirection?
    @Attribute private var proposedSize: ViewSize
    @OptionalAttribute private var safeAreaInsets: _SafeAreaInsetsModifier?
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    init(
        layoutDirection: OptionalAttribute<LayoutDirection> = OptionalAttribute(),
        proposedSize: Attribute<ViewSize>,
        safeAreaInsets: OptionalAttribute<_SafeAreaInsetsModifier> = OptionalAttribute(),
        childLayoutComputer: OptionalAttribute<LayoutComputer> = OptionalAttribute()
    ) {
        self._layoutDirection = layoutDirection
        self._proposedSize = proposedSize
        self._safeAreaInsets = safeAreaInsets
        self._childLayoutComputer = childLayoutComputer
    }
    
    var value: ViewGeometry {
        /*
         return pointer = x19
         w26 = AGAttributeNil
         */
        // w22
        let layoutDirectionAttribute = $layoutDirection
        // w21
        let proposedSizeAttribute = $proposedSize
        // w23
        let safeAreaInsetsAttribute = $safeAreaInsets
        // w0
        let childLayoutComputerAttribute = $childLayoutComputer
        let childLayoutComputer = childLayoutComputerAttribute?.value ?? LayoutComputer.defaultValue
        
        // <+128>
        // d8/d9/d4/d5
        var insets = EdgeInsets.zero
        if
            let safeAreaInsets = safeAreaInsetsAttribute?.value,
            !safeAreaInsets.elements.isEmpty
        {
            if safeAreaInsets.elements.count != 1 {
                for element in safeAreaInsets.elements {
                    if let cornerInsets = element.cornerInsets {
                        insets.top += cornerInsets.topLeading.width + cornerInsets.bottomTrailing.width
                        insets.leading += cornerInsets.topLeading.height + cornerInsets.bottomTrailing.height
                        insets.trailing += cornerInsets.topTrailing.width + cornerInsets.bottomLeading.width
                        insets.bottom += cornerInsets.topTrailing.height + cornerInsets.bottomLeading.height
                        fatalError("cornerInsets 값을 제대로 읽어오는지 검증 필요")
                    }
                }
            }
            
            for element in safeAreaInsets.elements {
                insets.top += element.insets.top
                insets.leading += element.insets.leading
                insets.bottom += element.insets.bottom
                insets.trailing += element.insets.trailing
            }
            
            if let layoutDirection = layoutDirectionAttribute?.value {
                insets.xFlipIfRightToLeft { return layoutDirection }
            }
        }
        
        // <+388>
        let proposedSize = proposedSizeAttribute.value
        // d11/d12, sp + 0x30
        let proposal = proposedSize.value.inset(by: insets)
        // d9/d10
        let fittingSize = childLayoutComputer.sizeThatFits(_ProposedSize(width: proposal.width, height: proposal.height))
        var origin = CGPoint(x: insets.leading, y: insets.top)
        
        if ViewGraph.current.centersRootView {
            // <+644>
            let size = (proposal - fittingSize) * 0.5
            origin += size
        }
        
        // <+680>
        var result = ViewGeometry(
            origin: origin,
            dimensions: ViewDimensions(
                guideComputer: childLayoutComputer,
                size: ViewSize(fittingSize, proposal: _ProposedSize(proposal))
            )
        )
        
        if let layoutDirection = layoutDirectionAttribute?.value {
            result.finalizeLayoutDirection(layoutDirection, parentSize: fittingSize)
        }
        
        return result
    }
}

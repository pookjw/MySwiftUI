#warning("TODO")
internal import AttributeGraph
internal import CoreGraphics

struct ViewGeometry {
    var origin: CGPoint
    var dimensions: ViewDimensions
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
        
        let proposedSize = proposedSizeAttribute.value
        let newSize = proposedSize.value.inset(by: insets)
        
        // <+452>
        fatalError("TODO")
    }
}

public struct ViewDimensions {
    let guideComputer: LayoutComputer
    var size: ViewSize
}

extension Attribute where T == ViewGeometry {
    func origin() -> Attribute<CGPoint> {
        return self[keyPath: \.origin]
    }
    
    func size() -> Attribute<ViewSize> {
        return self[keyPath: \.dimensions.size]
    }
}

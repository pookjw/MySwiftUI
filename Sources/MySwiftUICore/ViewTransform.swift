#warning("TODO")
private import CoreGraphics
internal import AttributeGraph
package import Spatial

package struct ViewTransform {
    private var head: AnyElement?
    private var spaces: CoordinateSpaceNode?
    private var positionAdjustment: CGSize
    private var pendingTranslation: CGSize
    private(set) var depth: ViewDepth
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
        self.depth = ViewDepth()
    }
    
    package mutating func appendAffineTransform3D(_: AffineTransform3D, inverse: Bool) {
        fatalError("TODO")
    }
}

fileprivate class AnyElement {
    var next: AnyElement?
    let depth: Int
    
    init() {
        fatalError("TODO")
    }
}

fileprivate class CoordinateSpaceNode {
    var next: CoordinateSpaceNode?
    var space: CoordinateSpace
    let depth: Int
    
    init() {
        fatalError("TODO")
    }
}

struct RootDepthTransform: Rule {
    @Attribute private var transform: ViewTransform
    @OptionalAttribute var layoutDirection: LayoutDirection?
    @Attribute private var proposedSize: ViewSize
    @OptionalAttribute private var safeAreaInsets: _SafeAreaInsetsModifier?
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    init(
        transform: Attribute<ViewTransform>,
        layoutDirection: OptionalAttribute<LayoutDirection>,
        proposedSize: Attribute<ViewSize>,
        safeAreaInsets: OptionalAttribute<_SafeAreaInsetsModifier>,
        childLayoutComputer: OptionalAttribute<LayoutComputer>
    ) {
        self._transform = transform
        self._layoutDirection = layoutDirection
        self._proposedSize = proposedSize
        self._safeAreaInsets = safeAreaInsets
        self._childLayoutComputer = childLayoutComputer
    }
    
    var value: ViewTransform {
        // w25 = AGAttributeNil
        let childLayoutComputer = childLayoutComputer ?? .defaultValue
        // <+124>
        
        var insets = EdgeInsets.zero
        if
            let safeAreaInsets = self.safeAreaInsets,
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
            
            if let layoutDirection = layoutDirection {
                insets.xFlipIfRightToLeft { return layoutDirection }
            }
        }
        
        // <+400>
        let proposedSize = proposedSize
        let size = proposedSize.value.inset(by: insets)
        let transform = transform
        
        fatalError("TODO")
    }
}

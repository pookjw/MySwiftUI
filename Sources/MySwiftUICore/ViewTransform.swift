#warning("TODO")
private import CoreGraphics
internal import AttributeGraph

package struct ViewTransform {
    private var head: AnyElement?
    private var spaces: CoordinateSpaceNode?
    private var positionAdjustment: CGSize
    private var pendingTranslation: CGSize
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
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
    var value: ViewTransform {
        fatalError("TODO")
    }
    
    @Attribute private var transform: ViewTransform
    @OptionalAttribute private var layoutDirection: LayoutDirection?
    @Attribute private var proposedSize: ViewSize
    @OptionalAttribute private var safeAreaInsets: _SafeAreaInsetsModifier?
    @OptionalAttribute private var childLayoutComputer: LayoutComputer?
    
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
}

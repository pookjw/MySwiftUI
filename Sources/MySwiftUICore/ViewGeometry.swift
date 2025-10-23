#warning("TODO")
internal import AttributeGraph
internal import CoreGraphics

struct ViewGeometry {
    var origin: CGPoint
    var dimensions: ViewDimensions
}

struct RootGeometry: Rule {
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

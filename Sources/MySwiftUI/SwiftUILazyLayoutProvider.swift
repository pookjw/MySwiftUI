internal import MySwiftUICore
internal import AttributeGraph

struct SwiftUILazyLayoutProvider : LazyLayoutProvider {
    static func updateAccessibilityOutputs(_ outputs: inout _ViewOutputs, inputs: _ViewInputs, placedSubviews: Attribute<[_LazyLayout_PlacedSubview]>, accessibilityRole: AccessibilityLayoutRole?) {
        assertUnimplemented()
    }
}

@_spi(Internal) internal import MySwiftUICore

class ScrollEdgeEffectTagModifierDefinition : PlatformScrollEdgeEffectTagDefinition {
    override class var modifier : any PlatformScrollEdgeEffectTagModifier.Type {
        assertUnimplemented()
    }
}

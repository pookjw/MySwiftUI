@_spi(Internal) internal import MySwiftUICore

final class UIKitPlatformItemsDefinition : PlatformItemsDefinition {
    override class var system: PlatformSystemDefinition {
        assertUnimplemented()
    }
}

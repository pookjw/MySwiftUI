@_spi(Internal) package import MySwiftUICore

package final class UIKitPlatformGlassDefinition : PlatformGlassDefinition {
    override package class var system: PlatformSystemDefinition {
        assertUnimplemented()
    }
    
    override package class func resolvedGlass(_ glass: _Glass, environment: EnvironmentValues) -> _Glass.Resolved? {
        assertUnimplemented()
    }
}

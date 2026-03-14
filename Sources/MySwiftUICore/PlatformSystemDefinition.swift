internal import _MySwiftUIShims

@_spi(Internal)
public struct PlatformSystemDefinition: Hashable {
    public static var uiKit: PlatformSystemDefinition { PlatformSystemDefinition(base: .uiKit) }
    public static var appKit: PlatformSystemDefinition { PlatformSystemDefinition(base: .appKit) }
    
    var base: CoreSystem
}

@_spi(Internal) internal import MySwiftUICore

final class SwiftUIPlatformProvidersDefinition : CorePlatformProvidersDefinition {
    override class func updateProviders(_ providers: inout CorePlatformProviders) {
        providers.defaultAccentColor = SwiftUIDefaultAccentColorProvider.self
        providers.cuiNamedColor = KitCoreUINamedColorProvider.self
        providers.accessibilityTextAttributeResolver = SwiftUIAccessibilityTextResolver.self
        providers.bridgedEnvironment = UITraitBridgedEnvironmentResolver.self
        providers.resolvedText = SwiftUIResolvedTextProvider.self
        providers.gestureConstants = SwiftUIGestureConstantsProvider.self
        providers.lazyContainerInputs = SwiftUILazyContainerInputsProvider.self
        providers.lazyLayout = SwiftUILazyLayoutProvider.self
    }
}

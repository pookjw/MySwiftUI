// C648E6A51A5817691B7DBFA00A618C21
internal import _MySwiftUIShims

@_spi(Internal) open class CorePlatformProvidersDefinition {
    static var providers: CorePlatformProviders {
        guard self != CorePlatformProvidersDefinition.self else {
            return CorePlatformProviders(
                defaultAccentColor: nil,
                cuiNamedColor: nil,
                resolvedText: nil,
                accessibilityTextAttributeResolver: nil,
                bridgedEnvironment: nil,
                fallbackFont: nil,
                layerStackBitmap: nil,
                gestureConstants: nil,
                lazyContainerInputs: nil,
                lazyLayout: nil
            )
        }
        
        if unsafe CorePlatformProvidersDefinition.uiKitProviders == nil {
            var providers = CorePlatformProviders(
                defaultAccentColor: nil,
                cuiNamedColor: nil,
                resolvedText: nil,
                accessibilityTextAttributeResolver: nil,
                bridgedEnvironment: nil,
                fallbackFont: nil,
                layerStackBitmap: nil,
                gestureConstants: nil,
                lazyContainerInputs: nil,
                lazyLayout: nil
            )
            
            Self.updateProviders(&providers)
            
            unsafe CorePlatformProvidersDefinition.uiKitProviders = providers
        }
        
        return unsafe CorePlatformProvidersDefinition.uiKitProviders!
    }
    
    fileprivate static nonisolated(unsafe) var uiKitProviders : CorePlatformProviders?
    
    init() {}
    
    open class func updateProviders(_ providers: inout CorePlatformProviders) {
        // noop
    }
}

@_spi(Internal) public struct CorePlatformProviders : @unchecked Sendable {
    package var defaultAccentColor: (any DefaultAccentColorProvider.Type)?
    package var cuiNamedColor: (any CoreUINamedColorProvider.Type)?
    package var resolvedText: (any ResolvedTextProvider.Type)?
    package var accessibilityTextAttributeResolver: (any AccessibilityTextAttributeResolver.Type)?
    package var bridgedEnvironment: (any BridgedEnvironmentResolver.Type)?
    package var fallbackFont: (any FallbackFontProvider.Type)?
    package var layerStackBitmap: (any LayerStackBitmapProvider.Type)?
    package var gestureConstants: (any GestureConstantsProvider.Type)?
    package var lazyContainerInputs: (any LazyContainerInputsProvider.Type)?
    package var lazyLayout: (any LazyLayoutProvider.Type)?
}

extension EnvironmentValues {
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return self[EnvironmentValues.CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            self[EnvironmentValues.CorePlatfromProvidersDefinitionKey.self] = newValue
        }
    }
    
    var fallbackFontProvider: (any FallbackFontProvider.Type) {
        let provider = self[EnvironmentValues.CorePlatfromProvidersDefinitionKey.self]
        return provider.providers.fallbackFont ?? DefaultFallbackFontProvider.self
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey : EnvironmentKey {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

extension _GraphInputs {
    package var platformSystem: PlatformSystemDefinition {
        get {
            return self[PlatformSystemKey.self]
        }
        set {
            self[PlatformSystemKey.self] = newValue
        }
    }
    
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return self[_GraphInputs.CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            self[_GraphInputs.CorePlatfromProvidersDefinitionKey.self] = newValue
        }
    }
    
    fileprivate struct PlatformSystemKey : GraphInput {
        static var defaultValue: PlatformSystemDefinition {
            return .uiKit
        }
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey : GraphInput {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

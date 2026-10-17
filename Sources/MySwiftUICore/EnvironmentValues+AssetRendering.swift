extension EnvironmentValues {
    package var viewGraphAssetCatalogConfiguration: ViewGraphHost.AssetCatalogConfiguration {
        get {
            return self[AssetCatalogConfigurationKey.self]
        }
        set {
            self[AssetCatalogConfigurationKey.self] = newValue
        }
    }
    
    package var viewGraphRenderingRootView: AnyObject? {
        get {
            return self[RenderingRootViewKey.self].base
        }
        set {
            self[RenderingRootViewKey.self] = WeakBox(newValue)
        }
    } 
}

fileprivate struct AssetCatalogConfigurationKey : EnvironmentKey {
    static var defaultValue: ViewGraphHost.AssetCatalogConfiguration {
        return ViewGraphHost.AssetCatalogConfiguration(referenceBounds: .zero, pointsPerInch: 0, preferredArtworkSubtype: 1)
    }
}

fileprivate struct RenderingRootViewKey : EnvironmentKey {
    static var defaultValue: WeakBox<AnyObject> {
        return WeakBox(nil)
    }
}

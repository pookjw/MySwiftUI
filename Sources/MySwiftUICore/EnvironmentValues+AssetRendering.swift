internal import CoreGraphics

extension EnvironmentValues {
    package var viewGraphAssetCatalogConfiguration: ViewGraphHost.AssetCatalogConfiguration {
        get {
            return self[AssetCatalogConfigurationKey.self] ?? ViewGraphHost.AssetCatalogConfiguration(referenceBounds: CGRect(x: 0, y: 0, width: 100, height: 100), pointsPerInch: 0, preferredArtworkSubtype: 0)
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
    static var defaultValue: ViewGraphHost.AssetCatalogConfiguration? {
        return nil
    }
}

fileprivate struct RenderingRootViewKey : EnvironmentKey {
    static var defaultValue: WeakBox<AnyObject> {
        return WeakBox(nil)
    }
}

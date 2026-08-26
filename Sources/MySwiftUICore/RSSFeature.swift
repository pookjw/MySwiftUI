package import FeatureFlags

package enum RSSFeature : Hashable, FeatureFlagsKey {
    case surfaceSnappingVerticalShadows
    
    package var domain: StaticString {
        return "RealitySystemSupport"
    }
    
    package var feature: StaticString {
        switch self {
        case .surfaceSnappingVerticalShadows:
            return "SurfaceSnappingVerticalShadows"
        }
    }
}

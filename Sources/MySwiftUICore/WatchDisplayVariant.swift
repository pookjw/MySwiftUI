enum WatchDisplayVariant {
    case h340
    case h390
    case h394
    case h448
    case h430
    case h484
    case h502
    case h446
    case h496
    case h514
}

extension EnvironmentValues {
    var watchDisplayVariant: WatchDisplayVariant {
        get {
            return self[EnvironmentValues.WatchDisplayVariantKey.self]
        }
        set {
            self[EnvironmentValues.WatchDisplayVariantKey.self] = newValue
        }
    }
    
    struct WatchDisplayVariantKey : EnvironmentKey {
        static var defaultValue: WatchDisplayVariant {
            return .h390
        }
    }
}

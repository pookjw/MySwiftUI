enum WatchDisplayVariant : Int, Hashable, Codable {
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

    init?(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .h340
        case 1:
            self = .h390
        case 2:
            self = .h394
        case 3:
            self = .h448
        case 4:
            self = .h430
        case 5:
            self = .h484
        case 6:
            self = .h502
        case 7:
            self = .h446
        case 8:
            self = .h496
        case 9:
            self = .h514
        default:
            self = .h390
        }
    }
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

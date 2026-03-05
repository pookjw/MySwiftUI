internal import MySwiftUICore

enum SurroundingsEffectKind: Equatable {
    case system(SystemTintLevel)
    case customUnresolvedColor(Color)
    case customDarkness(Float)
}

extension SurroundingsEffectKind {
    enum Resolved: Equatable {
        case system(SystemTintLevel)
        case customColor(Color.Resolved)
        case customDarkness(Float)
    }
}

enum SystemTintLevel: Hashable {
    case semiDark
    case dark
    case ultraDark
}

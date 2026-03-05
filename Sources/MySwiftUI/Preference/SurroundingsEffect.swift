internal import MySwiftUICore

enum SurroundingsEffectKind {
    case system(SystemTintLevel)
    case customUnresolvedColor(Color)
    case customDarkness(Float)
}

extension SurroundingsEffectKind {
    enum Resolved {
        case system(SystemTintLevel)
        case customColor(Color.Resolved)
        case customDarkness(Float)
    }
}

enum SystemTintLevel {
    case semiDark
    case dark
    case ultraDark
}

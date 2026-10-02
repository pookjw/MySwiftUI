@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct BackgroundProminence : Hashable, Sendable {
    private var guts: BackgroundProminence.Guts
    
    public static let standard = BackgroundProminence(guts: .standard)
    public static let increased = BackgroundProminence(guts: .increased)
}

extension BackgroundProminence {
    enum Guts : Hashable {
        case standard
        case increased
    }
    
    struct Key : EnvironmentKey {
        static var defaultValue: BackgroundProminence {
            return .standard
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension EnvironmentValues {
    public var backgroundProminence: BackgroundProminence {
        get {
            return self[BackgroundProminence.Key.self]
        }
        set {
            self[BackgroundProminence.Key.self] = newValue
        }
    }
}

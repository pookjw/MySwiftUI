#warning("TODO")

public enum ControlSize : CaseIterable, Sendable {
    case mini
    case small
    case regular
    @available(macOS 11.0, *)
    case large
    case extraLarge
    
    public static var allCases: [ControlSize] {
        return [.mini, .small, .regular, .large, .extraLarge]
    }
}

extension ControlSize: Comparable {
    public static func < (lhs: ControlSize, rhs: ControlSize) -> Bool {
        fatalError("TODO")
    }
}

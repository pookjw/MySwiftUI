#warning("TODO")

public struct MenuOrder: Hashable, Sendable {
    public static let automatic = MenuOrder(guts: .automatic)
    public static let priority = MenuOrder(guts: .priority)
    public static let fixed = MenuOrder(guts: .fixed)
    
    private let guts: MenuOrder.Guts
}

extension MenuOrder {
    enum Guts: Hashable {
        case automatic
        case fixed
        case priority
    }
}

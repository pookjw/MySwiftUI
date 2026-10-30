
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct MenuOrder : Hashable, Sendable {
    public static let automatic = MenuOrder(guts: .automatic)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let priority = MenuOrder(guts: .priority)
    public static let fixed = MenuOrder(guts: .fixed)
    
    private let guts: MenuOrder.Guts
}

extension MenuOrder {
    enum Guts : Hashable {
        case automatic
        case fixed
        case priority
    }
}

extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func menuOrder(_ order: MenuOrder) -> some View {
        assertUnimplemented()
    }
}

struct ScrollDecelerationRate : Equatable {
    private var role: ScrollDecelerationRate.Role
}

extension ScrollDecelerationRate {
    enum Role : Hashable {
        case automatic
        case viewAligned
        case fast
        case paging
        case standard
    }
}

struct ScrollDecelerationRate : Equatable {
    static var fast: ScrollDecelerationRate {
        return ScrollDecelerationRate(role: .fast)
    }
    
    static var standard: ScrollDecelerationRate {
        return ScrollDecelerationRate(role: .standard)
    }
    
    static var automatic: ScrollDecelerationRate {
        return ScrollDecelerationRate(role: .automatic)
    }
    
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

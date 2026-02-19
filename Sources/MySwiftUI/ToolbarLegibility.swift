struct ToolbarLegibility: Hashable {
    private(set) var role: ToolbarLegibility.Role
    
    static var standard: ToolbarLegibility {
        return ToolbarLegibility(role: .standard)
    }
    
    static var fullscreen: ToolbarLegibility {
        return ToolbarLegibility(role: .fullscreen)
    }
}

extension ToolbarLegibility {
    enum Role: Hashable {
        case unspecified
        case standard
        case fullscreen
    }
}

#warning("TODO")

public struct ToolbarPlacement {
    
}

extension ToolbarPlacement {
    enum Role: Hashable {
        case accessoryBar(AnyHashable)
        case navigationBar
        case windowToolbarItems
        case windowToolbar
        case bottomBar
        case keyboardBar
        case tabBar
        case bottomOrnament
    }
}

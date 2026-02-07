
public struct ToolbarPlacement {
    
}

extension ToolbarPlacement {
    enum Role: Hashable {
        case accessoryBar(AnyHashable)
        case navigationBar // 0
        case windowToolbarItems // 1
        case windowToolbar // 2
        case bottomBar // 3
        case keyboardBar // 4
        case tabBar // 5
        case bottomOrnament // 6
    }
}

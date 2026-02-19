internal import MySwiftUICore

struct ToolbarBackgroundVisibility: Equatable {
    private(set) var role: ToolbarBackgroundVisibility.Role
    
    static var automatic: ToolbarBackgroundVisibility {
        return ToolbarBackgroundVisibility(role: .automatic)
    }
    
    static var visible: ToolbarBackgroundVisibility {
        return ToolbarBackgroundVisibility(role: .visible)
    }
    
    static var visibleOnScroll: ToolbarBackgroundVisibility {
        return ToolbarBackgroundVisibility(role: .visibleOnScroll)
    }
    
    static var hidden: ToolbarBackgroundVisibility {
        return ToolbarBackgroundVisibility(role: .hidden)
    }
    
    init(_ visibility: Visibility) {
        fatalError("TODO")
    }
    
    @inline(__always)
    private init(role: ToolbarBackgroundVisibility.Role) {
        self.role = role
    }
}

extension ToolbarBackgroundVisibility {
    enum Role: Hashable {
        case automatic
        case visible
        case visibleOnScroll
        case hidden
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ToolbarPlacement: Hashable {
    private(set) var storage: ToolbarPlacement.Storage
    
    public static var automatic: ToolbarPlacement {
        return ToolbarPlacement(storage: .automatic)
    }
    
    static var _bottomBar: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.bottomBar))
    }
    
    @available(watchOS 10.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    public static var bottomBar: ToolbarPlacement {
        return ._bottomBar
    }
    
    static var keyboardBar: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.keyboardBar))
    }
    
    @available(macOS, unavailable)
    public static var navigationBar: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.navigationBar))
    }
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static var windowToolbar: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.windowToolbar))
    }
    
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static var tabBar: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.tabBar))
    }
    
    @backDeployed(before: macOS 14.0)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static func accessoryBar<ID>(id: ID) -> ToolbarPlacement where ID : Hashable {
        return ToolbarPlacement(storage: .role(.accessoryBar(AnyHashable(id))))
    }
    
    @available(macOS 14.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @usableFromInline
    internal static func backDeployable_accessoryBar<ID>(id: ID) -> ToolbarPlacement where ID : Hashable {
        return .accessoryBar(id: id)
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var bottomOrnament: ToolbarPlacement {
        return ToolbarPlacement(storage: .role(.bottomOrnament))
    }
}

@available(*, unavailable)
extension ToolbarPlacement : Sendable {
}

extension ToolbarPlacement {
    @available(iOS, unavailable)
    @available(macOS, introduced: 13.0, deprecated: 14.0, renamed: "accessoryBar")
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public init<ID>(id: ID) where ID : Hashable {
        fatalError("TODO")
    }
}

extension ToolbarPlacement {
    enum Storage: Hashable {
        case role(ToolbarPlacement.Role) // 0x0~0x20 -> 0, 0x28 -> case (0~6)
        case automatic // 0x0~0x20 -> 0, 0x28 -> 7
    }
    
    enum Role: Hashable, CaseIterable {
        static var allCases: [ToolbarPlacement.Role] {
            return [
                .navigationBar,
                .windowToolbar,
                .bottomBar,
                .keyboardBar,
                .tabBar,
                .bottomOrnament,
                .windowToolbarItems
            ]
        }
        
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

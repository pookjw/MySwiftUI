// 01524358DA8FEB8BCC0A94C08F00494A
private import MySwiftUICore

public struct SearchFieldPlacement: Sendable {
    private var role: SearchFieldPlacement.Role
    
    public static let automatic = SearchFieldPlacement(role: .automatic)
    
    @available(tvOS, unavailable)
    public static let toolbar = SearchFieldPlacement(role: .toolbar)
    
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @safe public internal(set) static nonisolated(unsafe) var toolbarPrincipal = SearchFieldPlacement(role: .toolbarPrincipal)
    
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var sidebar: SearchFieldPlacement {
        return SearchFieldPlacement(role: .sidebarList)
    }
    
    @available(iOS 15.0, watchOS 8.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    public static let navigationBarDrawer = SearchFieldPlacement(role: .navigationBarDrawer(.automatic))
    
    static var navigationColumn: SearchFieldPlacement {
        return SearchFieldPlacement(role: .navigationColumn)
    }
    
    @available(iOS 15.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static func navigationBarDrawer(displayMode: SearchFieldPlacement.NavigationBarDrawerDisplayMode) -> SearchFieldPlacement {
        return SearchFieldPlacement(
            role: .navigationBarDrawer(
                displayMode.mode
            )
        )
    }
    
    static var never: SearchFieldPlacement {
        return SearchFieldPlacement(role: .none)
    }
}

extension SearchFieldPlacement {
    enum Role: Equatable {
        case navigationBarDrawer(SearchFieldPlacement.DrawerDisplayMode) // 0/1
        case automatic // 2
        case toolbar // 3
        case toolbarPrincipal // 4
        case sidebarList // 5
        case navigationColumn // 6
        case none // 7
    }
    
    enum DrawerDisplayMode {
        case automatic
        case always
    }
    
    public struct NavigationBarDrawerDisplayMode {
        fileprivate private(set) var mode: SearchFieldPlacement.DrawerDisplayMode
        
        static var automatic: SearchFieldPlacement.NavigationBarDrawerDisplayMode {
            return SearchFieldPlacement.NavigationBarDrawerDisplayMode(mode: .automatic)
        }
        
        static var always: SearchFieldPlacement.NavigationBarDrawerDisplayMode {
            return SearchFieldPlacement.NavigationBarDrawerDisplayMode(mode: .always)
        }
    }
}

extension EnvironmentValues {
    var searchFieldPlacement: SearchFieldPlacement.Role {
        get {
            return self[SearchFieldPlacementKey.self]
        }
        set {
            self[SearchFieldPlacementKey.self] = newValue
        }
    }
}

fileprivate struct SearchFieldPlacementKey: EnvironmentKey {
    static var defaultValue: SearchFieldPlacement.Role {
        return .none
    }
}

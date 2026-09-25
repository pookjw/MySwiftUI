// 01524358DA8FEB8BCC0A94C08F00494A
public import MySwiftUICore

public struct SearchFieldPlacement : Sendable {
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

@available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *)
public struct SearchScopeActivation {
    private var role: SearchScopeActivation.Role
    
    public static var automatic: SearchScopeActivation {
        return SearchScopeActivation(role: .automatic)
    }
    
    @available(tvOS, unavailable)
    public static var onTextEntry: SearchScopeActivation {
        return SearchScopeActivation(role: .onTextEntry)
    }
    
    @available(tvOS, unavailable)
    public static var onSearchPresentation: SearchScopeActivation {
        return SearchScopeActivation(role: .onSearchPresentation)
    }
}

@available(*, unavailable)
extension SearchScopeActivation : Sendable {
}

extension SearchScopeActivation {
    enum Role {
        case custom(Bool) // 0/1
        case automatic // 2
        case onTextEntry // 3
        case onSearchPresentation // 4
    }
}

extension View {
    @available(iOS 16.4, macOS 13.3, tvOS 16.4, *)
    @available(watchOS, unavailable)
    nonisolated public func searchScopes<V, S>(_ scope: Binding<V>, activation: SearchScopeActivation, @ViewBuilder _ scopes: () -> S) -> some View where V : Hashable, S : View {
        assertUnimplemented()
    }
}

extension SearchFieldPlacement {
    enum Role : Equatable {
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
        
        public static var automatic: SearchFieldPlacement.NavigationBarDrawerDisplayMode {
            return SearchFieldPlacement.NavigationBarDrawerDisplayMode(mode: .automatic)
        }
        
        public static var always: SearchFieldPlacement.NavigationBarDrawerDisplayMode {
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
    
    var searchFieldToolbarItemPlacement: ToolbarItemPlacement? {
        get {
            return self[SearchFieldToolbarItemPlacementKey.self]
        }
        set {
            self[SearchFieldToolbarItemPlacementKey.self] = newValue
        }
    }
    
    var searchStorage: SearchEnvironmentStorage? {
        get {
            return self[EnvironmentValues.__Key_searchStorage.self]
        }
        set {
            self[EnvironmentValues.__Key_searchStorage.self] = newValue
        }
    }
    
    // TODO: Entry macro
    fileprivate struct __Key_searchStorage : EnvironmentKey {
        static var defaultValue: SearchEnvironmentStorage? {
            return nil
        }
    }
    
    public internal(set) var isSearching: Bool {
        get {
            return self[EnvironmentValues.IsSearchingKey.self]
        }
        set {
            self[EnvironmentValues.IsSearchingKey.self] = newValue
        }
    }
    
    fileprivate struct IsSearchingKey : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
    
    var searchScopeActivation: SearchScopeActivation.Role {
        get {
            return self[SearchScopeActivationKey.self]
        }
        set {
            self[SearchScopeActivationKey.self] = newValue
        }
    }
    
    var searchFocusContext: SearchFocusContext? {
        get {
            return self[SearchFocusContextKey.self]
        }
        set {
            self[SearchFocusContextKey.self] = newValue
        }
    }
}

fileprivate struct SearchFieldPlacementKey : EnvironmentKey {
    static var defaultValue: SearchFieldPlacement.Role {
        return .none
    }
}

fileprivate struct SearchFieldToolbarItemPlacementKey : EnvironmentKey {
    static var defaultValue: ToolbarItemPlacement? {
        return nil
    }
}

fileprivate struct SearchScopeActivationKey : EnvironmentKey {
    static var defaultValue: SearchScopeActivation.Role {
        return .automatic
    }
}

fileprivate struct SearchFocusContextKey : EnvironmentKey {
    static var defaultValue: SearchFocusContext? {
        return nil
    }
}

final class SearchEnvironmentStorage {
    // TODO
}

struct SearchFocusContext {
    // TODO
}

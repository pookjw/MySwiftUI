// B0B7351D5E4C03F188ACDECF5D904C50
internal import MySwiftUICore

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct SearchToolbarBehavior: Hashable, Sendable {
    private(set) var role: SearchToolbarBehavior.Role
    
    public static var automatic: SearchToolbarBehavior {
        return SearchToolbarBehavior(role: .automatic)
    }
    
    static var expandsWhenPresented: SearchToolbarBehavior {
        return SearchToolbarBehavior(role: .minimize)
    }
    
    @available(iOS 26.0, visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var minimize: SearchToolbarBehavior {
        return SearchToolbarBehavior(role: .minimize)
    }
}

extension SearchToolbarBehavior {
    enum Role: Hashable {
        case automatic
        case minimize
    }
}

extension EnvironmentValues {
    var searchToolbarBehavior: SearchToolbarBehavior {
        get {
            return self[__Key_searchToolbarBehavior.self]
        }
        set {
            self[__Key_searchToolbarBehavior.self] = newValue
        }
    }
    
    // TODO: Entry macro
    fileprivate struct __Key_searchToolbarBehavior: EnvironmentKey {
        static var defaultValue: SearchToolbarBehavior {
            return .automatic
        }
    }
}

// E1AB356368AEADE0EB947F068159CCF0
public import MySwiftUICore

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ToolbarRole: Sendable {
    private(set) var role: ToolbarRole.Role
    
    public static var automatic: ToolbarRole {
        return ToolbarRole(role: .navigationStack)
    }
    
    @available(macOS, unavailable)
    public static var navigationStack: ToolbarRole {
        return ToolbarRole(role: .navigationStack)
    }
    
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var browser: ToolbarRole {
        return ToolbarRole(role: .browser)
    }
    
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var editor: ToolbarRole {
        return ToolbarRole(role: .editor)
    }
}

extension ToolbarRole {
    enum Role: Hashable {
        case navigationStack
        case browser
        case editor
    }
}

extension View {
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public nonisolated func toolbarRole(_ role: ToolbarRole) -> some View {
        fatalError("TODO")
    }
}

struct ToolbarRoleKey: HostPreferenceKey {
    static var defaultValue: ToolbarRole? {
        return nil
    }
    
    static func reduce(value: inout ToolbarRole?, nextValue: () -> ToolbarRole?) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    @inline(__always)
    var toolbarRole: ToolbarRole? {
        get {
            return self[EnvironmentValues.DefaultToolbarRoleKey.self]
        }
        set {
            self[EnvironmentValues.DefaultToolbarRoleKey.self] = newValue
        }
    }
    
    fileprivate struct DefaultToolbarRoleKey: EnvironmentKey {
        static var defaultValue: ToolbarRole? {
            return nil
        }
    }
}

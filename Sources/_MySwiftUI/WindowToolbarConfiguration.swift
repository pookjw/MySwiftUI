// 2E1763F29582B40676AFBCD6CC82217B
internal import MySwiftUICore

struct WindowToolbarConfiguration: Equatable {
    var titleMode: ToolbarTitleDisplayMode?
    var titleVisibility: Visibility?
    var labelStyle: ToolbarLabelStyle.Data?
}

extension EnvironmentValues {
    var windowToolbarConfiguration: WindowToolbarConfiguration {
        get {
            return self[EnvironmentValues.WindowToolbarConfigurationKey.self]
        }
        set {
            self[EnvironmentValues.WindowToolbarConfigurationKey.self] = newValue
        }
    }
    
    fileprivate struct WindowToolbarConfigurationKey: EnvironmentKey {
        static var defaultValue: WindowToolbarConfiguration {
            return WindowToolbarConfiguration()
        }
    }
}

internal import MySwiftUICore

class UIKitNavigationBridge {
    weak var host: ViewRendererHost?
    var hasSearch: Bool
    
    init() {
        fatalError("TODO")
    }
    
    final func update(environment: inout EnvironmentValues) {
        fatalError("TODO")
    }
    
    // TODO
}

final class NavigationBridge_PhoneTV: UIKitNavigationBridge {
    
}

struct IsSearchAllowedInput: ViewInputBoolFlag {
}

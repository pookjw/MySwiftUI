extension EnvironmentValues {
    package var materialColorRenderingMode: MaterialColorRenderingMode {
        get {
            return self[__Key_materialColorRenderingMode.self]
        }
        set {
            self[__Key_materialColorRenderingMode.self] = newValue
        }
    }
    
    #warning("TODO: Entry Macro")
    fileprivate struct __Key_materialColorRenderingMode: EnvironmentKey {
        static var defaultValue: MaterialColorRenderingMode {
            return .automatic
        }
    }
}

package struct MaterialColorRenderingMode: Equatable {
    package static var automatic: MaterialColorRenderingMode {
        return MaterialColorRenderingMode(role: .automatic)
    }
    
    package static var adaptiveSystemColors: MaterialColorRenderingMode {
        return MaterialColorRenderingMode(role: .adaptiveSystemColors)
    }
    
    package static var adaptiveAllColors: MaterialColorRenderingMode {
        return MaterialColorRenderingMode(role: .adaptiveAllColors)
    }
    
    private var role: MaterialColorRenderingMode.Role
}

extension MaterialColorRenderingMode: Hashable {
    package enum Role {
        case automatic
        case adaptiveSystemColors
        case adaptiveAllColors
    }
}

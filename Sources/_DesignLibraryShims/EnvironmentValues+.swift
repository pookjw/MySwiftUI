package import DesignLibrary
package import MySwiftUICore

extension EnvironmentValues {
    package var designIdiom: DesignIdiom {
        get {
            return self[__Key_designIdiom.self]
        }
        set {
            self[__Key_designIdiom.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key_designIdiom: EnvironmentKey {
        static var defaultValue: DesignIdiom {
            return .universal
        }
    }
}

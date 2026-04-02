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
    
    package var glassMaterialContainerStyle: GlassMaterialProvider.ResolvedStyle? {
        get {
            return self[__Key_glassMaterialContainerStyle.self]
        }
        set {
            self[__Key_glassMaterialContainerStyle.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key_designIdiom: EnvironmentKey {
        static var defaultValue: DesignIdiom {
            return .universal
        }
    }
    
    fileprivate struct __Key_glassMaterialContainerStyle: EnvironmentKey {
        static var defaultValue: GlassMaterialProvider.ResolvedStyle? {
            return nil
        }
    }
    
    package var glassMaterialForeground: Bool {
        get {
            return self[__Key_glassMaterialForeground.self]
        }
        set {
            self[__Key_glassMaterialForeground.self] = newValue
        }
    }
    
    fileprivate struct __Key_glassMaterialForeground: EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
    
    package var glassMaterialPocketContainer: GlassMaterialProvider.Pocket? {
        get {
            return self[__Key_glassMaterialPocketContainer.self]
        }
        set {
            self[__Key_glassMaterialPocketContainer.self] = newValue
        }
    }
    
    fileprivate struct __Key_glassMaterialPocketContainer: EnvironmentKey {
        static var defaultValue: GlassMaterialProvider.Pocket? {
            return nil
        }
    }
}

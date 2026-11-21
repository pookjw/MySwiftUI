// 44953956318F41C5365C38B8AC5FF331

extension _ViewInputs {
    package var accessibilityPreferenceProvider: (any PreferenceKey.Type)? {
        get {
            return self[_ViewInputs.PlatformAccessibilityPreferenceKey.self]
        }
        set {
            self[_ViewInputs.PlatformAccessibilityPreferenceKey.self] = newValue
        }
    }
    
    fileprivate struct PlatformAccessibilityPreferenceKey : ViewInput {
        static var defaultValue: (any PreferenceKey.Type)? {
            return nil
        }
    }
}

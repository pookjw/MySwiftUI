extension EnvironmentValues {
    package var accessibilitySettingsDefinition: PlatformSystemDefinition? {
        get {
            return self[AccessibilitySettingsDefinitionKey.self]
        }
        set {
            self[AccessibilitySettingsDefinitionKey.self] = newValue
        }
    }
}

fileprivate struct AccessibilitySettingsDefinitionKey: EnvironmentKey {
    static var defaultValue: PlatformSystemDefinition? {
        return nil
    }
}

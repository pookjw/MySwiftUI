extension EnvironmentValues {
    package var accessibilitySettingsDefinition: PlatformSystemDefinition? {
        get {
            // 다름
            fatalError()
        }
        set {
            // 다름
            fatalError()
        }
    }
}

fileprivate struct AccessibilitySettingsDefinitionKey: EnvironmentKey {
    static var defaultValue: PlatformSystemDefinition? {
        return nil
    }
}

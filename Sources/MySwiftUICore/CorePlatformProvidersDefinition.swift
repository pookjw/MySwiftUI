#warning("TODO")

@_spi(Internal) open class CorePlatformProvidersDefinition {
    
}

extension _GraphInputs {
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return unsafe self[CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            unsafe self[CorePlatfromProvidersDefinitionKey.self] = newValue
        }
        _modify {
            yield unsafe &self[CorePlatfromProvidersDefinitionKey.self]
        }
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey: @unsafe GraphInput {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

extension EnvironmentValues {
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return unsafe self[CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            unsafe self[CorePlatfromProvidersDefinitionKey.self] = newValue
        }
        _modify {
            yield unsafe &self[CorePlatfromProvidersDefinitionKey.self]
        }
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey: @unsafe EnvironmentKey {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

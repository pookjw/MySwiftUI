#warning("TODO")

@_spi(Internal) open class CorePlatformProvidersDefinition {
    
}

extension _GraphInputs {
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return self[CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            self[CorePlatfromProvidersDefinitionKey.self] = newValue
        }
        _modify {
            yield &self[CorePlatfromProvidersDefinitionKey.self]
        }
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey: GraphInput {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

extension EnvironmentValues {
    package var platformProvidersDefinition: CorePlatformProvidersDefinition.Type {
        get {
            return self[CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            self[CorePlatfromProvidersDefinitionKey.self] = newValue
        }
        _modify {
            yield &self[CorePlatfromProvidersDefinitionKey.self]
        }
    }
    
    fileprivate struct CorePlatfromProvidersDefinitionKey: EnvironmentKey {
        static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
    }
}

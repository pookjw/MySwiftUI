// C648E6A51A5817691B7DBFA00A618C21
package import _MySwiftUIShims

extension _GraphInputs {
    @inline(always) // 원래 없음
    var corePlatformProvidersDefinition: CorePlatformProvidersDefinition.Type {
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
    
    package var platformSystem: PlatformSystemDefinition {
        get {
            return self[PlatformSystemKey.self]
        }
        set {
            self[PlatformSystemKey.self] = newValue
        }
        _modify {
            yield &self[PlatformSystemKey.self]
        }
    }
}

// 원래 없음
extension EnvironmentValues {
    var corePlatformProvidersDefinition: CorePlatformProvidersDefinition.Type {
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
}

fileprivate struct CorePlatfromProvidersDefinitionKey : GraphInput, EnvironmentKey {
    static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
}

extension _GraphInputs {
    fileprivate struct PlatformSystemKey : GraphInput {
        static var defaultValue: PlatformSystemDefinition {
            return .uiKit
        }
    }
}

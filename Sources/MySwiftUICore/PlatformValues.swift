// C648E6A51A5817691B7DBFA00A618C21
internal import _MySwiftUIShims

// 원래 없음
extension _GraphInputs {
    var corePlatformProvidersDefinition: CorePlatformProvidersDefinition.Type {
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
    
    var platformSystem: MySwiftUICoreSystem {
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
            return unsafe self[CorePlatfromProvidersDefinitionKey.self]
        }
        set {
            unsafe self[CorePlatfromProvidersDefinitionKey.self] = newValue
        }
        _modify {
            yield unsafe &self[CorePlatfromProvidersDefinitionKey.self]
        }
    }
}

fileprivate struct CorePlatfromProvidersDefinitionKey: @unsafe GraphInput, @unsafe EnvironmentKey {
    static let defaultValue: CorePlatformProvidersDefinition.Type = CorePlatformProvidersDefinition.self
}

fileprivate struct PlatformSystemKey: GraphInput {
    static var defaultValue: MySwiftUICoreSystem {
        return .uiKit
    }
}

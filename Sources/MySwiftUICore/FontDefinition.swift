// C17A136ED11B3E0D21D21D182F3B80B2

struct FontDefinitionType : @unchecked Sendable {
    private(set) var base: (any FontDefinition.Type)
}

protocol FontDefinition {
    // TODO
}

enum DefaultFontDefinition : FontDefinition {
    // TODO
}

extension EnvironmentValues {
    var fontDefinition: (any FontDefinition.Type) {
        get {
            return self[FontDefinitionKey.self].base
        }
        set {
            self[FontDefinitionKey.self] = FontDefinitionType(base: newValue)
        }
    }
}

fileprivate struct FontDefinitionKey : EnvironmentKey {
    static let defaultValue = FontDefinitionType(base: DefaultFontDefinition.self)
}

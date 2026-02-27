public import Foundation

package struct TypesettingConfiguration: Equatable {
    package static func == (lhs: TypesettingConfiguration, rhs: TypesettingConfiguration) -> Bool {
        fatalError("TODO")
    }
    
    private var language: TypesettingLanguage
    private var languageAwareLineHeightRatio: TypesettingLanguageAwareLineHeightRatio
}

struct TypesettingLanguageAwareLineHeightRatio {
    private var storage: TypesettingLanguageAwareLineHeightRatio.Storage
}

extension TypesettingLanguageAwareLineHeightRatio {
    enum Storage {
        case custom(Double)
        case automatic
        case disable
        case legacy
    }
}

extension EnvironmentValues {
    package var typesettingConfiguration: TypesettingConfiguration {
        get {
            return self[TypesettingConfigurationKey.self]
        }
        set {
            self[TypesettingConfigurationKey.self] = newValue
        }
    }
}

package struct TypesettingConfigurationKey: BridgedEnvironmentKey {
    package static var defaultValue: TypesettingConfiguration {
        fatalError("TODO")
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct TypesettingLanguage: Sendable, Equatable {
    public static let automatic: TypesettingLanguage = {
        fatalError("TODO")
    }()
    
    public static func explicit(_ language: Locale.Language) -> TypesettingLanguage {
        fatalError("TODO")
    }
    
    public static func == (a: TypesettingLanguage, b: TypesettingLanguage) -> Bool {
        fatalError("TODO")
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public func typesettingLanguage(_ language: Locale.Language, isEnabled: Bool = true) -> some View {
        fatalError("TODO")
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public func typesettingLanguage(_ language: TypesettingLanguage, isEnabled: Bool = true) -> some View {
        fatalError("TODO")
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func typesettingLanguage(_ language: Locale.Language, isEnabled: Bool = true) -> Text {
        fatalError("TODO")
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func typesettingLanguage(_ language: TypesettingLanguage, isEnabled: Bool = true) -> Text {
        fatalError("TODO")
    }
}

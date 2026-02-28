public import Foundation

package struct TypesettingConfiguration: Equatable {
    package static func == (lhs: TypesettingConfiguration, rhs: TypesettingConfiguration) -> Bool {
        fatalError("TODO")
    }
    
    package var language: TypesettingLanguage
    var languageAwareLineHeightRatio: TypesettingLanguageAwareLineHeightRatio
}

struct TypesettingLanguageAwareLineHeightRatio {
    private var storage: TypesettingLanguageAwareLineHeightRatio.Storage
    
    static var automatic: TypesettingLanguageAwareLineHeightRatio {
        return TypesettingLanguageAwareLineHeightRatio(storage: .automatic)
    }
    
    static var disable: TypesettingLanguageAwareLineHeightRatio {
        return TypesettingLanguageAwareLineHeightRatio(storage: .disable)
    }
    
    static var legacy: TypesettingLanguageAwareLineHeightRatio {
        return TypesettingLanguageAwareLineHeightRatio(storage: .legacy)
    }
    
    static func custom(_ ratio: Double) -> TypesettingLanguageAwareLineHeightRatio {
        return TypesettingLanguageAwareLineHeightRatio(
            storage: .custom(max(1, max(0, ratio)))
        )
    }
}

extension TypesettingLanguageAwareLineHeightRatio {
    enum Storage {
        case custom(Double) // value, 0x0
        case automatic // 0x0, 0x1
        case disable // 0x1, 0x1
        case legacy // 0x2, 0x1
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
    package static let defaultValue = TypesettingConfiguration(language: .automatic, languageAwareLineHeightRatio: .automatic)
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct TypesettingLanguage: Sendable, Equatable {
    public static let automatic = TypesettingLanguage(storage: .automatic)
    
    public static func explicit(_ language: Locale.Language) -> TypesettingLanguage {
        fatalError("TODO")
    }
    
    public static func == (a: TypesettingLanguage, b: TypesettingLanguage) -> Bool {
        fatalError("TODO")
    }
    
    package var storage: TypesettingLanguage.Storage
}

extension TypesettingLanguage {
    package struct Flags: OptionSet {
        package var rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
    
    package enum Storage {
        case explicit(Locale.Language, TypesettingLanguage.Flags)
        case automatic
        case contentAware
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

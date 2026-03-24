// 8C53218A357EE528547B0855666BD2E5
public import Foundation
private import _MySwiftUIShims

@frozen public struct LocalizedStringKey: Equatable, ExpressibleByStringInterpolation {
    internal var key: String
    internal var hasFormatting: Bool = false
    private var arguments: [LocalizedStringKey.FormatArgument]
    
    public init(_ value: String) {
        assertUnimplemented()
    }
    
    @_semantics("swiftui.localized_string_key.init_literal")
    public init(stringLiteral value: String) {
        self.key = value
        self.arguments = []
    }
    
    @_semantics("swiftui.localized_string_key.init_interpolation")
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation) {
        assertUnimplemented()
    }
    
    @usableFromInline
    internal struct FormatArgument: Equatable {
        @usableFromInline
        internal static func == (lhs: LocalizedStringKey.FormatArgument, rhs: LocalizedStringKey.FormatArgument) -> Bool {
            assertUnimplemented()
        }
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        @_semantics("swiftui.localized.interpolation_init")
        public init(literalCapacity: Int, interpolationCount: Int) {
            assertUnimplemented()
        }
        
        @_semantics("swiftui.localized.appendLiteral")
        public mutating func appendLiteral(_ literal: String) {
            assertUnimplemented()
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ string: String) {
            assertUnimplemented()
        }
        
        @_alwaysEmitIntoClient
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ substring: Substring) {
            appendInterpolation(String(substring))
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject: ReferenceConvertible {
            assertUnimplemented()
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject: NSObject {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<F>(_ input: F.FormatInput, format: F) where F: FormatStyle, F.FormatInput: Equatable, F.FormatOutput == String {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<F>(_ input: F.FormatInput, format: F) where F: FormatStyle, F.FormatInput: Equatable, F.FormatOutput == AttributedString {
            assertUnimplemented()
        }
        
        @_transparent
        public mutating func appendInterpolation<T>(_ value: T) where T: _FormatSpecifiable {
            appendInterpolation(value, specifier: formatSpecifier(T.self))
        }
        
        @_semantics("swiftui.localized.appendInterpolation_param_specifier")
        public mutating func appendInterpolation<T>(_ value: T, specifier: String) where T: _FormatSpecifiable {
            assertUnimplemented()
        }
        
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ text: Text) {
            assertUnimplemented()
        }
        
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ attributedString: AttributedString) {
            assertUnimplemented()
        }
        
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
        @_alwaysEmitIntoClient
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ attributedSubstring: AttributedSubstring) {
            appendInterpolation(AttributedString(attributedSubstring))
        }
        
        @usableFromInline
        @available(*, deprecated, message: "Localized string interpolation produces an unlocalized, debug description for this type of value. Use a type supported by LocalizedStringKey.StringInterpolation or initialize a LocalizedStringResource instead with an interpolated value that conforms to CustomLocalizedStringResourceConvertible.")
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        internal mutating func appendInterpolation<T>(_ view: T) where T: View {
            assertUnimplemented()
        }
        
        @available(*, deprecated, message: "Localized string interpolation produces an unlocalized, debug description for this type of value. Use a type supported by LocalizedStringKey.StringInterpolation or initialize a LocalizedStringResource instead with an interpolated value that conforms to CustomLocalizedStringResourceConvertible.")
        @_alwaysEmitIntoClient
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        @_disfavoredOverload
        public mutating func appendInterpolation<T>(_ object: T) {
            appendInterpolation(String(describing: object))
        }
        
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        public typealias StringLiteralType = String
    }
    
    public static func == (a: LocalizedStringKey, b: LocalizedStringKey) -> Bool {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias ExtendedGraphemeClusterLiteralType = String
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias StringLiteralType = String
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias UnicodeScalarLiteralType = String
}

@available(*, unavailable)
extension LocalizedStringKey.StringInterpolation: Sendable {
}

@available(*, unavailable)
extension LocalizedStringKey: Sendable {
}

@available(*, unavailable)
extension LocalizedStringKey.FormatArgument: Sendable {
}

@available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
extension LocalizedStringKey.StringInterpolation {
    @available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ resource: LocalizedStringResource) {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(accessibilityName color: Color) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ image: Image) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ date: Date, style: Text.DateStyle) {
        assertUnimplemented()
    }
    
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ dates: ClosedRange<Date>) {
        assertUnimplemented()
    }
    
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ interval: DateInterval) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(timerInterval: ClosedRange<Date>, pauseTime: Date? = nil, countsDown: Bool = true, showsHours: Bool = true) {
        assertUnimplemented()
    }
}

@_alwaysEmitIntoClient internal var int64Specifier: String {
    get { "%lld" }
}
@_alwaysEmitIntoClient internal var int32Specifier: String {
    get { "%d" }
}
@_alwaysEmitIntoClient internal var uint64Specifier: String {
    get { "%llu" }
}
@_alwaysEmitIntoClient internal var uint32Specifier: String {
    get { "%u" }
}
@_alwaysEmitIntoClient internal var floatSpecifier: String {
    get { "%f" }
}
@_alwaysEmitIntoClient internal var doubleSpecifier: String {
    get { "%lf" }
}

@_alwaysEmitIntoClient @_semantics("constant_evaluable") internal func formatSpecifier<T>(_ type: T.Type) -> String {
    switch type {
    case is Int.Type:
        fallthrough
    case is Int64.Type:
        return int64Specifier
    case is Int8.Type:
        fallthrough
    case is Int16.Type:
        fallthrough
    case is Int32.Type:
        return int32Specifier
    case is UInt.Type:
        fallthrough
    case is UInt64.Type:
        return uint64Specifier
    case is UInt8.Type:
        fallthrough
    case is UInt16.Type:
        fallthrough
    case is UInt32.Type:
        return uint32Specifier
    case is Float.Type:
        return floatSpecifier
    case is CGFloat.Type:
        fallthrough
    case is Double.Type:
        return doubleSpecifier
    default:
        return "%@"
    }
}

@available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
extension Text {
    @available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload public init(_ resource: LocalizedStringResource) {
        assertUnimplemented()
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {
    @_semantics("swiftui.init_with_localization") public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) {
        self.storage = .anyTextStorage(LocalizedTextStorage(key: key, table: tableName, bundle: bundle))
    }
}

fileprivate final class LocalizedTextStorage: AnyTextStorage {
    let key: LocalizedStringKey
    let table: String?
    let bundle: Bundle?
    
    init(key: LocalizedStringKey, table: String?, bundle: Bundle?) {
        self.key = key
        self.table = table
        self.bundle = bundle
        super.init()
    }
    
    override func resolve<C>(into container: inout C, in environment: EnvironmentValues, with options: Text.ResolveOptions) where C : ResolvedTextContainer {
        key.resolve(into: &container, in: environment, options: options, table: table, bundle: bundle)
    }
    
    override func resolvesToEmpty(in environment: EnvironmentValues, with options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyTextStorage) -> Bool {
        assertUnimplemented()
    }
    
    override func isStyled(options: Text.ResolveOptions) -> Bool {
        assertUnimplemented()
    }
    
    override var localizationInfo: _LocalizationInfo {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public enum _LocalizationInfo : Equatable {
  case none
  case verbatim(String)
  case localized(key: String, tableName: String? = nil, bundle: Bundle? = nil, hasFormatting: Bool = false)
}

@available(*, unavailable)
extension _LocalizationInfo : Sendable {
}

extension LocalizedStringKey {
    func resolve<T: ResolvedTextContainer>(into container: inout T, in environmentValues: EnvironmentValues, options: Text.ResolveOptions, table: String?, bundle: Bundle?) {
        if isLinkedOnOrAfter(.v3) && !options.contains(.ignoreMarkdown) {
            let bundle = bundle ?? .main
            // <+684>
            let locale = environmentValues.locale
            // <+1236>
            let localized = _LocalizeAttributedString(bundle, key, table, locale)
            
            // <+1304>
            if options.contains(.includeAccessibility) {
                // <+1312>
                let arguments = getArgumentsForInflection(for: localized, in: environmentValues, idiom: container.idiom, with: options, including: container.style)
                let resolved = unsafe NSAttributedString(swiftUIAttributedStringWithFormat: localized, options: [], locale: environmentValues.locale, arguments: getVaList(arguments.arguments))
                resolveArguments(from: resolved, into: &container, in: environmentValues, options: options, isUniqueSizeVariant: arguments.isUniqueSizeVariant)
            } else {
                // <+1496>
                container.append(localized, in: environmentValues, with: options)
            }
        } else {
            let bundle = bundle ?? .main
            // <+488>
            let locale = environmentValues.locale
            // <+880>
            let localized = _LocalizeString(bundle, key, table, locale)
            
            if options.contains(.includeAccessibility) {
                // <+976>
                let args: [CVarArg] = arguments.map { arg in
                    // $s7SwiftUI18LocalizedStringKeyV7resolve4into2in7options5table6bundleyxz_AA17EnvironmentValuesVAA4TextV14ResolveOptionsVSSSgSo8NSBundleCSgtAA08ResolvedN9ContainerRzlFs7CVarArg_pAC14FormatArgumentVXEfU_
                    assertUnimplemented()
                }
                
                let resolved = unsafe String(format: localized, locale: environmentValues.locale, arguments: args)
                resolveArguments(from: resolved, into: &container, in: environmentValues, options: options, isUniqueSizeVariant: false /* 확실하지 않음 */)
            } else {
                // <+1080>
                container.append(localized, in: environmentValues, with: options)
            }
        }
    }
    
    func getArgumentsForInflection(for attributedString: NSAttributedString, in environment: EnvironmentValues, idiom: AnyInterfaceIdiom?, with options: Text.ResolveOptions, including style: Text.Style) -> (arguments: [CVarArg], isUniqueSizeVariant: Bool) {
        assertUnimplemented()
    }
    
    func resolveArguments<T: ResolvedTextContainer>(from string: NSAttributedString, into container: inout T, in environment: EnvironmentValues, options: Text.ResolveOptions, isUniqueSizeVariant: Bool) {
        assertUnimplemented()
    }
    
    func resolveArguments<T: ResolvedTextContainer>(from string: String, into container: inout T, in environment: EnvironmentValues, options: Text.ResolveOptions, isUniqueSizeVariant: Bool) {
        assertUnimplemented()
    }
}

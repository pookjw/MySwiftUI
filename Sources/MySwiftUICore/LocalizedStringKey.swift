public import Foundation

@frozen public struct LocalizedStringKey: Equatable, ExpressibleByStringInterpolation {
    internal var key: String
    internal var hasFormatting: Bool = false
    private var arguments: [LocalizedStringKey.FormatArgument]
    
    public init(_ value: String) {
        fatalError("TODO")
    }
    
    @_semantics("swiftui.localized_string_key.init_literal")
    public init(stringLiteral value: String) {
        fatalError("TODO")
    }
    
    @_semantics("swiftui.localized_string_key.init_interpolation")
    public init(stringInterpolation: LocalizedStringKey.StringInterpolation) {
        fatalError("TODO")
    }
    
    @usableFromInline
    internal struct FormatArgument: Equatable {
        @usableFromInline
        internal static func == (lhs: LocalizedStringKey.FormatArgument, rhs: LocalizedStringKey.FormatArgument) -> Bool {
            fatalError("TODO")
        }
    }
    
    public struct StringInterpolation: StringInterpolationProtocol {
        @_semantics("swiftui.localized.interpolation_init")
        public init(literalCapacity: Int, interpolationCount: Int) {
            fatalError("TODO")
        }
        
        @_semantics("swiftui.localized.appendLiteral")
        public mutating func appendLiteral(_ literal: String) {
            fatalError("TODO")
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ string: String) {
            fatalError("TODO")
        }
        
        @_alwaysEmitIntoClient
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ substring: Substring) {
            appendInterpolation(String(substring))
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject: ReferenceConvertible {
            fatalError("TODO")
        }
        
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<Subject>(_ subject: Subject, formatter: Formatter? = nil) where Subject: NSObject {
            fatalError("TODO")
        }
        
        @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<F>(_ input: F.FormatInput, format: F) where F: FormatStyle, F.FormatInput: Equatable, F.FormatOutput == String {
            fatalError("TODO")
        }
        
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation<F>(_ input: F.FormatInput, format: F) where F: FormatStyle, F.FormatInput: Equatable, F.FormatOutput == AttributedString {
            fatalError("TODO")
        }
        
        @_transparent
        public mutating func appendInterpolation<T>(_ value: T) where T: _FormatSpecifiable {
            appendInterpolation(value, specifier: formatSpecifier(T.self))
        }
        
        @_semantics("swiftui.localized.appendInterpolation_param_specifier")
        public mutating func appendInterpolation<T>(_ value: T, specifier: String) where T: _FormatSpecifiable {
            fatalError("TODO")
        }
        
        @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ text: Text) {
            fatalError("TODO")
        }
        
        @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
        @_semantics("swiftui.localized.appendInterpolation_@_specifier")
        public mutating func appendInterpolation(_ attributedString: AttributedString) {
            fatalError("TODO")
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
            fatalError("TODO")
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
        fatalError("TODO")
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
        fatalError("TODO")
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(accessibilityName color: Color) {
        fatalError("TODO")
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ image: Image) {
        fatalError("TODO")
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ date: Date, style: Text.DateStyle) {
        fatalError("TODO")
    }
    
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ dates: ClosedRange<Date>) {
        fatalError("TODO")
    }
    
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(_ interval: DateInterval) {
        fatalError("TODO")
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension LocalizedStringKey.StringInterpolation {
    @_semantics("swiftui.localized.appendInterpolation_@_specifier")
    public mutating func appendInterpolation(timerInterval: ClosedRange<Date>, pauseTime: Date? = nil, countsDown: Bool = true, showsHours: Bool = true) {
        fatalError("TODO")
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

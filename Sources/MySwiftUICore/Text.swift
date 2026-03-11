public import Foundation

public struct Text: View {
    public var body: Never {
        fatalError("TODO")
    }
    
    @_disfavoredOverload public init<S>(_ content: S) where S : StringProtocol {
        fatalError("TODO")
    }
}

@available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
extension Text {
    @available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload public init(_ resource: LocalizedStringResource) {
        fatalError("TODO")
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {
    @_semantics("swiftui.init_with_localization") public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) {
        fatalError("TODO")
    }
}

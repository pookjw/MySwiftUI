// 52803FDE2123C3846E0286DE7934BA01

extension Text {
    public enum TruncationMode : Sendable {
        case head
        case tail
        case middle
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public enum Case : Sendable {
        case uppercase
        case lowercase
    }
}

extension EnvironmentValues {
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var textCase: Text.Case? {
        get {
            return self[TextCaseKey.self]
        }
        set {
            self[TextCaseKey.self] = newValue
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Hashable, /*CodableByProxy,*/ Serializable {}

fileprivate struct TextCaseKey : EnvironmentKey {
    static var defaultValue: Text.Case? {
        return nil
    }
}

// 52803FDE2123C3846E0286DE7934BA01

extension Text {
    public enum TruncationMode : Sendable, Hashable {
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
        _modify {
            yield &self[TextCaseKey.self]
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Text.Case : Hashable, CodableByProxy, Serializable {
    package func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package static func deserialize(from decoder: Decoder) throws -> Text.Case {
        assertUnimplemented()
    }
    
    var codingProxy: CodableTextCase {
        assertUnimplemented()
    }
    
    static func unwrap(codingProxy: CodableTextCase) -> Text.Case {
        assertUnimplemented()
    }
}

extension Text.TruncationMode : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }

    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    @inlinable nonisolated public func textCase(_ textCase: Text.Case?) -> some View {
        environment(\.textCase, textCase)
    }
}

fileprivate struct TextCaseKey : EnvironmentKey {
    static var defaultValue: Text.Case? {
        return nil
    }
}

enum CodableTextCase : Codable, Hashable {
    case uppercase
    case lowercase
    
    init(_ textCase: Text.Case) {
        assertUnimplemented()
    }
    
    var textCase: Text.Case {
        assertUnimplemented()
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

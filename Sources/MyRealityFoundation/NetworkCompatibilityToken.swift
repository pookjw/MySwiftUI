@_hasMissingDesignatedInitializers @available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
@available(tvOS, unavailable)
final public class NetworkCompatibilityToken : Codable {
    public enum Compatibility {
        case compatible
        case sessionProtocolVersionMismatch
        
        public static func == (a: NetworkCompatibilityToken.Compatibility, b: NetworkCompatibilityToken.Compatibility) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @safe public static nonisolated(unsafe) let local: NetworkCompatibilityToken = {
        assertUnimplemented()
    }()
    
    required public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    final public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    final public func compatibilityWith(_ otherToken: NetworkCompatibilityToken) -> NetworkCompatibilityToken.Compatibility {
        assertUnimplemented()
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, *)
@available(tvOS, unavailable)
extension NetworkCompatibilityToken.Compatibility : Equatable {}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, *)
@available(tvOS, unavailable)
extension NetworkCompatibilityToken.Compatibility : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __REAssetIdentifier : ExpressibleByStringLiteral, Codable, Sendable {
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        assertUnimplemented()
    }
    
    public init(_ value: String) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ExtendedGraphemeClusterLiteralType = __REAssetIdentifier.StringLiteralType
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias UnicodeScalarLiteralType = __REAssetIdentifier.StringLiteralType
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

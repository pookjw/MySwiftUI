@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum MaterialScalarParameter : ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Hashable {
    case float(Float)
    case texture(TextureResource)
    
    public init(floatLiteral value: Float) {
        assertUnimplemented()
    }
    
    public init(integerLiteral value: Int) {
        assertUnimplemented()
    }
    
    public static func == (lhs: MaterialScalarParameter, rhs: MaterialScalarParameter) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias FloatLiteralType = Float
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias IntegerLiteralType = Int
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

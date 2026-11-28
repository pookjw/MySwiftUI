@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum MaterialScalarParameter : ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Hashable {
    case float(Float)
    case texture(TextureResource)
    
    public init(floatLiteral value: Float) {
        self = .float(value)
    }
    
    public init(integerLiteral value: Int) {
        self = .float(Float(value))
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

extension MaterialScalarParameter : RealityKitAdditiveArithmetic {
    func rekitMinus(_ other: MaterialScalarParameter) -> MaterialScalarParameter {
        assertUnimplemented()
    }
    
    func rekitPlus(_ other: MaterialScalarParameter) -> MaterialScalarParameter {
        assertUnimplemented()
    }
}

extension MaterialScalarParameter : RealityKitVectorArithmetic {
    mutating func scale(by scale: Double) {
        assertUnimplemented()
    }
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
}

extension MaterialScalarParameter {
    static var zero: MaterialScalarParameter {
        assertUnimplemented()
    }
}

public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __MaterialColorParameter : _ExpressibleByColorLiteral, Hashable {
    case color(CGColor)
    case texture(TextureResource)
    
    public init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
        assertUnimplemented()
    }
    
    public static func == (lhs: __MaterialColorParameter, rhs: __MaterialColorParameter) -> Bool {
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

public import UIKit

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum MaterialColorParameter : _ExpressibleByColorLiteral, Hashable {
    case color(UIColor)
    case texture(TextureResource)
    
    public init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
        assertUnimplemented()
    }
    
    public static func == (lhs: MaterialColorParameter, rhs: MaterialColorParameter) -> Bool {
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

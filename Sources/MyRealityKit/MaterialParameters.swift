public import UIKit

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MaterialParameters.Value {
    public var colorValue: UIColor? {
        get {
            assertUnimplemented()
        }
    }
    
    public static func color(_ color: UIColor) -> MaterialParameters.Value {
        assertUnimplemented()
    }
}

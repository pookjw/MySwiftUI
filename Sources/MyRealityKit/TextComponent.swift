public import UIKit

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextComponent {
    public typealias EdgeInsets = UIEdgeInsets
    
    public var edgeInsets: TextComponent.EdgeInsets {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

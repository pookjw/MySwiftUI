
internal import UIKit

protocol FallbackResponderProvider : AnyObject {
    var defaultNextResponder: UIResponder? { get }
}

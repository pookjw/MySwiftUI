internal import UIKit

protocol CurrentEventProvider: AnyObject {
    var currentEvent: UIEvent? { get }
}

package import UIKit

package protocol UICoreViewControllerProvider: AnyObject {
    var coreUIViewController: UIViewController? { get }
}

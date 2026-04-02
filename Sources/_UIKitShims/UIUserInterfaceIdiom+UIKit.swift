private import _UIKitPrivate
package import UIKit

extension UIUserInterfaceIdiom {
    @_transparent package static var watch: UIUserInterfaceIdiom {
        return UIUserInterfaceIdiom(rawValue: __UIUserInterfaceIdiomWatch.rawValue)!
    }
}

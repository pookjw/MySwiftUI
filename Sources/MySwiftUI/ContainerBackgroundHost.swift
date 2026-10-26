internal import UIKit

protocol ContainerBackgroundHost : AnyObject {
    var containerBackgroundColor: UIColor? { get set }
    var defaultBackgroundIsTransparent: Bool { get }
    var wantsTransparentBackground: Bool { get }
    func setWantsTransparentBackground(for: HostingViewTransparentBackgroundReason, _: Bool)
}

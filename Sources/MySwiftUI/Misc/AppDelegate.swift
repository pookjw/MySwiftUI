#warning("TODO")
internal import UIKit

final class AppDelegate: UIResponder {
    static var shared: AppDelegate?
    
    private(set) var mainMenuController: UIKitMainMenuController?
    var immersiveSpaceAuthority: ImmersiveSpaceAuthority {
        fatalError("TODO")
    }
}

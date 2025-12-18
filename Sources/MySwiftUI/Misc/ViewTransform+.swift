@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import FrontBoardServices
private import _UIKitPrivate
private import MRUIKit

extension ViewTransform {
    @MainActor mutating func appendWorldAndImmersiveSpaceCoordinates(for window: UIWindow?) {
        if let windowScene = window?.windowScene {
            // <+172>
            // x21
            if
                let settings = windowScene._FBSScene.settings as? MRUISharedApplicationSceneSettings,
                let appDelegate = AppDelegate.shared
            {
                // <+324>
                fatalError("TODO")
            }
        }
        
        // <+860>
        self.appendCoordinateSpace(id: .worldReference)
    }
}

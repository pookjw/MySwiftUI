@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import FrontBoardServices
private import _UIKitPrivate
private import MRUIKit
private import Spatial

extension ViewTransform {
    @MainActor mutating func appendWorldAndImmersiveSpaceCoordinates(for window: UIWindow?) {
        if
            let window,
            let windowScene = window.windowScene, // x25
            let settings = windowScene._FBSScene.settings as? MRUISharedApplicationSceneSettings, // x24
            let appDelegate = AppDelegate.shared // x19 + 0x48
        {
            // windowScene -> x19 + 0x70
            if
                let immersiveSpaceScene = appDelegate.immersiveSpaceAuthority.immersiveSpaceScene,
                let immersiveSpaceWindowScene = immersiveSpaceScene as? UIWindowScene,
                windowScene === immersiveSpaceWindowScene
            {
                // immersiveSpaceWindowScene -> x28
                // <+408>
                let d9: CGFloat
                let d10: CGFloat
                do {
                    let size = immersiveSpaceWindowScene.effectiveGeometry._size
                    d9 = size.width
                    d10 = size.height
                }
                
                let d8 = immersiveSpaceWindowScene.traitCollection._pointsPerMeter()
                
                var d0: CGFloat
                var d1: CGFloat
                var d2: CGFloat
                let size1 = Size3D(width: d8, height: d8, depth: d8)
                d0 = size1.width
                d1 = size1.height
                d2 = size1.depth
                
                // x19 + 0x80
                let transform = AffineTransform3D(scale: size1)
                
                d1 = -0.5
                d0 = d9 * d1
                d1 = d10 * d1
                d2 = 0
                
                // x19 + 0x380
                let size2 = __SPSize3DMake(d0, d1, d2)
                // x19 + 0x100
                let translation = AffineTransform3D(translation: unsafeBitCast(size2, to: Vector3D.self))
                // sp + 0x180
                let inverted = transform.inverse!
                
                // <+596>
                // sp + 0x380
                let copy_1 = inverted
                // x19 + 0x680
                let concat = translation.concatenating(copy_1)
                
                assertUnimplemented()
            } else {
                // <+848>
                assertUnimplemented()
            }
            assertUnimplemented()
        }
        
        // <+748>
        self.appendCoordinateSpace(id: .worldReference)
    }
}

@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import FrontBoardServices
private import _UIKitPrivate
private import MRUIKit
private import Spatial
private import _QuartzCorePrivate
private import _UIKitShims

extension ViewTransform {
    @MainActor mutating func appendWorldAndImmersiveSpaceCoordinates(for window: UIWindow?) {
        if
            let window,
            let windowScene = window.windowScene,
            let settings = windowScene._FBSScene.settings as? MRUISharedApplicationSceneSettings, // x24
            let appDelegate = AppDelegate.shared // x19 + 0x48
        {
            // windowScene -> x19 + 0x70
            // x28
            let immersiveSpaceWindowScene = appDelegate.immersiveSpaceAuthority.immersiveSpaceScene as? UIWindowScene
            
            if
                let immersiveSpaceWindowScene,
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
                // x19 + 0x600
                let copy_2 = transform
                // <+1892>
            } else {
                // <+848>
                var d8: CGFloat
                var d9: CGFloat
                var d10: CGFloat
                
                if let ornamentsItem = window.mrui_ornament() {
                    // <+868>
                    // ornamentsItem -> x20
                    // x23
                    let coordinateSpace = windowScene.coordinateSpace
                    var d0: CGFloat = 0
                    var d1: CGFloat = 0
                    let converted = window.convert(CGPoint(x: d0, y: d1), to: coordinateSpace)
                    d0 = converted.x
                    d1 = converted.y
                    d8 = d0
                    d9 = d1
                    // x19 + 0x380
                    let effectiveOffset = ornamentsItem._effectiveOffset
                    let d2 = effectiveOffset.z
                    d0 = d8
                    d1 = d9
                    // x19 + 0x380
                    let size = __SPSize3DMake(d0, d1, d2)
                    d8 = size.width
                    d9 = size.height
                    d10 = size.depth
                    
                    // <+976>
                } else {
                    // <+988>
                    if let realityCoordinateSpace = windowScene._realityCoordinateSpace {
                        // <+1008>
                        // realityCoordinateSpace -> x20
                        var d0: CGFloat
                        var d1: CGFloat
                        var d2: CGFloat
                        do {
                            let point = CAPoint3D.zero
                            d0 = point.x
                            d1 = point.y
                            d2 = point.z
                        }
                        
                        do {
                            let converted = window.convert(CAPoint3D(x: d0, y: d1, z: d2), to: realityCoordinateSpace)
                            d0 = converted.x
                            d1 = converted.y
                            d2 = converted.z
                        }
                        
                        // x19 + 0x380
                        let size = __SPSize3DMake(d0, d1, d2)
                        d8 = size.width
                        d9 = size.height
                        d10 = size.depth
                    } else {
                        // <+1116>
                        d8 = 0
                        d9 = 0
                        d10 = 0
                    }
                }
                
                var d11: CGFloat
                if let immersiveSpaceWindowScene {
                    // <+1076>
                    d11 = immersiveSpaceWindowScene.traitCollection._pointsPerMeter()
                    // <+1196>
                } else {
                    // <+1136>
                    d11 = MyUIScreen.main.traitCollection._pointsPerMeter()
                    // <+1196>
                }
                
                // <+1196>
                var d1 = d11
                var d0 = d11
                var d2 = d11
                // x19 + 0x380
                let size_1 = Size3D(width: d0, height: d1, depth: d2)
                d0 = size_1.width
                d1 = size_1.height
                d2 = size_1.depth
                // x19 + 0x600
                let transform = AffineTransform3D(scale: size_1)
                // x29 - 0xd0
                let relativeTransform = settings.relativeTransform
                // x19 + 0x380
                let size_2 = windowScene.effectiveGeometry._size
                let d15 = size_2.width
                d1 = size_2.height
                d0 = size_2.depth
                let x190x8 = d1
                let x190x10 = d0
                d0 = d8
                d1 = d9
                d2 = d10
                // x19 + 0x380
                let size_3 = __SPSize3DMake(d0, d1, d2)
                // x19 + 0x18
                let size_4 = size_3
                let w27 = windowScene.session.role == .windowApplicationVolumetric
                d0 = settings.pointsPerMeter
                d11 = d0
                
                // <+1532>
                assertUnimplemented()
            }
            
            // <+1892>
            assertUnimplemented()
        }
        
        // <+748>
        self.appendCoordinateSpace(id: .worldReference)
    }
}

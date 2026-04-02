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
            
            let x190x600: AffineTransform3D
            let x190x680: AffineTransform3D
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
                
                var d0 = d8
                var d1 = -d8
                var d2 = d8
                let size1 = Size3D(width: d0, height: d1, depth: d2)
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
                let translation = AffineTransform3D(translation: Vector3D(vector: size2.vector))
                // sp + 0x180
                let inverted = transform.inverse!
                
                // <+596>
                // sp + 0x380
                let copy_1 = inverted
                x190x680 = copy_1.concatenating(translation)
                x190x600 = transform
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
                var d1 = -d11
                var d0 = d11
                var d2 = d11
                // x19 + 0x380
                let size_1 = Size3D(width: d0, height: d1, depth: d2)
                d0 = size_1.width
                d1 = size_1.height
                d2 = size_1.depth
                // x19 + 0x600
                let transform_1 = AffineTransform3D(scale: size_1)
                x190x600 = transform_1
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
                // x19 + 0x580
                let transform_2 = AffineTransform3D(relativeTransform)
                
                do {
                    let point = UnitPoint3D.topLeadingBack
                    d0 = point.x
                    d1 = point.y
                    d2 = point.z
                    d10 = d0
                    d9 = d1
                    d8 = d2
                }
                
                // x20
                var transform_3: AffineTransform3D!
                if w27 {
                    // <+1560>
                    let point = UnitPoint3D.bottom
                    d0 = point.x
                    d1 = point.y
                    d2 = point.z
                    // <+1584>
                } else {
                    // <+1572>
                    transform_3 = .identity
                    let point = UnitPoint3D.back
                    d0 = point.x
                    d1 = point.y
                    d2 = point.z
                    // <+1584>
                }
                
                // <+1584>
                let d12 = d0
                let d13 = d1
                let d14 = d2
                
                do {
                    let axis = RotationAxis3D.x
                    d0 = axis.x
                    d1 = axis.y
                    d2 = axis.z
                }
                
                // x19 + 0x280
                let axis = RotationAxis3D(x: d0, y: d1, z: d2)
                // <+1620>
                d0 = .pi * 0.5
                // x19 + 0x200
                let rotation = Rotation3D(angle: Angle2D(radians: d0), axis: axis)
                let transform_4 = AffineTransform3D(rotation: rotation)
                if w27 {
                    transform_3 = transform_4
                }
                
                // <+1660>
                d0 = 1.0
                d0 = d0 / d11
                d1 = -1.0
                d1 = d1 / d11
                d2 = d0
                // x19 + 0x280
                let size_5 = Size3D(width: d0, height: d1, depth: d2)
                // x19 + 0x400
                let transform_5 = AffineTransform3D(scale: size_5)
                
                d0 = d10 - d12
                d0 = d15 * d0
                d1 = d9 - d13
                d2 = x190x8
                let d3 = x190x10
                d1 = d2 * d1
                d2 = d8 - d14
                d2 = d3 * d2
                // x19 + 0x280
                let size_6 = Size3D(width: d0, height: d1, depth: d2)
                // x19 + 0x480
                let transform_6 = AffineTransform3D(translation: Vector3D(vector: size_6.vector))
                
                // <+1756>
                // x19 + 0x280
                let vector = Vector3D(vector: size_4.vector)
                // x19 + 0x500
                let transform_7 = AffineTransform3D(translation: vector)
                // x19 + 0x300
                let transform_8 = transform_3!
                // x19 + 0x280
                let transform_9 = transform_2.concatenating(transform_8)
                // x19 + 0x200
                let transform_10 = transform_9.concatenating(transform_5)
                // x19 + 0x280
                let transform_11 = transform_10.concatenating(transform_6)
                // x19 + 0x680
                x190x680 = transform_11.concatenating(transform_7)
                // <+1892>
            }
            
            // <+1892>
            // x24
            var buffer = ViewTransform.UnsafeBuffer()
            
            do {
                let linkedAfterV7 = isLinkedOnOrAfter(.v7)
                if (immersiveSpaceWindowScene != nil) || linkedAfterV7 {
                    // <+1916>
                    buffer.appendAffineTransform3D(x190x680, inverse: false)
                    
                    if immersiveSpaceWindowScene != nil {
                        buffer.appendAffineTransform3D(x190x600, inverse: false)
                        buffer.appendCoordinateSpace(id: .immersiveSpace, transform: &self)
                        buffer.appendAffineTransform3D(x190x600, inverse: true)
                    }
                }
            }
            
            // <+2004>
            do {
                let linkedAfterV7 = isLinkedOnOrAfter(.v7)
                if (immersiveSpaceWindowScene != nil) || linkedAfterV7 {
                    // <+2020>
                    buffer.appendCoordinateSpace(id: .worldReference, transform: &self)
                    buffer.appendAffineTransform3D(x190x680, inverse: true)
                }
            }
            
            // <+2076>
            self.append(movingContentsOf: &buffer)
            // <+776>
        } else {
            // <+748>
            self.appendCoordinateSpace(id: .worldReference)
        }
        
        // <+776>
    }
}

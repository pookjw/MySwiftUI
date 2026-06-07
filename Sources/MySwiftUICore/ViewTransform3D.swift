// C7EC178EDED3447B2AB780EC0082CA22
package import Spatial
private import CoreGraphics

extension ViewTransform {
    package mutating func appendSizedSpace3D(name: AnyHashable, size3D: Size3D) {
        /*
         self = x19
         size3D = d10/d9/d8
         */
        // sp + 0x50
        let coordinateSpace = CoordinateSpace.named(name)
        let tag = updateNode(coordinateSpace: coordinateSpace)
        self.updateHead(element: SizedSpace3DElement(space: tag, size3D: size3D))
    }
    
    package mutating func appendAffineTransform3D(_ transform: AffineTransform3D, inverse: Bool) {
        /*
         self -> x20
         transform -> x0 -> x19
         inverse -> w1 -> w21
         */
        if transform.isTranslation {
            // <+44>
            // sp + 0x20
            let translation = transform.translation
            // sp
            let size3D = Size3D(
                Vector3D(
                    x: translation.x,
                    y: translation.y,
                    z: translation.z
                )
            )
            
            var x10 = size3D.width
            var x8 = size3D.height
            var x9 = size3D.depth
            
            if inverse {
                // <+80>
                var d0 = x9
                let d1 = x10
                // sp
                let point = Point3D(
                    vector: simd_double3(
                        x: -d1,
                        y: -x8,
                        z: -d0
                    )
                )
                
                x10 = point.x
                x8 = point.y
                x9 = point.z
            }
            
            // <+136>
            let d0 = x10
            let d1 = x8
            let d2 = x9
            
            self.appendTranslation3D(Size3D(width: d0, height: d1, depth: d2))
        } else {
            // <+176>
            // inverse -> w21 -> w23
            let element = AffineTransform3DElement(
                matrix: transform,
                inverse: inverse
            )
            
            self.updateHead(element: element)
        }
    }
    
    mutating func appendTranslation3D(_ size: Size3D) {
        let element = Translation3DElement(offset: size)
        self.updateHead(element: element)
    }
}

extension ViewTransform.UnsafeBuffer {
    package mutating func appendAffineTransform3D(_ transform: AffineTransform3D, inverse: Bool) {
        /*
         self -> x20
         transform -> x0 -> x21
         inverse -> w1 -> w19
         */
        if transform.isTranslation {
            // <+36>
            // sp + 0x20
            let translation = transform.translation
            // sp
            let size = Size3D(vector: translation.vector)
            
            if inverse {
                // sp
                let point = Point3D(x: size.width, y: -size.height, z: -size.depth)
                let element = Translation3DElement(offset: Size3D(point))
                append(element)
            } else {
                let element = Translation3DElement(offset: size)
                append(element)
            }
        } else {
            // <+160>
            let element = AffineTransform3DElement(matrix: transform, inverse: inverse)
            append(element)
        }
    }
}

fileprivate struct SizedSpace3DElement : ViewTransformElement {
    private(set) var space: CoordinateSpaceTag
    private(set) var size3D: Size3D
}

fileprivate struct DepthTranslationElement : ViewTransformElement {
    private(set) var depth: CGFloat
}

fileprivate struct Translation3DElement : ViewTransformElement {
    private(set) var offset: Size3D
}

fileprivate struct AffineTransform3DElement : ViewTransformElement {
    private(set) var matrix: AffineTransform3D
    private(set) var inverse: Bool
}

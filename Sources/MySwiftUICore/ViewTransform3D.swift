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

fileprivate struct SizedSpace3DElement: ViewTransformElement {
    private(set) var space: CoordinateSpaceTag
    private(set) var size3D: Size3D
}

fileprivate struct DepthTranslationElement: ViewTransformElement {
    private(set) var depth: CGFloat
}

fileprivate struct Translation3DElement: ViewTransformElement {
    private(set) var offset: Size3D
}

fileprivate struct AffineTransform3DElement: ViewTransformElement {
    private(set) var matrix: AffineTransform3D
    private(set) var inverse: Bool
}

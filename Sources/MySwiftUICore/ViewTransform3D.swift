// C7EC178EDED3447B2AB780EC0082CA22
#warning("TODO")
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

fileprivate struct SizedSpace3DElement: ViewTransformElement {
    var space: CoordinateSpaceTag
    var size3D: Size3D
}

fileprivate struct DepthTranslationElement: ViewTransformElement {
    var depth: CGFloat
}

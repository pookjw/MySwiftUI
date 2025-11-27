internal import QuartzCore
internal import MySwiftUICore
private import _QuartzCorePrivate
private import Spatial

extension CALayer {
    func mapGeometry3D(to other: CALayer?, _ transform: inout ViewTransform) {
        /*
         transform = x25
         self = x22
         */
        // x23
        var other = other
        // x21
        var buffer = ViewTransform.UnsafeBuffer()
        // x24
        var target: CALayer? = self
        while let _target = target {
            if _target.separatedState == 2 {
                // <+200>
                CALayerMapGeometry(
                    other,
                    _target,
                    { buffer, _ in
                        // $sSo7CALayerC7SwiftUIE13mapGeometry3D2to_yABSg_AC13ViewTransformVztFySpyAH12UnsafeBufferVGXEfU_ySv_SPySo13CATransform3DVGtcfU_To
                        fatalError("TODO")
                    },
                    { buffer, _ in
                        // $sSo7CALayerC7SwiftUIE13mapGeometry3D2to_yABSg_AC13ViewTransformVztFySpyAH12UnsafeBufferVGXEfU_ySv_SPySo13CATransform3DVGtcfU0_To
                        fatalError("TODO")
                    },
                    &buffer
                )
                
                other = target
                break
            } else {
                target = _target.superlayer
            }
        }
        
        // <+260>
        CALayerMapGeometry(
            other,
            self,
            { buffer, _ in
                // $sSo7CALayerC7SwiftUIE13mapGeometry3D2to_yABSg_AC13ViewTransformVztFySpyAH12UnsafeBufferVGXEfU0_ySv_SPySo13CATransform3DVGtcfU_To
                fatalError("TODO")
            },
            { buffer, transform in
                // $sSo7CALayerC7SwiftUIE13mapGeometry3D2to_yABSg_AC13ViewTransformVztFySpyAH12UnsafeBufferVGXEfU0_ySv_SPySo13CATransform3DVGtcfU0_To
                let transform3D = AffineTransform3D(transform)
                let transform = CGAffineTransform(transform3D)
                
                buffer
                    .unsafelyUnwrapped
                    .assumingMemoryBound(to: ViewTransform.UnsafeBuffer.self)
                    .pointee
                    .appendAffineTransform(transform, inverse: false)
            },
            &buffer
        )
        
        transform.append(movingContentsOf: &buffer)
    }
}

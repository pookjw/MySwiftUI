package import Spatial
package import CoreRE
private import simd

extension AffineTransform3D {
    package init(_ srt: CoreRE::SRT) {
        /*
         srt -> x0 -> x20
         return pointer -> x8 -> x19
         */
        // sp + 0x20
        let size = __SPSize3DMake(Double(srt.s.x), Double(srt.s.y), Double(srt.s.z))
        // sp
        let roation = Rotation3D(
            simd_quatd(
                real: Double(srt.r.real),
                imag: SIMD3<Double>(srt.r.imag)
            )
        )
        
        // sp - 0x40
        let point = __SPPoint3DMakeWithVector(
            simd_double3(Double(srt.t.x), Double(srt.t.x), Double(srt.t.z))
        )
        
        // sp + 0x80
        let copy_1 = size
        // sp + 0x60
        let copy_2 = roation
        
        let transform = AffineTransform3D(scale: copy_1, rotation: copy_2, translation: Vector3D(point))
        self = transform
    }
}

public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension simd_float3x3 {
    @inlinable internal init(_ matrix: REMatrix4x4F) {
                self = REMatrix3x3F(columns: (matrix[0]._xyz, matrix[1]._xyz, matrix[2]._xyz))
        }
}

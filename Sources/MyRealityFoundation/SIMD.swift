public import simd
internal import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension simd_float3x3 {
    @inlinable public init(_ matrix: simd_float4x4) {
        self = simd_float3x3(columns: (matrix[0]._xyz, matrix[1]._xyz, matrix[2]._xyz))
    }
}

extension SIMD4 where Scalar : BinaryFloatingPoint {
    var cgColor: CGColor {
        assertUnimplemented()
    }
}

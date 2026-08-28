internal import simd

extension simd_float4x4 {
    init(translation: SIMD3<Float>) {
        let rows: [SIMD4<Float>] = [
            SIMD4<Float>(1, 0, 0, translation.x),
            SIMD4<Float>(0, 1, 0, translation.y),
            SIMD4<Float>(0, 0, 1, translation.z),
            SIMD4<Float>(0, 0, 0, 1)
        ]
        
        self.init(rows: rows)
    }
}

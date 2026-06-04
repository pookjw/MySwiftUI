public import simd

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Float : BindableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Double : BindableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD2 : BindableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD3 : BindableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD4 : BindableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension simd_quatf : BindableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Bool : BindableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Int : BindableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension String : BindableData {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SIMD3 where Scalar == Float {
    @inlinable internal static var one: SIMD3<Float> {
        get { return SIMD3<Float>(1, 1, 1) }
    }
    
    @inlinable internal static var positiveInfinity: SIMD3<Float> {
        get { return SIMD3<Float>(+.infinity, +.infinity, +.infinity) }
    }
    
    @inlinable internal static var negativeInfinity: SIMD3<Float> {
        get { return SIMD3<Float>(-.infinity, -.infinity, -.infinity) }
    }
}

extension simd_float4x4 {
    @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
    @inlinable internal var identity: float4x4 {
        get {
                return matrix_identity_float4x4
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension simd_quatf {
    @usableFromInline
    internal static let identity: simd_quatf = {
        assertUnimplemented()
    }()
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SIMD3 where Scalar == Float {
    @usableFromInline
    internal var _xy: SIMD2<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SIMD4 where Scalar == Float {
    @usableFromInline
    internal var _xyz: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension simd_float4x4 {
    @inlinable internal static var identity: REMatrix4x4F {
        get { return REMatrix4x4F( diagonal: SIMD4<Float>(repeating: 1.0)) }
    }
    
    @inlinable internal init(rows: (SIMD4<Float>, SIMD4<Float>, SIMD4<Float>, SIMD4<Float>)) {
                self = simd_matrix_from_rows(rows.0, rows.1, rows.2, rows.3)
        }
    
    @inlinable internal init(rows r: ((Float, Float, Float, Float), (Float, Float, Float, Float), (Float, Float, Float, Float), (Float, Float, Float, Float))) {
                self = simd_matrix_from_rows(SIMD4<Float>(r.0.0, r.0.1, r.0.2, r.0.3),
                                                                          SIMD4<Float>(r.1.0, r.1.1, r.1.2, r.1.3),
                                                                          SIMD4<Float>(r.2.0, r.2.1, r.2.2, r.2.3),
                                                                          SIMD4<Float>(r.3.0, r.3.1, r.3.2, r.3.3))
        }
    
    @inlinable internal init(translation t: SIMD3<Float>) {
                self.init(columns: (SIMD4<Float>(1, 0, 0, 0),
                                    SIMD4<Float>(0, 1, 0, 0),
                                    SIMD4<Float>(0, 0, 1, 0),
                                    SIMD4<Float>(t.x, t.y, t.z, 1)))
        }
    
    @inlinable internal init(scale s: SIMD3<Float>) {
                self.init(diagonal: SIMD4<Float>(s.x, s.y, s.z, 1))
        }
    
    @inlinable internal init(rotation: simd_quatf) {
                self = simd_matrix4x4(rotation)
        }
    
    @inlinable internal init(translation: SIMD3<Float>, rotation: simd_quatf, scale: SIMD3<Float>) {
                self = simd_matrix4x4(rotation)
                self.scale(scale)
                self.translate(translation)
        }
    
    @inlinable internal func scaled(_ scale: SIMD3<Float>) -> REMatrix4x4F {
                var m = self
                m.columns.0 *= scale.x
                m.columns.1 *= scale.y
                m.columns.2 *= scale.z
                return m
        }
    
    @inlinable internal func translated(_ trans: SIMD3<Float>) -> REMatrix4x4F {
                var m = self
                m.columns.3._xyz += trans
                return m
        }
    
    @inlinable internal mutating func scale(_ scale: SIMD3<Float>) {
                self.columns.0 *= scale.x
                self.columns.1 *= scale.y
                self.columns.2 *= scale.z
        }
    
    @inlinable internal mutating func translate(_ trans: SIMD3<Float>) {
                self.columns.3._xyz += trans
        }
    
    @inlinable internal var scale: SIMD3<Float> {
        get {
                        let minor = matrix_float3x3(self)
                        let sign = minor.determinant > Float(0) ? Float(1) : Float(-1)
                        return sign * SIMD3<Float>(length(minor.columns.0),
                                                                              length(minor.columns.1),
                                                                              length(minor.columns.2))
                }
        set {
                        self.columns.0._xyz = normalize(self.columns.0._xyz)
                        self.columns.1._xyz = normalize(self.columns.1._xyz)
                        self.columns.2._xyz = normalize(self.columns.2._xyz)
                        scale(newValue)
                }
    }
    
    @usableFromInline
    internal var rotation: simd_quatf {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @inlinable internal var translation: SIMD3<Float> {
        get {
                        return columns.3._xyz
                }
        set {
                        columns.3._xyz = newValue
                }
    }
    
    @inlinable internal func decompose() -> (translation: SIMD3<Float>, rotation: simd_quatf, scale: SIMD3<Float>) {
                return (translation, rotation, scale)
        }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Float : AnimatableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Double : AnimatableData {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD2 : AnimatableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD3 : AnimatableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SIMD4 : AnimatableData where Scalar == Float {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension simd_quatf : AnimatableData {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension simd_quatf {
    @usableFromInline
    internal init(eulerAngles: SIMD3<Float>, order: RotationOrder = .default) {
        assertUnimplemented()
    }
}

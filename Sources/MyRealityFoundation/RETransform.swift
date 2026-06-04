public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@usableFromInline
internal struct RETransform {
    @usableFromInline
    internal var position: SIMD3<Float>
    
    @usableFromInline
    internal var orientation: simd_quatf
    
    @usableFromInline
    internal var scale: SIMD3<Float>
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension RETransform {
    @inlinable internal var matrix: REMatrix4x4F {
        get {
                        return REMatrix4x4F(translation: position, rotation: orientation, scale: scale)
                }
        set {
                        (position, orientation, scale) = newValue.decompose()
                }
    }
}

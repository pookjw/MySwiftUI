@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@usableFromInline
internal struct REAngleF {
    public init(radians: Float) {
        assertUnimplemented()
    }
    
    public init(degrees: Float) {
        assertUnimplemented()
    }
    
    public var radians: Float
    
    @inlinable public var degrees: Float {
        get {
                        return radians * 180 / .pi
                }
        set {
                        radians = newValue * .pi / 180
                }
    }
}

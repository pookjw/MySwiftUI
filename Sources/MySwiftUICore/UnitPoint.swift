#warning("TODO")
public import CoreGraphics

public struct UnitPoint {
    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    
    @inlinable public init() {
        self.init(x: 0, y: 0, z: 0)
    }
    
    @inlinable public init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
    }
}

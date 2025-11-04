#warning("TODO")
public import CoreGraphics

public struct UnitPoint: Hashable {
    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    
    public static let zero = UnitPoint(x: 0, y: 0, z: 0)
    public static let center = UnitPoint(x: 0.5, y: 0.5, z: 0.5)
    public static let leading = UnitPoint(x: 0, y: 0.5, z: 0.5)
    public static let trailing = UnitPoint(x: 1, y: 0.5, z: 0.5)
    public static let top = UnitPoint(x: 0.5, y: 0, z: 0.5)
    public static let bottom = UnitPoint(x: 0.5, y: 1, z: 0.5)
    public static let topLeading = UnitPoint(x: 0, y: 0, z: 0.5)
    public static let topTrailing = UnitPoint(x: 1, y: 0, z: 0.5)
    public static let bottomLeading = UnitPoint(x: 0, y: 1, z: 0.5)
    public static let bottomTrailing = UnitPoint(x: 1, y: 1, z: 0.5)
    
    @inlinable public init() {
        self.init(x: 0, y: 0, z: 0)
    }
    
    @inlinable public init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
    }
}

extension UnitPoint: Animatable {
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>
    
    public var animatableData: UnitPoint.AnimatableData {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

extension UnitPoint: Codable {
    
}

extension UnitPoint: BitwiseCopyable {}
extension UnitPoint: Sendable {}

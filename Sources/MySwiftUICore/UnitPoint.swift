#warning("TODO")
public import CoreGraphics

public struct UnitPoint: Hashable {
    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    
    public static let zero = UnitPoint(x: 0, y: 0, z: 0)
//    public static let center: UnitPoint
//    public static let leading: UnitPoint
//    public static let trailing: UnitPoint
//    public static let top: UnitPoint
//    public static let bottom: UnitPoint
//    public static let topLeading: UnitPoint
//    public static let topTrailing: UnitPoint
//    public static let bottomLeading: UnitPoint
//    public static let bottomTrailing: UnitPoint
    
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

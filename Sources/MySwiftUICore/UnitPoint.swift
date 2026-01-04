public import CoreGraphics
public import Spatial

public struct UnitPoint: Hashable {
    public var x: CGFloat
    public var y: CGFloat
    
    @inlinable public init() {
        self.init(x: 0, y: 0)
    }
    
    @inlinable public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    public static let zero = UnitPoint(x: 0, y: 0)
    public static let center = UnitPoint(x: 0.5, y: 0.5)
    public static let leading = UnitPoint(x: 0, y: 0.5)
    public static let trailing = UnitPoint(x: 1, y: 0.5)
    public static let top = UnitPoint(x: 0.5, y: 0)
    public static let bottom = UnitPoint(x: 0.5, y: 1)
    public static let topLeading = UnitPoint(x: 0, y: 0)
    public static let topTrailing = UnitPoint(x: 1, y: 0)
    public static let bottomLeading = UnitPoint(x: 0, y: 1)
    public static let bottomTrailing = UnitPoint(x: 1, y: 1)
}

extension UnitPoint: Animatable {
    public typealias AnimatableData = AnimatablePair<CGFloat, CGFloat>
    
    public var animatableData: UnitPoint.AnimatableData {
        get {
            return AnimatablePair(x, y)
        }
        set {
            x = newValue.first
            y = newValue.second
        }
    }
}

extension UnitPoint: Codable {
}

extension UnitPoint: BitwiseCopyable {}
extension UnitPoint: Sendable {}


@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct UnitPoint3D: Hashable {
    public var x: CGFloat
    public var y: CGFloat
    public var z: CGFloat
    
    public static let zero = UnitPoint3D(x: 0, y: 0, z:0)
    public static let origin = UnitPoint3D(x: 0, y: 0, z:0)
    public static let center = UnitPoint3D(x: 0.5, y: 0.5, z: 0.5)
    public static let bottom = UnitPoint3D(x: 0.5, y: 1, z: 0.5)
    public static let bottomBack = UnitPoint3D(x: 0.5, y: 1, z: 0)
    public static let bottomFront = UnitPoint3D(x: 0.5, y: 1, z: 1)
    public static let bottomLeading = UnitPoint3D(x: 0, y: 1, z: 0.5)
    public static let bottomLeadingBack = UnitPoint3D(x: 0, y: 1, z: 0)
    public static let bottomLeadingFront = UnitPoint3D(x: 0, y: 1, z: 1)
    public static let bottomTrailing = UnitPoint3D(x: 1, y: 1, z: 0.5)
    public static let bottomTrailingBack = UnitPoint3D(x: 1, y: 1, z: 0)
    public static let bottomTrailingFront = UnitPoint3D(x: 1, y: 1, z: 1)
    public static let leading = UnitPoint3D(x: 0, y: 0.5, z: 0.5)
    public static let leadingBack = UnitPoint3D(x: 0, y: 0.5, z: 0)
    public static let leadingFront = UnitPoint3D(x: 0, y: 0.5, z: 1)
    public static let top = UnitPoint3D(x: 0.5, y: 0.5, z: 0.5)
    public static let topBack = UnitPoint3D(x: 0.5, y: 0, z: 0)
    public static let topFront = UnitPoint3D(x: 0.5, y: 0, z: 1)
    public static let topLeading = UnitPoint3D(x: 0, y: 0, z: 0.5)
    public static let topLeadingBack = UnitPoint3D(x: 0, y: 0, z: 0)
    public static let topLeadingFront = UnitPoint3D(x: 0, y: 0, z: 1)
    public static let topTrailing = UnitPoint3D(x: 1, y: 0, z: 0.5)
    public static let topTrailingBack = UnitPoint3D(x: 1, y: 0, z: 0)
    public static let topTrailingFront = UnitPoint3D(x: 1, y: 0, z: 1)
    public static let trailing = UnitPoint3D(x: 1, y: 0.5, z: 0.5)
    public static let trailingBack = UnitPoint3D(x: 1, y: 0.5, z: 0)
    public static let trailingFront = UnitPoint3D(x: 1, y: 0.5, z: 1)
    public static let front = UnitPoint3D(x: 0.5, y: 0.5, z: 1)
    public static let back = UnitPoint3D(x: 0.5, y: 0.5, z: 0)
    
    @inlinable public init() {
        self.init(x: 0, y: 0, z: 0)
    }
    
    @inlinable public init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension UnitPoint3D: Animatable {
    public typealias AnimatableData = Vector3D
    
    public var animatableData: Vector3D {
        @inlinable get {
            Vector3D(x: x, y: y, z: z)
        }
        @inlinable set {
            x = newValue.x
            y = newValue.y
            z = newValue.z
        }
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension UnitPoint3D: Sendable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension UnitPoint3D: BitwiseCopyable {}

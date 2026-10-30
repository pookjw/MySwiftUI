public import Spatial

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public enum SquareAzimuth : CaseIterable, Sendable, Hashable {
    case front
    case right
    case back
    case left
    
    public var orientation: Rotation3D {
        assertUnimplemented()
    }
    
    public init(closestToAzimuth azimuth: Angle) {
        assertUnimplemented()
    }
    
    @frozen public struct Set : OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public static let front = SquareAzimuth.Set(rawValue: 1 << 0)
        public static let right = SquareAzimuth.Set(rawValue: 1 << 1)
        public static let back = SquareAzimuth.Set(rawValue: 1 << 2)
        public static let left = SquareAzimuth.Set(rawValue: 1 << 3)
        public static let all: SquareAzimuth.Set = [.front, .right, .back, .left]
        
        public init(_ e: SquareAzimuth) {
            assertUnimplemented()
        }
        
        public func contains(_ e: SquareAzimuth) -> Bool {
            assertUnimplemented()
        }
    }
}

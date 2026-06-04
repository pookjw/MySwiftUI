public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct TimedForceFalloff {
    public init(duration: TimeInterval, rate: Double = 1.0) {
        assertUnimplemented()
    }
    
    public var duration: TimeInterval
    
    public var rate: Double
}

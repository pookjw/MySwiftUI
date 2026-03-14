@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public enum SquareAzimuth: CaseIterable, Sendable {
    case front
    case right
    case back
    case left
    
    // TODO
    
    @frozen public struct Set: OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

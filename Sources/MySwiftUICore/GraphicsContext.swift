#warning("TODO")

@frozen public struct GraphicsContext {
    @frozen public struct BlendMode: RawRepresentable, Equatable {
        public let rawValue: Int32
        
        @inlinable public init(rawValue: Swift.Int32) {
            self.rawValue = rawValue
        }
    }
}

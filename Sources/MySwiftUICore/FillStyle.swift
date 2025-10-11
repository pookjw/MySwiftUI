#warning("TODO")

@frozen public struct FillStyle: Equatable {
    public var isEOFilled: Bool
    public var isAntialiased: Bool
    
    @inlinable public init(eoFill: Bool = false, antialiased: Bool = true) {
        self.isEOFilled = eoFill
        self.isAntialiased = antialiased
    }
}

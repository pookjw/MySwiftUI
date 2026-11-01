@_spi(Internal) public protocol EventType {
    var phase: EventPhase { get }
    var timestamp: Time { get }
    var binding: EventBinding? { get set }
    var customHitTestOptions: ViewResponder.ContainsPointsOptions? { get }
    init?(_ event: any EventType)
}

extension EventType {
    @_spi(Internal) public var customHitTestOptions: ViewResponder.ContainsPointsOptions? {
        assertUnimplemented()
    }
    
    @_spi(Internal) public init?(_ event: any EventType) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public var isFocusEvent: Bool {
        assertUnimplemented()
    }
}

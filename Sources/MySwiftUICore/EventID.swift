@_spi(Internal) public struct EventID : Hashable {
    @_spi(Internal) public static func == (lhs: borrowing EventID, rhs: borrowing EventID) -> Bool {
        assertUnimplemented()
    }
    
    private var type: Any.Type
    private var serial: Int
    
    init(type: Any.Type, serial: Int) {
        self.type = type
        self.serial = serial
    }
    
    @_spi(Internal) public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension EventID : CustomStringConvertible {
    @_spi(Internal) public var description: String {
        assertUnimplemented()
    }
}


@frozen public struct FillStyle : Equatable {
    public var isEOFilled: Bool
    public var isAntialiased: Bool
    
    @inlinable public init(eoFill: Bool = false, antialiased: Bool = true) {
        self.isEOFilled = eoFill
        self.isAntialiased = antialiased
    }
}

extension FillStyle : ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }

    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

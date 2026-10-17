public enum RoundedCornerStyle : Sendable, Hashable {
    case circular
    case continuous
}

extension RoundedCornerStyle : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }

    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

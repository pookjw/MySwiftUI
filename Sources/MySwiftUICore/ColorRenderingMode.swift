
public enum ColorRenderingMode : Sendable, Hashable {
    case nonLinear
    case linear
    case extendedLinear
}

extension ColorRenderingMode : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }

    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

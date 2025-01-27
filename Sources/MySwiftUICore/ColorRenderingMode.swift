public enum ColorRenderingMode: Hashable {
    case nonLinear
    case linear
    case extendedLinear
    
    package var protobufValue: UInt {
        fatalError("TODO")
    }
    
    package init(protobufValue: UInt) {
        fatalError("TODO")
    }
}

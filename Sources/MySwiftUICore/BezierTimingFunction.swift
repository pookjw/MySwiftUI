struct BezierTimingFunction<T : Equatable> : Equatable {
    var p1x: T
    var p1y: T
    var p2x: T
    var p2y: T
}

extension BezierTimingFunction : ProtobufEncodableMessage, ProtobufDecodableMessage where T == Float {
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension BezierTimingFunction : Sendable where T : Sendable {}

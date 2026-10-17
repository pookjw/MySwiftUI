
package protocol ProtobufEncodableMessage {
    func encode(to encoder: inout ProtobufEncoder) throws
}

package protocol ProtobufDecodableMessage {
    init(from decoder: inout ProtobufDecoder) throws
}

package struct ProtobufEncoder {
}

package struct ProtobufDecoder {
}

package protocol ProtobufEnum {
    var protobufValue: UInt { get }
    init?(protobufValue: UInt)
}

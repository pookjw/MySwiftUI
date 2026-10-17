public struct BackdropEffect : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    private var scale: Float
    private var color: Color.ResolvedHDR
    private var filters: [GraphicsFilter]
    private var captureOnly: Bool
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

enum BackdropGroupID {
    case index(DisplayList.Index.ID)
    case name(String)
}

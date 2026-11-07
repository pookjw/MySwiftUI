package struct BackdropEffect : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    private var scale: Float
    private(set) var color: Color.ResolvedHDR
    private(set) var filters: [GraphicsFilter]
    private var captureOnly: Bool
    
    init(scale: Float = 1, color: Color.ResolvedHDR = .black, filters: [GraphicsFilter] = [], captureOnly: Bool = false) {
        self.scale = scale
        self.color = color
        self.filters = filters
        self.captureOnly = captureOnly
    }
    
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
    
    var string: String {
        assertUnimplemented()
    }
}

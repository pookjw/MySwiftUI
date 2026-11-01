internal import CoreGraphics

struct PathSet {
    var elements: [PathSet.Element]
    var smoothness: CGFloat
    
    init(_ path: Path, smoothness: CGFloat) {
        assertUnimplemented()
    }
    
    init(elements: [PathSet.Element], smoothness: CGFloat) {
        assertUnimplemented()
    }
    
    var boundingRect: CGRect {
        assertUnimplemented()
    }
}

extension PathSet : ProtobufEncodableMessage {
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension PathSet : ProtobufDecodableMessage {
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension PathSet {
    struct Element {
        private var path: Path
        private var tags: _ShapeSet.Tags
        private var operation: _ShapeSet.Operation
        private var options: _ShapeSet.Element.Options
    }
}

extension PathSet.Element : Equatable {
    static func == (a: PathSet.Element, b: PathSet.Element) -> Bool {
        assertUnimplemented()
    }
}

extension PathSet.Element : ProtobufEncodableMessage {
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension PathSet.Element : ProtobufDecodableMessage {
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

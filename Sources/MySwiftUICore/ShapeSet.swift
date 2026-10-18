private import CoreGraphics

struct _ShapeSet {
    // TODO
}

extension _ShapeSet {
    struct Tags : OptionSet {
        let rawValue: UInt
    }
    
    enum Operation {
        case union
        case subtraction
    }
    
    struct Filter : Equatable {
        private var mask: _ShapeSet.Tags
        private var value: _ShapeSet.Tags
    }
    
    struct Element {
        // TODO
    }
    
    // TODO
}

extension _ShapeSet.Element {
    struct Options : OptionSet {
        let rawValue: UInt32
    }
}

extension _ShapeSet.Operation : Hashable, ProtobufEnum {
    var protobufValue: UInt {
        assertUnimplemented()
    }
    
    init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

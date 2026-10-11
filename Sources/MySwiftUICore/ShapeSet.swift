private import CoreGraphics

struct _ShapeSet {
    // TODO
}

extension _ShapeSet {
    struct Tags {
        let rawValue: UInt
    }
    
    enum Operation {
        case union
        case subtraction
    }
    
    struct Filter {
        private var mask: _ShapeSet.Tags
        private var value: _ShapeSet.Tags
    }
    
    struct Element {
        // TODO
    }
    
    // TODO
}

extension _ShapeSet.Element {
    struct Options {
        let rawValue: UInt32
    }
}

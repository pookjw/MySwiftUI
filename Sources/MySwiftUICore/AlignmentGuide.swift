internal import CoreGraphics

protocol AlignmentGuide {
    var key: AlignmentKey { get }
}

extension AlignmentGuide {
    var fraction: CGFloat {
        assertUnimplemented()
    }
    
    var viewDebugValue: Any {
        assertUnimplemented()
    }
}

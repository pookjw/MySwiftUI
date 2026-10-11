private import CoreGraphics

struct PathSet {
    private var elements: [PathSet.Element]
    private var smoothness: CGFloat
}

extension PathSet {
    struct Element {
        private var path: Path
        private var tags: _ShapeSet.Tags
        private var operation: _ShapeSet.Operation
        private var options: _ShapeSet.Element.Options
    }
}

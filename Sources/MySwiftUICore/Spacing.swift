internal import CoreGraphics

package struct Spacing {
    private var minima: [Spacing.Key: Spacing.Value]
}

extension Spacing {
    struct Category {
        private var base: UniqueID
    }
    
    struct Key {
        private var category: Spacing.Category
        private var edge: AbsoluteEdge
    }
    
    struct TextMetrics {
        private var ascend: CGFloat
        private var descend: CGFloat
        private var leading: CGFloat
        private var pixelLength: CGFloat
    }
    
    enum Value {
        case distance(CGFloat)
        case topTextMetrics(Spacing.TextMetrics)
        case bottomTextMetrics(Spacing.TextMetrics)
    }
}

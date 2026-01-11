private import CoreGraphics

public struct _LayoutTraits: Equatable {
    private var width: _LayoutTraits.Dimension
    private var height: _LayoutTraits.Dimension
}

@available(*, unavailable)
extension _LayoutTraits: Sendable {
}

extension _LayoutTraits: CustomStringConvertible {
    public var description: String {
        fatalError("TODO")
    }
}

extension _LayoutTraits {
    struct Dimension: Equatable {
        private var min: CGFloat
        private var ideal: CGFloat
        private var max: CGFloat
    }
    
    struct FlexibilityEstimate: Comparable {
        private let minLength: CGFloat
        private let maxLength: CGFloat
        
        static func < (lhs: _LayoutTraits.FlexibilityEstimate, rhs: _LayoutTraits.FlexibilityEstimate) -> Bool {
            fatalError("TODO")
        }
    }
}

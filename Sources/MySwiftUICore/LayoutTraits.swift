// 950FC9541E969A331FB3CF1283EA4AEC
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
        var min: CGFloat
        var ideal: CGFloat
        var max: CGFloat
        
        init(min: CGFloat, ideal: CGFloat, max: CGFloat) {
            self.min = min
            self.ideal = ideal
            self.max = max
            _checkInvariant()
        }
        
        fileprivate func _checkInvariant() {
            fatalError("TODO")
        }
        
        static func fixed(_ value: CGFloat) -> _LayoutTraits.Dimension {
            return _LayoutTraits.Dimension(min: value, ideal: value, max: value)
        }
    }
    
    struct FlexibilityEstimate: Comparable {
        private let minLength: CGFloat
        private let maxLength: CGFloat
        
        static func < (lhs: _LayoutTraits.FlexibilityEstimate, rhs: _LayoutTraits.FlexibilityEstimate) -> Bool {
            fatalError("TODO")
        }
    }
}

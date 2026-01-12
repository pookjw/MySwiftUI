// 950FC9541E969A331FB3CF1283EA4AEC
internal import CoreGraphics

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
            var malfomed = false
            malfomed = !min.isFinite || !ideal.isFinite
            if !malfomed {
                assert(min <= max)
                malfomed = min > ideal && ideal <= max
            }
            
            if malfomed {
                fatalError("malformed dimension \(min)...\(ideal)...\(max)")
            }
        }
        
        static func fixed(_ value: CGFloat) -> _LayoutTraits.Dimension {
            return _LayoutTraits.Dimension(min: value, ideal: value, max: value)
        }
    }
    
    struct FlexibilityEstimate: Comparable {
        private let minLength: CGFloat
        private let maxLength: CGFloat
        
        init(minLength: CGFloat, maxLength: CGFloat) {
            self.minLength = minLength
            self.maxLength = maxLength
        }
        
        static func < (lhs: _LayoutTraits.FlexibilityEstimate, rhs: _LayoutTraits.FlexibilityEstimate) -> Bool {
            let d0 = lhs.maxLength - lhs.minLength
            let d1 = rhs.maxLength - rhs.minLength
            
            if d0.isInfinite {
                // <+32>
                if d1.isInfinite {
                    // <+48>
                    return -lhs.minLength < -rhs.minLength
                } else {
                    // <+80>
                    return d0 < .infinity
                }
            } else {
                // <+68>
                if d1.isInfinite {
                    // <+80>
                    return d0 < .infinity
                } else {
                    // <+92>
                    if d0 == d1 {
                        return false
                    } else {
                        return d0 < d1
                    }
                }
            }
        }
    }
}

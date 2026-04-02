// 950FC9541E969A331FB3CF1283EA4AEC
package import CoreGraphics

public struct _LayoutTraits : Equatable {
    var width: _LayoutTraits.Dimension
    var height: _LayoutTraits.Dimension
    
    init() {
        width = _LayoutTraits.Dimension(min: 0, ideal: 0, max: .infinity)
        height = _LayoutTraits.Dimension(min: 0, ideal: 0, max: .infinity)
    }
    
    package init(width: _LayoutTraits.Dimension, height: _LayoutTraits.Dimension) {
        self.width = width
        self.height = height
    }
    
    static func fixed(_ value: CGFloat) -> _LayoutTraits.Dimension {
        assertUnimplemented()
    }
}

extension _LayoutTraits {
    package var idealSize: CGSize {
        get {
            return CGSize(width: width.ideal, height: height.ideal)
        }
        set {
            width.ideal = newValue.width
            height.ideal = newValue.height
        }
    }
    
    var minSize: CGSize {
        get {
            return CGSize(width: width.min, height: height.min)
        }
        set {
            width.min = newValue.width
            height.min = newValue.height
        }
    }
    
    var maxSize: CGSize {
        get {
            return CGSize(width: width.max, height: height.max)
        }
        set {
            width.max = newValue.width
            height.max = newValue.height
        }
    }
}

@available(*, unavailable)
extension _LayoutTraits : Sendable {
}

extension _LayoutTraits : CustomStringConvertible {
    public var description: String {
        assertUnimplemented()
    }
}

extension _LayoutTraits {
    package struct Dimension : Equatable {
        var min: CGFloat {
            didSet {
                _checkInvariant()
            }
        }
        
        var ideal: CGFloat {
            didSet {
                _checkInvariant()
            }
        }
        
        var max: CGFloat {
            didSet {
                _checkInvariant()
            }
        }
        
        package init(min: CGFloat, ideal: CGFloat, max: CGFloat) {
            self.min = min
            self.ideal = ideal
            self.max = max
            _checkInvariant()
        }
        
        fileprivate func _checkInvariant() {
            let normal = (min.isFinite && min >= 0) && (ideal < .infinity) && (min <= max) && (min <= ideal) && (ideal <= max)
            
            if !normal {
                assertionFailure("malformed dimension \(min)...\(ideal)...\(max)")
            }
        }
        
        static func fixed(_ value: CGFloat) -> _LayoutTraits.Dimension {
            return _LayoutTraits.Dimension(min: value, ideal: value, max: value)
        }
    }
    
    struct FlexibilityEstimate : Comparable {
        private let minLength: CGFloat
        private let maxLength: CGFloat
        
        init(minLength: CGFloat, maxLength: CGFloat) {
            self.minLength = minLength
            self.maxLength = maxLength
        }
        
        static func < (lhs : _LayoutTraits.FlexibilityEstimate, rhs : _LayoutTraits.FlexibilityEstimate) -> Bool {
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

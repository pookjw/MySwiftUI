#warning("TODO")
package import CoreGraphics

package struct ViewDepth: Equatable, Animatable {
    package static func fixed(_ depth: CGFloat) -> ViewDepth {
        return ViewDepth(depth, proposal: depth)
    }
    
    private var value: CGFloat
    private var _proposal: CGFloat
    
    init(_ value: CGFloat, proposal: CGFloat) {
        self.value = value
        self._proposal = proposal
    }
    
    var propsal: CGFloat? {
        get {
            if _proposal == .infinity {
                return nil
            } else {
                return _proposal
            }
        }
        set {
            if let newValue {
                _proposal = newValue
            } else {
                _proposal = .infinity
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    package var animatableData: CGFloat {
        get {
            return value
        }
        set {
            value = newValue
        }
        _modify {
            yield &value
        }
    }
}

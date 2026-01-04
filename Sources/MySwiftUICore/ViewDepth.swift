package import CoreGraphics

package struct ViewDepth: Equatable, Animatable {
    package static func == (lhs: ViewDepth, rhs: ViewDepth) -> Bool {
        guard lhs.value == rhs.value else {
            return false
        }
        
        if lhs._proposal.isNaN && rhs._proposal.isNaN {
            return true
        } else {
            return lhs._proposal == rhs._proposal
        }
    }
    
    package static func fixed(_ depth: CGFloat) -> ViewDepth {
        return ViewDepth(depth, proposal: depth)
    }
    
    var value: CGFloat
    private var _proposal: CGFloat
    
    init(_ value: CGFloat, proposal: CGFloat?) {
        self.value = value
        if let proposal {
            self._proposal = proposal
        } else {
            self._proposal = .nan
        }
    }
    
    var proposal: CGFloat? {
        get {
            if _proposal.isNaN {
                return nil
            } else {
                return _proposal
            }
        }
        set {
            if let newValue {
                _proposal = newValue
            } else {
                _proposal = .nan
            }
        }
        _modify {
            var proposal: CGFloat?
            if _proposal.isNaN {
                proposal = nil
            } else {
                proposal = _proposal
            }
            
            yield &proposal
            
            if let proposal {
                _proposal = proposal
            } else {
                _proposal = .nan
            }
        }
    }
    
    package var animatableData: CGFloat {
        get {
            return value
        }
        set {
            value = newValue
            didSetAnimatableData(newValue)
        }
        _modify {
            var newValue = value
            yield &newValue
            didSetAnimatableData(newValue)
        }
    }
    
    mutating func didSetAnimatableData(_ value: CGFloat) {
        _proposal = value
    }
}

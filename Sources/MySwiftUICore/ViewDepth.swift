#warning("TODO")
internal import CoreGraphics

struct ViewDepth {
    private var value: CGFloat = 0
    private var _proposal: CGFloat = 0
    
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
}

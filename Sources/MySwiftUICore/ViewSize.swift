package import CoreGraphics

package struct ViewSize: Equatable, Animatable {
    package static var zero: ViewSize {
        return ViewSize(.zero, proposal: _ProposedSize(width: 0, height: 0))
    }
    
    static let invalidValue = ViewSize(
        CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity),
        proposal: _ProposedSize(width: -CGFloat.infinity, height: -CGFloat.infinity)
    )
    
    static func fixed(_ size: CGSize) -> ViewSize {
        fatalError("TODO")
    }
    
    var value: CGSize
    private var _proposal: CGSize
    
    init(_ value: CGSize, proposal: _ProposedSize) {
        self.value = value
        self._proposal = CGSize(width: proposal.width ?? .nan, height: proposal.height ?? .nan)
    }
    
    init(_ size3D: ViewSize3D) {
        let size2D = size3D.size2D
        self.value = size2D.value
        self._proposal = size2D._proposal
    }
    
    var width: CGFloat {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    var height: CGFloat {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    var proposal: _ProposedSize {
        get {
            return _ProposedSize(
                width: _proposal.width.isNaN ? nil : _proposal.width,
                height: _proposal.height.isNaN ? nil : _proposal.height
            )
        }
        set {
            if let width = newValue.width {
                _proposal.width = width
            } else {
                _proposal.width = .nan
            }
            
            if let height = newValue.height {
                _proposal.height = height
            } else {
                _proposal.height = .nan
            }
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    subscript(_ axis: Axis) -> CGFloat {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    package var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    mutating func didSetAnimatableData(_ newValue: CGSize) {
        fatalError("TODO")
    }
    
    func insert(by: EdgeInsets) -> ViewSize {
        fatalError("TODO")
    }
}

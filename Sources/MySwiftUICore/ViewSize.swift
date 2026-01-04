package import CoreGraphics

package struct ViewSize: Equatable, Animatable {
    package static func == (lhs: ViewSize, rhs: ViewSize) -> Bool {
        return lhs.value == rhs.value && lhs.proposal == rhs.proposal
    }
    
    package static var zero: ViewSize {
        return ViewSize(.zero, proposal: _ProposedSize(width: 0, height: 0))
    }
    
    static let invalidValue = ViewSize(
        CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity),
        proposal: _ProposedSize(width: -CGFloat.infinity, height: -CGFloat.infinity)
    )
    
    static func fixed(_ size: CGSize) -> ViewSize {
        return ViewSize(size, proposal: _ProposedSize(width: size.width, height: size.height))
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
            return value.width
        }
        set {
            value.width = newValue
        }
        _modify {
            yield &value.width
        }
    }
    
    var height: CGFloat {
        get {
            return value.height
        }
        set {
            value.height = newValue
        }
        _modify {
            yield &value.height
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
    }
    
    subscript(_ axis: Axis) -> CGFloat {
        get {
            switch axis {
            case .horizontal:
                return value.width
            case .vertical:
                return value.height
            }
        }
        set {
            switch axis {
            case .horizontal:
                value.width = newValue
            case .vertical:
                value.height = newValue
            }
        }
        _modify {
            switch axis {
            case .horizontal:
                yield &value.width
            case .vertical:
                yield &value.height
            }
        }
    }
    
    package var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            return AnimatableData(value.width, value.height)
        }
        set {
            let size = CGSize(width: newValue.first, height: newValue.second)
            value = size
            didSetAnimatableData(size)
        }
        _modify {
            var value = AnimatableData(value.width, value.height)
            yield &value
            let newValue = CGSize(width: value.first, height: value.second)
            self.value = newValue
            didSetAnimatableData(newValue)
        }
    }
    
    mutating func didSetAnimatableData(_ newValue: CGSize) {
        _proposal = newValue
    }
    
    func inset(by insets: EdgeInsets) -> ViewSize {
        var width = value.width - insets.leading - insets.trailing
        if width.isNaN {
            width = 0
        } else if width < 0 {
            width = 0
        }
        
        var height = value.height - insets.top - insets.bottom
        if height.isNaN {
            height = 0
        } else if height < 0 {
            height = 0
        }
        
        var proposalWidth = _proposal.width - insets.leading - insets.trailing
        if proposalWidth.isNaN {
            proposalWidth = .nan
        } else if proposalWidth < 0 {
            proposalWidth = 0
        }
        
        var proposalHeight = _proposal.height - insets.top - insets.bottom
        if proposalHeight.isNaN {
            proposalHeight = .nan
        } else if proposalHeight < 0 {
            proposalHeight = 0
        }
        
        return ViewSize(
            CGSize(width: width, height: height),
            proposal: _ProposedSize(width: proposalWidth, height: proposalHeight)
        )
    }
}

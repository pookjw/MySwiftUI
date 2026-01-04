internal import Spatial
internal import CoreGraphics

struct ViewSize3D {
    static var zero: ViewSize3D {
        return ViewSize3D(.zero, proposal: _ProposedSize3D(width: 0, height: 0, depth: 0))
    }
    
    static let invalidValue = ViewSize3D(-.infinity, proposal: _ProposedSize3D(-.infinity))
    
    static func fixed(_ size: Size3D) -> ViewSize3D {
        return ViewSize3D(size, proposal: _ProposedSize3D(size))
    }
    
    var value: Size3D
    private var _proposal: Size3D
    
    var width: CGFloat {
        get {
            return value.width
        }
        set {
            value.width = newValue
        }
        _modify {
            var width = CGFloat(value.width)
            yield &width
            value.width = width
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
            var height = CGFloat(value.height)
            yield &height
            value.height = height
        }
    }
    
    var depth: CGFloat {
        get {
            return value.depth
        }
        set {
            value.depth = newValue
        }
        _modify {
            var depth = CGFloat(value.depth)
            yield &depth
            value.depth = depth
        }
    }
    
    var proposal: _ProposedSize3D {
        get {
            return _ProposedSize3D(
                width: _proposal.width.isNaN ? nil : _proposal.width,
                height: _proposal.height.isNaN ? nil : _proposal.height,
                depth: _proposal.depth.isNaN ? nil : _proposal.depth
            )
        }
        set {
            _proposal.width = newValue.width ?? .nan
            _proposal.height = newValue.height ?? .nan
            _proposal.depth = newValue.depth ?? .nan
        }
    }
    
    var viewDepth: ViewDepth {
        get {
            return ViewDepth(
                value.depth,
                proposal: _proposal.isNaN ? .nan : _proposal.depth
            )
        }
        set {
            value.depth = newValue.value
            
            if let proposal = newValue.proposal {
                _proposal.depth = proposal.isNaN ? .nan : proposal
            } else {
                _proposal.depth = .nan
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
                value.depth = newValue
            }
        }
        _modify {
            switch axis {
            case .horizontal:
                var value = CGFloat(value.width)
                yield &value
                self.value.width = value
            case .vertical:
                var value = CGFloat(value.height)
                yield &value
                self.value.depth = value
            }
        }
    }
    
    subscript(_ axis: _Axis3D) -> CGFloat {
        get {
            switch axis {
            case .horizontal:
                return value.width
            case .vertical:
                return value.height
            case .depth:
                return value.depth
            }
        }
        set {
            switch axis {
            case .horizontal:
                value.width = newValue
            case .vertical:
                value.height = newValue
            case .depth:
                value.depth = newValue
            }
        }
        _modify {
            switch axis {
            case .horizontal:
                var width = CGFloat(value.width)
                yield &width
                value.width = width
            case .vertical:
                var height = CGFloat(value.height)
                yield &height
                value.height = height
            case .depth:
                var depth = CGFloat(value.depth)
                yield &depth
                value.depth = depth
            }
        }
    }
    
    func inset(by insets: EdgeInsets3D) -> ViewSize3D {
        return ViewSize3D(
            value.inset(by: insets),
            proposal: proposal.inset(by: insets)
        )
    }
    
    init(_ value: Size3D, proposal: _ProposedSize3D) {
        self.value = value
        self._proposal = Size3D(
            width: proposal.width ?? .nan,
            height: proposal.height ?? .nan,
            depth: proposal.depth ?? .nan
        )
    }
    
    init(_ viewSize: ViewSize, depth: CGFloat, proposedDepth: CGFloat?) {
        self.value = Size3D(width: viewSize.width, height: viewSize.height, depth: depth)
        let proposal = viewSize.proposal
        self._proposal = Size3D(
            width: proposal.width ?? .nan,
            height: proposal.height ?? .nan,
            depth: proposedDepth ?? .nan
        )
    }
    
    init(_ viewSize: ViewSize, usingDepthFrom viewSize3D: ViewSize3D) {
        self.value = Size3D(width: viewSize.width, height: viewSize.height, depth: viewSize3D.value.depth)
        let proposal = viewSize.proposal
        self._proposal = Size3D(
            width: proposal.width ?? .nan,
            height: proposal.height ?? .nan,
            depth: viewSize3D.proposal.depth ?? .nan
        )
    }
    
    init(_ viewSize: ViewSize, depth: ViewDepth) {
        self.value = Size3D(width: viewSize.width, height: viewSize.height, depth: depth.value)
        let proposal = viewSize.proposal
        self._proposal = Size3D(
            width: proposal.width ?? .nan,
            height: proposal.height ?? .nan,
            depth: depth.proposal ?? .nan
        )
    }
    
    var size2D: ViewSize {
        get {
            return ViewSize(
                CGSize(width: value.width, height: value.height),
                proposal: _ProposedSize(width: _proposal.width, height: _proposal.height)
            )
        }
        set {
            value.width = newValue.value.width
            value.height = newValue.value.height
            let proposal = newValue.proposal
            self.proposal.width = proposal.width
            self.proposal.height = proposal.height
        }
    }
}

extension ViewSize3D: Equatable {
    static func == (lhs: ViewSize3D, rhs: ViewSize3D) -> Bool {
        return lhs.value == rhs.value && lhs.proposal == rhs.proposal
    }
}

extension ViewSize3D: Animatable {
    var animatableData: Vector3D {
        get {
            return Vector3D(x: value.width, y: value.height, z: value.depth)
        }
        set {
            let newValue = Size3D(width: newValue.x, height: newValue.y, depth: newValue.z)
            self.value = newValue
            didSetAnimatableData(newValue)
        }
    }
    
    mutating func didSetAnimatableData(_ newValue: Size3D) {
        _proposal = newValue
    }
}

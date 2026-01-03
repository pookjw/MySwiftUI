internal import Spatial
internal import CoreGraphics

struct ViewSize3D {
    static var zero: ViewSize3D {
        return ViewSize3D(.zero, proposal: _ProposedSize3D(.zero))
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
    
    subscript(_ axis: _Axis3D) -> CGFloat {
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
    
    func inset(by insets: EdgeInsets3D) -> ViewSize3D {
        fatalError("TODO")
    }
    
    init(_ value: Size3D, proposal: _ProposedSize3D) {
        self.value = value
        self._proposal = Size3D(
            width: proposal.width ?? .nan,
            height: proposal.height ?? .nan,
            depth: proposal.depth ?? .nan
        )
    }
    
    init(_: ViewSize, depth: CGFloat, proposedDepth: CGFloat?) {
        fatalError("TODO")
    }
    
    init(_: ViewSize, usingDepthFrom: ViewSize3D) {
        fatalError("TODO")
    }
    
    init(_: ViewSize, depth: ViewDepth) {
        fatalError("TODO")
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
        fatalError("TODO")
    }
}

extension ViewSize3D: Animatable {
    var animatableData: Vector3D {
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
    
    mutating func didSetAnimatableData(_ newValue: Size3D) {
        _proposal = newValue
    }
}

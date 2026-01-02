public import CoreGraphics

public struct ViewDimensions {
    public var width: CGFloat {
      fatalError("TODO")
    }
    
    public var height: CGFloat {
        fatalError("TODO")
    }
    
    public subscript(guide: HorizontalAlignment) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript(guide: VerticalAlignment) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    init(guideComputer: LayoutComputer, size: ViewSize) {
        fatalError("TODO")
    }
    
    init(guideComputer: LayoutComputer, size: CGSize, proposal: _ProposedSize) {
        fatalError("TODO")
    }
    
    let guideComputer: LayoutComputer
    var size: ViewSize
    
    var depth: CGFloat {
        fatalError("TODO")
    }
    
    subscript(_: DepthAlignment) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    subscript(explicit: DepthAlignment) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
}

@available(*, unavailable)
extension ViewDimensions: Sendable {}

extension ViewDimensions: Equatable {
    public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool {
        fatalError("TODO")
    }
}

extension ViewDimensions {
    subscript(explicit: AlignmentKey) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    static var invalidValue: ViewDimensions {
        fatalError("TODO")
    }
    
    static var zero: ViewDimensions {
        fatalError("TODO")
    }
    
    func at(_: CGPoint) -> ViewGeometry {
        fatalError("TODO")
    }
    
    func centered(in: CGSize) -> ViewGeometry {
        fatalError("TODO")
    }
    
    init(_ dimensions3D: ViewDimensions3D) {
        fatalError("TODO")
    }
}

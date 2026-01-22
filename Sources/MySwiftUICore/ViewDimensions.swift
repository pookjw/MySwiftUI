public import CoreGraphics

public struct ViewDimensions {
    public var width: CGFloat {
        return size.width
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    var depth: CGFloat {
        return 0
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
        self.guideComputer = guideComputer
        self.size = size
    }
    
    init(guideComputer: LayoutComputer, size: CGSize, proposal: _ProposedSize) {
        self.guideComputer = guideComputer
        self.size = ViewSize(size, proposal: proposal)
    }
    
    let guideComputer: LayoutComputer
    var size: ViewSize
    
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
}

extension ViewDimensions {
    subscript(explicit: AlignmentKey) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    static nonisolated(unsafe) let invalidValue = ViewDimensions(guideComputer: .defaultValue, size: .invalidValue)
    
    static var zero: ViewDimensions {
        fatalError("TODO")
    }
    
    func at(_: CGPoint) -> ViewGeometry {
        fatalError("TODO")
    }
    
    func centered(in size: CGSize) -> ViewGeometry {
        return ViewGeometry(
            origin: CGPoint((size - self.size.value) * 0.5 + .zero),
            dimensions: self
        )
    }
    
    init(_ dimensions3D: ViewDimensions3D) {
        fatalError("TODO")
    }
}

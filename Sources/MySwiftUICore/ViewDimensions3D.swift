public import CoreGraphics
internal import Spatial

public struct ViewDimensions3D {
    let guideComputer: LayoutComputer
    var size: ViewSize3D
    
    public var width: CGFloat {
        return size.width
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    public var depth: CGFloat {
        return size.depth
    }
    
    public subscript(guide: HorizontalAlignment) -> CGFloat {
        fatalError("TODO")
    }
    
    public subscript(guide: VerticalAlignment) -> CGFloat {
        fatalError("TODO")
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
    
    init(guideComputer: LayoutComputer, size: Size3D, proposal: _ProposedSize3D) {
        self.guideComputer = guideComputer
        self.size = ViewSize3D(size, proposal: proposal)
    }
    
    init(guideComputer: LayoutComputer, size: ViewSize3D) {
        self.guideComputer = guideComputer
        self.size = size
    }
}

extension ViewDimensions3D: Sendable {}

extension ViewDimensions3D {
    public subscript(guide: DepthAlignment) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript(explicit guide: DepthAlignment) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    subscript(_ key: AlignmentKey) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    subscript(explicit key: AlignmentKey) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    subscript(_ key: DepthAlignmentKey) -> CGFloat {
        get {
            fatalError("TODO")
        }
    }
    
    subscript(explicit: DepthAlignmentKey) -> CGFloat? {
        get {
            fatalError("TODO")
        }
    }
    
    static let invalidValue = ViewDimensions3D(guideComputer: .defaultValue, size: .invalidValue)
    static let zero = ViewDimensions3D(guideComputer: .defaultValue, size: .zero)
}

extension ViewDimensions3D: Equatable {
    public static func == (lhs: ViewDimensions3D, rhs: ViewDimensions3D) -> Bool {
        return lhs.size == rhs.size && lhs.guideComputer == rhs.guideComputer
    }
}

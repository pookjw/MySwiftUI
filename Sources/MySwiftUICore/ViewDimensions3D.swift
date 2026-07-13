public import CoreGraphics
package import Spatial

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
        assertUnimplemented()
    }
    
    public subscript(guide: VerticalAlignment) -> CGFloat {
        assertUnimplemented()
    }
    
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? {
        get {
            assertUnimplemented()
        }
    }
    
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? {
        get {
            assertUnimplemented()
        }
    }
    
    package init(guideComputer: LayoutComputer, size: Size3D, proposal: _ProposedSize3D) {
        self.guideComputer = guideComputer
        self.size = ViewSize3D(size, proposal: proposal)
    }
    
    init(guideComputer: LayoutComputer, size: ViewSize3D) {
        self.guideComputer = guideComputer
        self.size = size
    }
}

extension ViewDimensions3D : Sendable {}

extension ViewDimensions3D {
    public subscript(guide: DepthAlignment) -> CGFloat {
        return self[guide.depthKey]
    }
    
    public subscript(explicit guide: DepthAlignment) -> CGFloat? {
        get {
            assertUnimplemented()
        }
    }
    
    subscript(_ key: AlignmentKey) -> CGFloat {
        let dimensions = ViewDimensions(self)
        return key.id.defaultValue(in: dimensions)
    }
    
    subscript(explicit key: AlignmentKey) -> CGFloat? {
        get {
            assertUnimplemented()
        }
    }
    
    subscript(_ key: DepthAlignmentKey) -> CGFloat {
        if let depth = self.guideComputer.explicitDepthAlignment(key, at: self.size) {
            return depth
        } else {
            return key.id.defaultValue(in: self)
        }
    }
    
    subscript(explicit: DepthAlignmentKey) -> CGFloat? {
        get {
            assertUnimplemented()
        }
    }
    
    static let invalidValue = ViewDimensions3D(guideComputer: .defaultValue, size: .invalidValue)
    static let zero = ViewDimensions3D(guideComputer: .defaultValue, size: .zero)
}

extension ViewDimensions3D : Equatable {
    public static func == (lhs: ViewDimensions3D, rhs: ViewDimensions3D) -> Bool {
        return lhs.size == rhs.size && lhs.guideComputer == rhs.guideComputer
    }
}

public import CoreGraphics

public struct ViewDimensions3D {
    private let guideComputer: LayoutComputer
    private var size: ViewSize3D
    
    public var width: CoreFoundation.CGFloat {
        fatalError("TODO")
    }
    
    public var height: CoreFoundation.CGFloat {
        fatalError("TODO")
    }
    
    public var depth: CoreFoundation.CGFloat {
        fatalError("TODO")
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
}

// 원래는 그냥 Sendable
extension ViewDimensions3D: @unchecked Sendable {}

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
}

extension ViewDimensions3D: Equatable {
    public static func == (lhs: ViewDimensions3D, rhs: ViewDimensions3D) -> Swift.Bool {
        fatalError("TODO")
    }
}

internal import CoreGraphics
internal import Spatial

struct _ProposedSize: Hashable {
    static let zero = _ProposedSize(width: 0, height: 0)
    static let infinity = _ProposedSize(width: .infinity, height: .infinity)
    static let unspecified = _ProposedSize(width: nil, height: nil)
    
    var width: CGFloat?
    var height: CGFloat?
    
    init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
    
    init() {
        width = nil
        height = nil
    }
    
    func fixingUnspecifiedDimensions(at size: CGSize) -> CGSize {
        return CGSize(width: width ?? size.width, height: height ?? size.height)
    }
    
    func fixingUnspecifiedDimensions() -> CGSize {
        return CGSize(width: width ?? 10, height: height ?? 10)
    }
}

extension _ProposedSize {
    init(_ size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
    
    func inset(by insets: EdgeInsets) -> _ProposedSize {
        var copy = self
        if let width {
            copy.width = max(0, width - insets.leading - insets.trailing)
        }
        if let height {
            copy.height = max(0, height - insets.top - insets.bottom)
        }
        return copy
    }
    
    subscript(_ axis: Axis) -> CGFloat? {
        get {
            switch axis {
            case .horizontal:
                return width
            case .vertical:
                return height
            }
        }
        set {
            switch axis {
            case .horizontal:
                width = newValue
            case .vertical:
                height = newValue
            }
        }
        _modify {
            switch axis {
            case .horizontal:
                yield &width
            case .vertical:
                yield &height
            }
        }
    }
    
    init(_ value: CGFloat?, in axis: Axis, by other: CGFloat?) {
        switch axis {
        case .horizontal:
            width = value
            height = other
        case .vertical:
            width = other
            height = value
        }
    }
    
    init(_ proposedSize: ProposedViewSize) {
        width = proposedSize.width
        height = proposedSize.height
    }
    
    init(_ proposedSize: _ProposedSize3D) {
        width = proposedSize.width
        height = proposedSize.height
    }
    
    init(_ size: Size3D) {
        width = size.width
        height = size.height
    }
}

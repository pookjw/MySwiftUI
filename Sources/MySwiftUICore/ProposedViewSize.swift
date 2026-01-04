public import CoreGraphics

@frozen public struct ProposedViewSize: Equatable {
    public var width: CGFloat?
    public var height: CGFloat?
    
    public static let zero = ProposedViewSize(width: 0, height: 0)
    public static let unspecified = ProposedViewSize(width: nil, height: nil)
    public static let infinity = ProposedViewSize(width: .infinity, height: .infinity)
    
    @inlinable public init(width: CGFloat?, height: CGFloat?) {
        (self.width, self.height) = (width, height)
    }
    
    @inlinable public init(_ size: CGSize) {
        self.init(width: size.width, height: size.height)
    }
    
    @inlinable public func replacingUnspecifiedDimensions(by size: CGSize = CGSize(width: 10, height: 10)) -> CGSize {
        return CGSize(
            width: width ?? size.width,
            height: height ?? size.height
        )
    }
    
    init(_ size: _ProposedSize) {
        width = size.width
        height = size.height
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
}

extension ProposedViewSize: Sendable {}
extension ProposedViewSize: BitwiseCopyable {}

public import CoreGraphics

public struct ViewSpacing: Sendable {
    var spacing: Spacing
    private var layoutDirection: LayoutDirection?
    
    public static let zero: ViewSpacing = {
        fatalError("TODO")
    }()
    
    public init() {
        fatalError("TODO")
    }
    
    public mutating func formUnion(_ other: ViewSpacing, edges: Edge.Set = .all) {
        fatalError("TODO")
    }
    
    public func union(_ other: ViewSpacing, edges: Edge.Set = .all) -> ViewSpacing {
        fatalError("TODO")
    }
    
    public func distance(to next: ViewSpacing, along axis: Axis) -> CGFloat {
        if let distance = self.spacing.distanceToSuccessorView(along: axis, layoutDirection: layoutDirection ?? .leftToRight, preferring: next.spacing) {
            return distance
        } else {
            let defaultValue = Spacing.defaultValue
            switch axis {
            case .horizontal:
                return defaultValue.width
            case .vertical:
                return defaultValue.height
            }
        }
    }
}

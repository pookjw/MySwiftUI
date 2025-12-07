public import CoreGraphics

public struct ViewSpacing: Sendable {
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
        fatalError("TODO")
    }
}

#warning("TODO")
private import CoreGraphics

struct ViewGraphGeometryObservers<T: ViewGraphGeometryMeasurer> {
    private var store: [CGSize: ViewGraphGeometryObservers<T>] = [:]
}

protocol ViewGraphGeometryMeasurer {
    associatedtype Proposal
    associatedtype Size
    
    static func measure(given: Proposal, in: ViewGraph) -> Size
    static func measure(proposal: Proposal, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size
    static var invalidValue: Size { get }
}

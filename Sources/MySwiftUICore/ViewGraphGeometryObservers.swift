#warning("TODO")
private import CoreGraphics

struct ViewGraphGeometryObservers<T: ViewGraphGeometryMeasurer> {
    private var store: [CGSize: ViewGraphGeometryObservers<T>] = [:]
}

protocol ViewGraphGeometryMeasurer {
    associatedtype Proposal
    associatedtype Size
    
    func measure(given: Proposal, in: ViewGraph) -> Size
    func measure(proposal: Proposal, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size
    var invalidValue: Size { get }
}

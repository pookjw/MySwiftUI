#warning("TODO")
private import CoreGraphics

struct ViewGraphGeometryObservers<T: ViewGraphGeometryMeasurer> {
    private var store: [CGSize: ViewGraphGeometryObservers<T>] = [:]
    
    func needsUpdate(graph: ViewGraph) -> Bool {
        guard !graph.data.isHiddenForReuse else {
            return false
        }
        
        fatalError("TODO")
    }
    
    func notify() {
        fatalError("TODO")
    }
}

protocol ViewGraphGeometryMeasurer {
    associatedtype Proposal
    associatedtype Size
    
    static func measure(given: Proposal, in: ViewGraph) -> Size
    static func measure(proposal: Proposal, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size
    static var invalidValue: Size { get }
}

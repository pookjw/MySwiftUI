#warning("TODO")
internal import CoreGraphics

struct SizeThatFitsMeasurer: ViewGraphGeometryMeasurer {
    static func measure(given: _ProposedSize, in graph: ViewGraph) -> CGSize {
        fatalError("TODO")
    }
    
    static func measure(proposal: _ProposedSize, layoutComputer: LayoutComputer, insets: EdgeInsets) -> CGSize {
        fatalError("TODO")
    }
    
    static let invalidValue = CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity)
}

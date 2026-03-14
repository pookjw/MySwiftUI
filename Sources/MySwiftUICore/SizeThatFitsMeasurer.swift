internal import CoreGraphics

struct SizeThatFitsMeasurer: ViewGraphGeometryMeasurer {
    static func measure(given: _ProposedSize, in graph: ViewGraph) -> CGSize {
        assertUnimplemented()
    }
    
    static func measure(proposal: _ProposedSize, layoutComputer: LayoutComputer, insets: EdgeInsets) -> CGSize {
        assertUnimplemented()
    }
    
    static let invalidValue = CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity)
}

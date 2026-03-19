package import CoreGraphics

package struct SizeThatFitsMeasurer: ViewGraphGeometryMeasurer {
    package static func measure(given: _ProposedSize, in graph: ViewGraph) -> CGSize {
        assertUnimplemented()
    }
    
    package static func measure(proposal: _ProposedSize, layoutComputer: LayoutComputer, insets: EdgeInsets) -> CGSize {
        assertUnimplemented()
    }
    
    package static let invalidValue = CGSize(width: -CGFloat.infinity, height: -CGFloat.infinity)
}

package import Spatial
package import CoreGraphics

package struct VolumeThatFitsMeasurer : ViewGraphGeometryMeasurer {
    package static func measure(given: _ProposedSize3D, in graph: ViewGraph) -> Size3D {
        graph.sizeThatFitsObservers
        assertUnimplemented()
    }
    
    package static func measure(proposal: _ProposedSize3D, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size3D {
        assertUnimplemented()
    }
    
    package static let invalidValue = Size3D(width: -CGFloat.infinity, height: -CGFloat.infinity, depth: -CGFloat.infinity)
}

#warning("TODO")
internal import _UIKitPrivate
private import Spatial
private import CoreGraphics

struct VolumeThatFitsMeasurer: ViewGraphGeometryMeasurer {
    static func measure(given: _ProposedSize3D, in: ViewGraph) -> Size3D {
        fatalError("TODO")
    }
    
    static func measure(proposal: _ProposedSize3D, layoutComputer: LayoutComputer, insets: EdgeInsets) -> Size3D {
        fatalError("TODO")
    }
    
    static let invalidValue = Size3D(width: -CGFloat.infinity, height: -CGFloat.infinity, depth: -CGFloat.infinity)
}

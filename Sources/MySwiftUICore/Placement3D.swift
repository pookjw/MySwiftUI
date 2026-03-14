internal import CoreGraphics
internal import Spatial

struct Placement3D: Equatable {
    var proposedSize_: _ProposedSize3D
    var anchor: UnitPoint3D
    var anchorPosition: Point3D
    
    init(proposedSize: _ProposedSize3D, anchor: UnitPoint3D, anchorPosition: Point3D) {
        assertUnimplemented()
    }
    
    init(proposedSize: _ProposedSize3D, aligning: UnitPoint3D, in: Size3D) {
        assertUnimplemented()
    }
    
    init(placement: _Placement, depthPlacement: DepthPlacement) {
        assertUnimplemented()
    }
    
    func origin3D(childVolume: Size3D) -> Point3D {
        assertUnimplemented()
    }
}

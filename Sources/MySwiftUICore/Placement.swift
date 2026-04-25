internal import CoreGraphics

struct _Placement : Equatable {
    var proposedSize_: _ProposedSize
    var anchor: UnitPoint
    var anchorPosition: CGPoint
    
    init(proposedSize: _ProposedSize, aligning: UnitPoint, in: CGSize) {
        assertUnimplemented()
    }
    
    init(proposedSize: CGSize, anchoring: UnitPoint, at: CGPoint) {
        assertUnimplemented()
    }
    
    init(proposedSize: _ProposedSize, at: CGPoint) {
        assertUnimplemented()
    }
    
    init(proposedSize: _ProposedSize, anchoring anchor: UnitPoint, at anchorPosition: CGPoint) {
        self.proposedSize_ = proposedSize
        self.anchor = anchor
        self.anchorPosition = anchorPosition
    }
    
    init(proposedSize: CGSize, aligning: UnitPoint, in: CGSize) {
        assertUnimplemented()
    }
}

extension _Placement {
    init(_ placement3D: Placement3D) {
        assertUnimplemented()
    }
    
    func frameOrigin(childSize: CGSize) -> CGPoint {
        assertUnimplemented()
    }
}

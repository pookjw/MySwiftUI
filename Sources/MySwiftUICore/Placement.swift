internal import CoreGraphics

package struct _Placement : Equatable {
    var proposedSize_: _ProposedSize
    var anchor: UnitPoint
    var anchorPosition: CGPoint
    
    init(proposedSize: _ProposedSize, aligning: UnitPoint, in size: CGSize) {
        self.proposedSize_ = proposedSize
        self.anchor = aligning
        self.anchorPosition = CGPoint(x: aligning.x * size.width, y: aligning.y * size.height)
    }
    
    init(proposedSize: CGSize, anchoring: UnitPoint, at position: CGPoint) {
        self.proposedSize_ = _ProposedSize(proposedSize)
        self.anchor = anchoring
        self.anchorPosition = position
    }
    
    init(proposedSize: _ProposedSize, at position: CGPoint) {
        self.proposedSize_ = proposedSize
        self.anchor = .zero
        self.anchorPosition = position
    }
    
    init(proposedSize: _ProposedSize, anchoring anchor: UnitPoint, at anchorPosition: CGPoint) {
        self.proposedSize_ = proposedSize
        self.anchor = anchor
        self.anchorPosition = anchorPosition
    }
    
    init(proposedSize: CGSize, aligning: UnitPoint, in size: CGSize) {
        self.proposedSize_ = _ProposedSize(proposedSize)
        self.anchor = aligning
        self.anchorPosition = CGPoint(x: aligning.x * size.width, y: aligning.y * size.height)
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

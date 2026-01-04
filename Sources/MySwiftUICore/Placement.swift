internal import CoreGraphics

struct _Placement: Equatable {
    var proposedSize_: _ProposedSize
    var anchor: UnitPoint
    var anchorPosition: CGPoint
    
    init(proposedSize: _ProposedSize, aligning: UnitPoint, in: CGSize) {
        fatalError("TODO")
    }
    
    init(proposedSize: CGSize, anchoring: UnitPoint, at: CGPoint) {
        fatalError("TODO")
    }
    
    init(proposedSize: _ProposedSize, at: CGPoint) {
        fatalError("TODO")
    }
    
    init(proposedSize: _ProposedSize, anchoring: UnitPoint, at: CGPoint) {
        fatalError("TODO")
    }
    
    init(proposedSize: CGSize, aligning: UnitPoint, in: CGSize) {
        fatalError("TODO")
    }
}

extension _Placement {
    init(_ placement3D: Placement3D) {
        fatalError("TODO")
    }
    
    func frameOrigin(childSize: CGSize) -> CGPoint {
        fatalError("TODO")
    }
}

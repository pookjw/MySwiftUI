package import CoreGraphics

package struct DepthPlacement {
    var proposal: CGFloat?
    var anchor: UnitDepth
    var offset: CGFloat
    
    package init(proposal: CGFloat?, anchoring anchor: UnitDepth = UnitDepth(value: 0), in scale: CGFloat) {
        self.proposal = proposal
        self.anchor = anchor
        self.offset = anchor.value * scale
    }
    
    package init(proposal: CGFloat?, anchoring anchor: UnitDepth = UnitDepth(value: 0), offset: CGFloat) {
        self.proposal = proposal
        self.anchor = anchor
        self.offset = offset
    }
}

internal import CoreGraphics

struct LayoutSubview3D {
    var base: LayoutSubview
    
    func depthThatFits(_ size: _ProposedSize3D) -> CGFloat {
        return base.proxy.depth(in: size)
    }
}

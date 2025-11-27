internal import CoreGraphics

struct _ProposedSize: Hashable {
    var width: CGFloat?
    var height: CGFloat?
    
    init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
    
    init() {
        width = nil
        height = nil
    }
    
    func fixingUnspecifiedDimensions() -> CGSize {
        return CGSize(width: width ?? 10, height: height ?? 10)
    }
}

extension _ProposedSize {
    init(_ size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
}

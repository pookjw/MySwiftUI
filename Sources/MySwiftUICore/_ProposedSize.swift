internal import CoreGraphics

struct _ProposedSize {
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
}

extension _ProposedSize {
    init(_ size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
}

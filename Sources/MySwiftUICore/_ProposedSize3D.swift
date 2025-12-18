internal import CoreGraphics
internal import Spatial

struct _ProposedSize3D: Hashable {
    var width: CGFloat?
    var height: CGFloat?
    var depth: CGFloat?
    
    init(width: CGFloat?, height: CGFloat?, depth: CGFloat?) {
        self.width = width
        self.height = height
        self.depth = depth
    }
    
    init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
        self.depth = nil
    }
    
    init(width: CGFloat?, depth: CGFloat?) {
        self.width = width
        self.height = nil
        self.depth = depth
    }
    
    init(height: CGFloat?, depth: CGFloat?) {
        self.width = nil
        self.height = height
        self.depth = depth
    }
    
    init(width: CGFloat) {
        self.width = width
        self.height = nil
        self.depth = nil
    }
    
    init(height: CGFloat?) {
        self.width = nil
        self.height = height
        self.depth = nil
    }
    
    init(depth: CGFloat?) {
        self.width = nil
        self.height = nil
        self.depth = depth
    }
}

extension _ProposedSize3D {
    init(_ size: Size3D) {
        self.width = size.width
        self.height = size.height
        self.depth = size.depth
    }
    
    init(_ size: CGSize, depth: CGFloat?) {
        self.width = size.width
        self.height = size.height
        self.depth = depth
    }
    
    init(_ size: _ProposedSize, depth: CGFloat?) {
        self.width = size.width
        self.height = size.height
        self.depth = depth
    }
}

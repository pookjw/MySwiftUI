internal import CoreGraphics
internal import Spatial

struct _ProposedSize3D: Hashable {
    static var unspecified: _ProposedSize3D {
        return _ProposedSize3D(width: nil, height: nil, depth: nil)
    }
    
    static let defaultSize = Size3D(width: 10, height: 10, depth: 0)
    
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
    
    func unspecifyingInfiniteDimensions() -> _ProposedSize3D {
        var width = width
        if width?.isFinite != true {
            width = nil
        }
        
        var height = height
        if height?.isFinite != true {
            height = nil
        }
        
        var depth = depth
        if depth?.isFinite != true {
            depth = nil
        }
        
        return _ProposedSize3D(width: width, height: height, depth: depth)
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
    
    init(_ size: CGSize) {
        self.width = size.width
        self.height = size.height
        self.depth = nil
    }
}

extension _ProposedSize3D {
    static var zero: _ProposedSize3D {
        return _ProposedSize3D(width: 0, height: 0, depth: 0)
    }
    
    static var infinity: _ProposedSize3D {
        return _ProposedSize3D(width: .infinity, height: .infinity, depth: .infinity)
    }
    
    var isNaN: Bool {
        if let width, width.isNaN {
            return true
        }
        if let height, height.isNaN {
            return true
        }
        if let depth, depth.isNaN {
            return true
        }
        return false
    }
    
    func inset(by insets: EdgeInsets3D) -> _ProposedSize3D {
        let width: CGFloat?
        if let _width = self.width {
            width = max(0, _width - insets.leading - insets.trailing)
        } else {
            width = nil
        }
        
        let height: CGFloat?
        if let _height = self.height {
            height = max(0, _height - insets.top - insets.bottom)
        } else {
            height = nil
        }
        
        let depth: CGFloat?
        if let _depth = self.depth {
            depth = max(0, _depth - insets.front - insets.back)
        } else {
            depth = nil
        }
        
        return _ProposedSize3D(
            width: width,
            height: height,
            depth: depth
        )
    }
}

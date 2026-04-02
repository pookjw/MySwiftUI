package import CoreGraphics
package import Spatial

package struct SizingPreferences : Equatable, CustomStringConvertible {
    package init(
        width: CGFloat?,
        height: CGFloat?,
        depth: CGFloat?,
        minimumWidth: CGFloat?,
        minimumHeight: CGFloat?,
        minimumDepth: CGFloat?,
        maximumWidth: CGFloat?,
        maximumHeight: CGFloat?,
        maximumDepth: CGFloat?,
        use3D: Bool
    ) {
        self.width = width
        self.height = height
        self.depth = depth
        self.minimumWidth = minimumWidth
        self.minimumHeight = minimumHeight
        self.minimumDepth = minimumDepth
        self.maximumWidth = maximumWidth
        self.maximumHeight = maximumHeight
        self.maximumDepth = maximumDepth
        self.use3D = use3D
    }
    
    package static func window(size: CGSize?, minimum: CGSize?, maximum: CGSize?) -> SizingPreferences {
        return SizingPreferences(
            width: size?.width,
            height: size?.height,
            depth: nil,
            minimumWidth: minimum?.width,
            minimumHeight: minimum?.height,
            minimumDepth: nil,
            maximumWidth: maximum?.width,
            maximumHeight: maximum?.height,
            maximumDepth: nil,
            use3D: false
        )
    }
    
    package static func volume(size: Size3D?, minimum: Size3D?, maximum: Size3D?) -> SizingPreferences {
        let width: CGFloat?
        let height: CGFloat?
        let depth: CGFloat?
        if let size {
            width = CGFloat(size.width)
            height = CGFloat(size.height)
            depth = CGFloat(size.depth)
        } else {
            width = nil
            height = nil
            depth = nil
        }
        
        let minimumWidth: CGFloat?
        let minimumHeight: CGFloat?
        let minimumDepth: CGFloat?
        if let minimum {
            minimumWidth = CGFloat(minimum.width)
            minimumHeight = CGFloat(minimum.height)
            minimumDepth = CGFloat(minimum.depth)
        } else {
            minimumWidth = nil
            minimumHeight = nil
            minimumDepth = nil
        }
        
        let maximumWidth: CGFloat?
        let maximumHeight: CGFloat?
        let maximumDepth: CGFloat?
        if let maximum {
            maximumWidth = CGFloat(maximum.width)
            maximumHeight = CGFloat(maximum.height)
            maximumDepth = CGFloat(maximum.depth)
        } else {
            maximumWidth = nil
            maximumHeight = nil
            maximumDepth = nil
        }
        
        return SizingPreferences(
            width: width,
            height: height,
            depth: depth,
            minimumWidth: minimumWidth,
            minimumHeight: minimumHeight,
            minimumDepth: minimumDepth,
            maximumWidth: maximumWidth,
            maximumHeight: maximumHeight,
            maximumDepth: maximumDepth,
            use3D: true
        )
    }
    
    private var width: CGFloat? // 0x0
    private var height: CGFloat? // 0x10
    private var depth: CGFloat? // 0x20
    private var minimumWidth: CGFloat? // 0x30
    private var minimumHeight: CGFloat? // 0x40
    private var minimumDepth: CGFloat? // 0x50
    private var maximumWidth: CGFloat? // 0x60
    private var maximumHeight: CGFloat? // 0x70
    private var maximumDepth: CGFloat? // 0x80
    package var use3D: Bool // 0x89
    
    package var size2D: CGSize? {
        get {
            if let width, let height {
                return CGSize(width: width, height: height)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                width = newValue.width
                height = newValue.height
            } else {
                width = nil
                height = nil
            }
            
            depth = nil
        }
    }
    
    package var size3D: Size3D? {
        get {
            if let width, let height, let depth {
                return Size3D(width: width, height: height, depth: depth)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                width = newValue.width
                height = newValue.height
                depth = newValue.depth
            } else {
                width = nil
                height = nil
                depth = nil
            }
        }
    }
    
    package var minimum2D: CGSize? {
        get {
            if let minimumWidth, let minimumHeight {
                return CGSize(width: minimumWidth, height: minimumHeight)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                minimumWidth = newValue.width
                minimumHeight = newValue.height
            } else {
                minimumWidth = nil
                minimumHeight = nil
            }
            
            minimumDepth = nil
        }
    }
    
    package var maximum2D: CGSize? {
        get {
            if let maximumWidth, let maximumHeight {
                return CGSize(width: maximumWidth, height: maximumHeight)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                maximumWidth = newValue.width
                maximumHeight = newValue.height
            } else {
                maximumWidth = nil
                maximumHeight = nil
            }
            
            maximumDepth = nil
        }
    }
    
    package var minimum3D: Size3D? {
        get {
            if let minimumWidth, let minimumHeight, let minimumDepth {
                return Size3D(width: minimumWidth, height: minimumHeight, depth: minimumDepth)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                minimumWidth = newValue.width
                minimumHeight = newValue.height
                minimumDepth = newValue.depth
            } else {
                minimumWidth = nil
                minimumHeight = nil
                minimumDepth = nil
            }
        }
    }
    
    package var maximum3D: Size3D? {
        get {
            if let maximumWidth, let maximumHeight, let maximumDepth {
                return Size3D(width: maximumWidth, height: maximumHeight, depth: maximumDepth)
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                maximumWidth = newValue.width
                maximumHeight = newValue.height
                maximumDepth = newValue.depth
            } else {
                maximumWidth = nil
                maximumHeight = nil
                maximumDepth = nil
            }
        }
    }
    
    package var description: String {
        let use3D = use3D
        return "SizingPreferences(size: \(use3D ? ResizeLogs.size3D(size3D) : ResizeLogs.size(size2D)), minimum: \(use3D ? ResizeLogs.size3D(minimum3D) : ResizeLogs.size(minimum2D)), maximum: \(use3D ? ResizeLogs.size3D(maximum3D) : ResizeLogs.size(maximum2D)))"
    }
}

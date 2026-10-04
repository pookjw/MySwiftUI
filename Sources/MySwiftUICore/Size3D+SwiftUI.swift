package import Spatial
package import CoreGraphics

extension Size3D {
    func inset(by insets: EdgeInsets3D) -> Size3D {
        let width = width - (insets.leading + insets.trailing)
        let height = height - (insets.top + insets.bottom)
        let depth = depth - (insets.front + insets.back)
        
        return Size3D(
            width: width >= 0 ? width : 0,
            height: height >= 0 ? height : 0,
            depth: depth >= 0 ? depth : 0
        )
    }
    
    package init(_ size: CGSize, depth: CGFloat) {
        self = Size3D(width: size.width, height: size.height, depth: depth)
    }
    
    package init(_ value: CGFloat) {
        self = Size3D(width: value, height: value, depth: value)
    }
    
    subscript(axis: _Axis3D) -> Double {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
}

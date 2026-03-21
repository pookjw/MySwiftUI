package import Spatial
package import CoreGraphics

extension Size3D {
    func inset(by insets: EdgeInsets3D) -> Size3D {
        let width = max(0, width - insets.leading - insets.trailing)
        let height = max(0, height - insets.top - insets.bottom)
        let depth = max(0, depth - insets.front - insets.back)
        
        return Size3D(width: width, height: height, depth: depth)
    }
    
    package init(_ size: CGSize, depth: CGFloat) {
        self = Size3D(width: size.width, height: size.height, depth: depth)
    }
}

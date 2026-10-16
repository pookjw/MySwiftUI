internal import CoreGraphics

enum ShapeType {
    case rect(CGRect, radius: CGFloat, style: RoundedCornerStyle)
    case rectBorder(CGRect, radius: CGFloat, style: RoundedCornerStyle, lineWidth: CGFloat)
    case strokedPath(Path, style: StrokeStyle)
    case empty
    case other
    
    init(_ path: Path) {
        assertUnimplemented()
    }
}

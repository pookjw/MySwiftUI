internal import CoreGraphics

enum ShapeType {
    case rect(CGRect, radius: CGFloat, style: RoundedCornerStyle)
    case rectBorder(CGRect, radius: CGFloat, style: RoundedCornerStyle, lineWidth: CGFloat)
    case strokedPath(Path, style: StrokeStyle)
    case empty // 0x0 / 0x3
    case other // 0x1 / 0x3
    
    init(_ path: Path) {
        switch path.storage {
        case .empty:
            // <+96>
            self = .empty
        case .rect(let rect):
            // <+508>
            self = .rect(rect, radius: 0, style: .circular)
        case .ellipse(let rect):
            // <+128>
            if rect.width != rect.height {
                // <+396>
                self = .other
            } else {
                // <+196>
                self = .rect(rect, radius: rect.width * 0.5, style: .circular)
            }
        case .roundedRect(let rect):
            // <+240>
            let d13 = rect.cornerSize.width
            var d0 = rect.cornerSize.height
            let cmp = (d13 != d0)
            d0 = abs(d13 - d0)
            var d1 = CGFloat(0.001)
            
            if (cmp && !(d0 < d1)) {
                // <+392>
                self = .other
            } else {
                // <+280>
                let d12 = rect.rect.width
                d0 = rect.rect.height
                d0 = (d0 < d12) ? d0 : d12
                d1 = 0.5
                d0 = d0 * d1
                d0 = (d0 < d13) ? d0 : d13
                
                self = .rect(rect.rect, radius: d0, style: rect.style)
            }
        case .stroked(_):
            // <+392>
            self = .other
        case .trimmed(_):
            // <+392>
            self = .other
        case .path(_):
            // <+440>
            self = .other
            assertUnimplemented()
        }
    }
}

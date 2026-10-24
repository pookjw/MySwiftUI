// E19F490D25D5E0EC8A24903AF958E341
internal import CoreGraphics
private import RenderBox

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
        case .path(let pathBox):
            // <+440>
            self = .other
            
            withUnsafeMutablePointer(to: &self) { context in
                _ = unsafe pathBox.rbPath.applyShape(true, context) { arg0, arg1, arg2 in
                    // $s7SwiftUI9ShapeTypeOyAcA4PathVcfcSbSpyACGXEfU_ySv_So06RBPathcD0VSPySo0fC0aGtcfU_To
                    unsafe arg0
                        .assumingMemoryBound(to: ShapeType.self)
                        .pointee
                        .initFromFilled(type: arg1, shape: arg2)
                }
            }
        }
    }
    
    fileprivate mutating func initFromFilled(type: RBPathShapeType, shape: UnsafePointer<RBPathShape>) {
        /*
         self -> x20
         type -> x0
         shape -> x1 -> x19
         */
        switch type {
        case .unknown0:
            // <+88>
            let data = unsafe shape.pointee.unknown0
            
            if (data.transform.b == 0) && (data.transform.c == 0) {
                // <+136>
            } else if (data.transform.a != 0) || (data.transform.d != 0) {
                break
            }
            
            // <+136>
            let rect = data.rect.applying(data.transform)
            self = .rect(rect, radius: 0, style: .circular)
        case .unknown3:
            // <+200>
            let data = unsafe shape.pointee.unknown3
            
            if (data.transform.b == 0) && (data.transform.c == 0) {
                // <+260>
            } else if (data.transform.a != 0) || (data.transform.d != 0) {
                break
            }
            
            // <+260>
            // d10, d11, d8, d9
            let rect = data.rect.applying(data.transform)
            let cornerSize = data.cornerSize.applying(data.transform)
            
            if cornerSize.width == cornerSize.height {
                // <+380>
            } else if !(abs(cornerSize.width - cornerSize.height) < 0.001) {
                // <+956>
                break
            }
            
            // <+380>
            let d10 = rect.origin.x
            let d11 = rect.origin.y
            let d8 = rect.size.width
            let d9 = rect.size.height
            let d12 = cornerSize.width
            let d13 = rect.width
            var d0 = rect.height
            d0 = (d0 < d13) ? d0 : d13
            d0 = d0 * 0.5
            d0 = (d0 < d12) ? d0 : d12
            
            self = .rect(
                CGRect(x: d10, y: d11, width: d8, height: d9),
                radius: d0,
                style: (data.cornerStyle == .continuous) ? .continuous : .circular
            )
        case .unknown6:
            // <+480>
            let data = unsafe shape.pointee.unknown6
            
            if unsafe data.path.isEmpty {
                // <+492>
                self = .empty
            } else {
                // <+528>
                var values: [CGFloat] = []
                unsafe values.reserveCapacity(data.count)
                for i in unsafe 0..<data.count {
                    let value = unsafe data.dash[i]
                    values.append(value)
                }
                
                let strokeStyle = unsafe StrokeStyle(
                    lineWidth: data.lineWidth,
                    lineCap: data.lineCap,
                    lineJoin: data.lineJoin,
                    miterLimit: data.miterLimit,
                    dash: values,
                    dashPhase: data.dashPhase
                )
                
                // <+684>
                withUnsafeMutablePointer(to: &self) { pointer in
                    var context = unsafe (pointer, strokeStyle)
                    
                    withUnsafeMutablePointer(to: &context) { context in
                        _ = unsafe data.path.applyShape(true, context) { context, type, shape in
                            // $s7SwiftUI9ShapeTypeO14initFromFilled33_E19F490D25D5E0EC8A24903AF958E341LL4type5shapeySo06RBPathcD0V_SPySo0sC0aGtFySpyACGXEfU_SbSpyAM_AA11StrokeStyleVtGXEfU_ySv_AiLtcfU_To
                            let casted = unsafe context
                                .assumingMemoryBound(
                                    to: (UnsafeMutablePointer<ShapeType>, StrokeStyle).self
                                )
                            
                            unsafe casted.pointee.0.pointee.initFromStroked(
                                type: type,
                                shape: shape,
                                style: casted.pointee.1
                            )
                        }
                    }
                }
                
                guard case .other = self else {
                    return
                }
                
                // <+780>
                self = unsafe .strokedPath(
                    Path(storage: .path(Path.PathBox(takingPath: data.path.retain()))),
                    style: strokeStyle
                )
            }
        default:
            // <+956>
            break
        }
    }
    
    fileprivate mutating func initFromStroked(type: RBPathShapeType, shape: UnsafePointer<RBPathShape>, style: StrokeStyle) {
        /*
         self -> x20
         type -> x0
         shape -> x1
         style -> x2
         */
        guard style.dash.isEmpty else {
            return
        }
        
        switch type {
        case .unknown0:
            // <+104>
            let data = unsafe shape.pointee.unknown0
            
            guard
                (style.lineJoin == .miter),
                style.miterLimit > 1.4142,
                data.transform.isIdentity
            else {
                break
            }
            
            // <+180>
            let rect = data.rect.insetBy(
                dx: style.lineWidth * -0.5,
                dy: style.lineWidth * -0.5
            )
            
            self = .rectBorder(rect, radius: 0, style: .circular, lineWidth: style.lineWidth)
        case .unknown1:
            // <+228>
            let data = unsafe shape.pointee.unknown1
            
            guard
                data.rect.width == data.rect.height,
                data.transform.isIdentity
            else {
                break
            }
            
            var d0 = data.rect.width
            var d1: CGFloat = 0.5
            d0 = d0 * d1
            d1 = style.lineWidth * d1
            d1 = d1 + d0
            let d12 = (d0 == 0) ? 0 : d1
            d0 = -0.5
            let d4 = style.lineWidth * d0
            
            let rect = data.rect.insetBy(dx: d4, dy: d4)
            self = .rectBorder(rect, radius: d12, style: .circular, lineWidth: style.lineWidth)
        case .unknown3:
            // <+424>
            let data = unsafe shape.pointee.unknown3
            
            if
                (data.cornerSize.width != data.cornerSize.height) &&
                    !(abs(data.cornerSize.width - data.cornerSize.height) < 0.001)
            {
                break
            }
            
            // <+476>
            guard data.transform.isIdentity else {
                break
            }
            
            var d12 = data.rect.width
            var d0 = data.rect.height
            d0 = (d0 < d12) ? d0 : d12
            var d1: CGFloat = 0.5
            d0 = d0 * d1
            d0 = (d0 < data.cornerSize.width) ? d0 : data.cornerSize.width
            d1 = style.lineWidth * d1
            d1 = d1 + d0
            d12 = (d0 == 0) ? 0 : d1
            d0 = -0.5
            let d4 = style.lineWidth * d0
            let rect = data.rect.insetBy(dx: d4, dy: d4)
            
            self = .rectBorder(
                rect,
                radius: d12,
                style: (data.cornerStyle == .continuous) ? .continuous : .circular,
                lineWidth: style.lineWidth
            )
        default:
            break
        }
    }
}

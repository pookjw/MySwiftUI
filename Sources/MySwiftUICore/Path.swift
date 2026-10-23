// 3591905F51357E95FA93E39751507471
public import CoreGraphics
internal import RenderBox
private import _MySwiftUICoreShims

@frozen public struct Path : Equatable, LosslessStringConvertible, @unchecked Sendable {
    @usableFromInline
    @safe final package class PathBox : Equatable {
        fileprivate private(set) var kind: Path.PathBox.Kind
        fileprivate var data: PathData
        
        init(takingPath path: RBPath) {
            self.kind = .rbPath
            
            unsafe self.data = PathData(
                element: PathDataElement(rbPath: path),
                unknown0: nil,
                unknown1: nil,
                unknown2: nil,
                unknown3: nil,
                unknown4: nil,
                unknown5: nil,
                unknown6: nil,
                unknown7: nil,
                unknown8: nil,
                unknown9: nil
            )
        }
        
        @inline(__always) // 원래 없음
        fileprivate init(buffer: UnsafeRawPointer?) {
            unsafe self.data = PathData(
                element: PathDataElement(buffer: buffer),
                unknown0: nil,
                unknown1: nil,
                unknown2: nil,
                unknown3: nil,
                unknown4: nil,
                unknown5: nil,
                unknown6: nil,
                unknown7: nil,
                unknown8: nil,
                unknown9: nil
            )
            
            self.kind = .buffer
        }
        
        deinit {
            assertUnimplemented()
        }

        @usableFromInline
        package static func == (lhs: Path.PathBox, rhs: Path.PathBox) -> Bool {
            assertUnimplemented()
        }
        
        var cgPath: CGPath {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case empty // *(uint8_t *)(base + 0x20) = 0x6
        case rect(CGRect) // *(uint8_t *)(base + 0x20) = 0x0
        case ellipse(CGRect) // *(uint8_t *)(base + 0x20) = 0x1
        indirect case roundedRect(FixedRoundedRect) // *(uint8_t *)(base + 0x20) = 0x2
        
        @available(*, deprecated, message: "obsolete")
        indirect case stroked(StrokedPath) // *(uint8_t *)(base + 0x20) = 0x3
        
        @available(*, deprecated, message: "obsolete")
        indirect case trimmed(TrimmedPath) // *(uint8_t *)(base + 0x20) = 0x4
        
        case path(Path.PathBox) // *(uint8_t *)(base + 0x20) = 0x5
        
        @usableFromInline
        package static func == (a: Path.Storage, b: Path.Storage) -> Bool {
            assertUnimplemented()
        }
    }
    
    package var storage: Path.Storage
    
    public init() {
        self.storage = .empty
    }
    
    public init(_ path: CGPath) {
        assertUnimplemented()
    }
    
    public init(_ path: CGMutablePath) {
        assertUnimplemented()
    }
    
    public init(_ rect: CGRect) {
        if rect.isNull {
            self.storage = .empty
        } else {
            self.storage = .rect(rect)
        }
    }
    
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    init(storage: Path.Storage) {
        self.storage = storage
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(roundedRect rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    public init(ellipseIn rect: CGRect) {
        if rect.isNull {
            self.storage = .empty
        } else if rect.isInfinite {
            self.storage = .rect(rect)
        } else {
            self.storage = .ellipse(rect)
        }
    }
    
    public init(_ callback: (inout Path) -> ()) {
        assertUnimplemented()
    }
    
    public init?(_ string: String) {
        assertUnimplemented()
    }
    
    public var description: String {
        assertUnimplemented()
    }
    
    public var cgPath: CGPath {
        switch self.storage {
        case .empty:
            return unsafe CGPath(
                rect: CGRect(x: CGFloat.infinity, y: CGFloat.infinity, width: 0, height: 0),
                transform: nil
            )
        case .rect(let rect):
            return unsafe CGPath(rect: rect, transform: nil)
        case .ellipse(let rect):
            return unsafe CGPath(ellipseIn: rect, transform: nil)
        case .roundedRect(let rect):
            return rect.cgPath
        case .stroked(_):
            fatalError("obsolete")
        case .trimmed(_):
            fatalError("obsolete")
        case .path(let box):
            return box.cgPath
        }
    }
    
    public var isEmpty: Bool {
        assertUnimplemented()
    }
    
    public var boundingRect: CGRect {
        switch self.storage {
        case .empty:
            // <+156>
            return CGRect(x: CGFloat.infinity, y: CGFloat.infinity, width: 0, height: 0)
        case .rect(let rect):
            // <+64>
            return rect
        case .ellipse(let rect):
            // <+64>
            return rect
        case .roundedRect(let rect):
            // <+136>
            return rect.rect
        case .stroked(_):
            // <+320>
            fatalError("obsolete")
        case .trimmed(_):
            fatalError("obsolete")
        case .path(_):
            // <+92>
            assertUnimplemented()
        }
    }
    
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool {
        assertUnimplemented()
    }
    
    @frozen public enum Element : Equatable {
        case move(to: CGPoint)
        case line(to: CGPoint)
        case quadCurve(to: CGPoint, control: CGPoint)
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)
        case closeSubpath
        
        public static func == (a: Path.Element, b: Path.Element) -> Bool {
            assertUnimplemented()
        }
    }
    
    public func forEach(_ body: (Path.Element) -> Void) {
        assertUnimplemented()
    }
    
    public func strokedPath(_ style: StrokeStyle) -> Path {
        switch self.storage {
        case .empty:
            // <+276>
            return Path(storage: .empty)
        case .rect(let rect), .ellipse(let rect):
            // <+56>
            if rect.isNull {
                return Path(storage: .empty)
            } else {
                // <+144>
            }
        case .roundedRect(let rect):
            // <+128>
            if rect.rect.isNull {
                return Path(storage: .empty)
            } else {
                // <+144>
            }
        case .stroked(_):
            fatalError("obsolete")
        case .trimmed(_):
            fatalError("obsolete")
        case .path(let pathBox):
            // <+96>
            switch pathBox.kind {
            case .cgPath:
                // <+320>
                let rbPath = unsafe withUnsafePointer(to: RBPathCGPathCallbacks) { callbacks in
                    return unsafe RBPath(
                        unknown0: pathBox.data.element.cgPath.toOpaque(),
                        callbacks: callbacks
                    )
                }
                
                if unsafe RBPathIsEmpty(rbPath) {
                    return Path(storage: .empty)
                } else {
                    // <+144>
                }
            case .rbPath:
                // <+112>
                if unsafe RBPathIsEmpty(pathBox.data.element.rbPath) {
                    return Path(storage: .empty)
                } else {
                    // <+144>
                }
            case .buffer:
                // <+344>
                let rbPath = unsafe RBPath(
                    unknown0: Unmanaged.passUnretained(pathBox).toOpaque(),
                    callbacks: Path.bufferCallbacks
                )
                
                if unsafe RBPathIsEmpty(rbPath) {
                    return Path(storage: .empty)
                } else {
                    // <+144>
                }
            }
        }
        
        // <+144>
        let currentPath = unsafe self.retainRBPath()
        let box = unsafe Path.PathBox(buffer: nil)
        
        let block: (UnsafeMutableRawPointer) -> Void = { rbPath in
            // $s7SwiftUI4PathV07strokedC0yAcA11StrokeStyleVFySvXEfU_
            let strokeStyle = RBPathStrokeStyle(
                lineWidth: style.lineWidth,
                miterLimit: style.miterLimit,
                dashPhase: style.dashPhase
            )
            
            withUnsafePointer(to: strokeStyle) { strokeStyle in
                style.dash.withUnsafeBufferPointer { dash in
                    let dashes = unsafe RBPathStrokeDashes(
                        lineCap: style.lineCap,
                        lineJoin: style.lineJoin,
                        count: dash.count,
                        values: dash.baseAddress.unsafelyUnwrapped
                    )
                    
                    withUnsafePointer(to: dashes) { dashes in
                        unsafe RBPathStorageAppendElement(
                            rbPath,
                            .unknown19,
                            strokeStyle,
                            dashes
                        )
                    }
                }
            }
            
            unsafe self.append(to: rbPath)
            
            unsafe RBPathStorageAppendElement(
                rbPath,
                .unknown16,
                nil,
                nil
            )
        }
        
        unsafe withUnsafeMutablePointer(to: &box.data) { data in
            let pointer = UnsafeMutableRawPointer(data)
            unsafe RBPathStorageInit(pointer, MemoryLayout<PathData>.size, nil)
            unsafe block(pointer)
        }
        
        unsafe RBPathRelease(currentPath)
        
        return Path(storage: .path(box))
    }
    
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path {
        assertUnimplemented()
    }
    
    public static func == (a: Path, b: Path) -> Bool {
        assertUnimplemented()
    }
    
    func retainRBPath() -> RBPath {
        assertUnimplemented()
    }
    
    fileprivate func append(to: UnsafeMutableRawPointer) {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension Path.Storage : Sendable {
}

@available(*, unavailable)
extension Path.PathBox : Sendable {
}

extension Path : Shape {
    nonisolated public func path(in _: CGRect) -> Path {
        assertUnimplemented()
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = _ShapeView<Path, ForegroundStyle>
}

extension Path {
    public mutating func move(to end: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addLine(to end: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addQuadCurve(to end: CGPoint, control: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func closeSubpath() {
        assertUnimplemented()
    }
    
    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public mutating func addRoundedRect(in rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addLines(_ lines: [CGPoint]) {
        assertUnimplemented()
    }
    
    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public var currentPoint: CGPoint? {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func normalized(eoFill: Bool = true) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func intersection(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func union(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func subtracting(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func symmetricDifference(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func lineIntersection(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func lineSubtraction(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    public func applying(_ transform: CGAffineTransform) -> Path {
        assertUnimplemented()
    }
    
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path {
        assertUnimplemented()
    }
}

extension Path.Element : Sendable {}
extension Path.Element : BitwiseCopyable {}

@available(*, deprecated, message: "obsolete")
@usableFromInline
package struct StrokedPath : Equatable {
    public init(path: Path, style: StrokeStyle) {
        assertUnimplemented()
    }
    
    @usableFromInline
    package static func == (a: StrokedPath, b: StrokedPath) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension StrokedPath : Sendable {
}


@available(*, deprecated, message: "obsolete")
@usableFromInline
package struct TrimmedPath : Equatable {
    @usableFromInline
    package static func == (a: TrimmedPath, b: TrimmedPath) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension TrimmedPath : Sendable {
}

extension Path.PathBox {
    fileprivate enum Kind {
        case cgPath
        case rbPath
        case buffer
    }
}

extension Path {
    @safe fileprivate static nonisolated(unsafe) let bufferCallbacks: UnsafePointer<RBPathCallbacks> = {
        assertUnimplemented()
    }()
}

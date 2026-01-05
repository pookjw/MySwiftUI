@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct Alignment3D: Equatable, Sendable {
    @usableFromInline internal var base: Alignment
    
    public var horizontal: HorizontalAlignment {
        @inlinable get {
            base.horizontal
        }
        @inlinable set {
            base.horizontal = newValue
        }
    }
    
    public var vertical: VerticalAlignment {
        @inlinable get {
            base.vertical
        }
        @inlinable set {
            base.vertical = newValue
        }
    }
    
    public var depth: DepthAlignment
    
    @_alwaysEmitIntoClient public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment, depth: DepthAlignment) {
        self.base = Alignment(horizontal: horizontal, vertical: vertical)
        self.depth = depth
    }
    
    public static let bottom: Alignment3D = { fatalError("TODO") }()
    public static let bottomBack: Alignment3D = { fatalError("TODO") }()
    public static let bottomFront: Alignment3D = { fatalError("TODO") }()
    public static let bottomLeading: Alignment3D = { fatalError("TODO") }()
    public static let bottomLeadingBack: Alignment3D = { fatalError("TODO") }()
    public static let bottomLeadingFront: Alignment3D = { fatalError("TODO") }()
    public static let bottomTrailing: Alignment3D = { fatalError("TODO") }()
    public static let bottomTrailingBack: Alignment3D = { fatalError("TODO") }()
    public static let bottomTrailingFront: Alignment3D = { fatalError("TODO") }()
    public static let leading: Alignment3D = { fatalError("TODO") }()
    public static let leadingBack: Alignment3D = { fatalError("TODO") }()
    public static let leadingFront: Alignment3D = { fatalError("TODO") }()
    public static let top: Alignment3D = { fatalError("TODO") }()
    public static let topBack: Alignment3D = { fatalError("TODO") }()
    public static let topFront: Alignment3D = { fatalError("TODO") }()
    public static let topLeading: Alignment3D = { fatalError("TODO") }()
    public static let topLeadingBack: Alignment3D = { fatalError("TODO") }()
    public static let topLeadingFront: Alignment3D = { fatalError("TODO") }()
    public static let topTrailing: Alignment3D = { fatalError("TODO") }()
    public static let topTrailingBack: Alignment3D = { fatalError("TODO") }()
    public static let topTrailingFront: Alignment3D = { fatalError("TODO") }()
    public static let trailing: Alignment3D = { fatalError("TODO") }()
    public static let trailingBack: Alignment3D = { fatalError("TODO") }()
    public static let trailingFront: Alignment3D = { fatalError("TODO") }()
    public static let front: Alignment3D = { fatalError("TODO") }()
    public static let back: Alignment3D = { fatalError("TODO") }()
    public static let center: Alignment3D = { fatalError("TODO") }()
    
    public static func == (a: Alignment3D, b: Alignment3D) -> Bool {
        fatalError("TODO")
    }
}

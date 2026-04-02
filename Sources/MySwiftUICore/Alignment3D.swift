@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct Alignment3D : Equatable, Sendable {
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
    
    public static let bottom: Alignment3D = { assertUnimplemented() }()
    public static let bottomBack: Alignment3D = { assertUnimplemented() }()
    public static let bottomFront: Alignment3D = { assertUnimplemented() }()
    public static let bottomLeading: Alignment3D = { assertUnimplemented() }()
    public static let bottomLeadingBack: Alignment3D = { assertUnimplemented() }()
    public static let bottomLeadingFront: Alignment3D = { assertUnimplemented() }()
    public static let bottomTrailing: Alignment3D = { assertUnimplemented() }()
    public static let bottomTrailingBack: Alignment3D = { assertUnimplemented() }()
    public static let bottomTrailingFront: Alignment3D = { assertUnimplemented() }()
    public static let leading: Alignment3D = { assertUnimplemented() }()
    public static let leadingBack: Alignment3D = { assertUnimplemented() }()
    public static let leadingFront: Alignment3D = { assertUnimplemented() }()
    public static let top: Alignment3D = { assertUnimplemented() }()
    public static let topBack: Alignment3D = { assertUnimplemented() }()
    public static let topFront: Alignment3D = { assertUnimplemented() }()
    public static let topLeading: Alignment3D = { assertUnimplemented() }()
    public static let topLeadingBack: Alignment3D = { assertUnimplemented() }()
    public static let topLeadingFront: Alignment3D = { assertUnimplemented() }()
    public static let topTrailing: Alignment3D = { assertUnimplemented() }()
    public static let topTrailingBack: Alignment3D = { assertUnimplemented() }()
    public static let topTrailingFront: Alignment3D = { assertUnimplemented() }()
    public static let trailing: Alignment3D = { assertUnimplemented() }()
    public static let trailingBack: Alignment3D = { assertUnimplemented() }()
    public static let trailingFront: Alignment3D = { assertUnimplemented() }()
    public static let front: Alignment3D = { assertUnimplemented() }()
    public static let back: Alignment3D = { assertUnimplemented() }()
    public static let center: Alignment3D = { assertUnimplemented() }()
    
    public static func == (a: Alignment3D, b: Alignment3D) -> Bool {
        assertUnimplemented()
    }
}

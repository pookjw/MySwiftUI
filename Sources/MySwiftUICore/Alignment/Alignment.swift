// 1135C055CD2C2B1265C25B13E3E74C01
internal import CoreGraphics
private import Synchronization

@frozen public struct Alignment: Equatable {
    public var horizontal: HorizontalAlignment
    public var vertical: VerticalAlignment
    
    @inlinable public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    public static func == (a: Alignment, b: Alignment) -> Bool {
        return a.horizontal == b.horizontal && a.vertical == b.vertical
    }
    
    init(_ alignment3D: Alignment3D) {
        self.horizontal = alignment3D.horizontal
        self.vertical = alignment3D.vertical
    }
}

extension Alignment {
    public static let center = Alignment(horizontal: .center, vertical: .center)
    public static let leading = Alignment(horizontal: .leading, vertical: .center)
    public static let trailing = Alignment(horizontal: .trailing, vertical: .center)
    public static let top = Alignment(horizontal: .center, vertical: .top)
    public static let bottom = Alignment(horizontal: .center, vertical: .bottom)
    public static let topLeading = Alignment(horizontal: .leading, vertical: .top)
    public static let topTrailing = Alignment(horizontal: .trailing, vertical: .top)
    public static let bottomLeading = Alignment(horizontal: .leading, vertical: .bottom)
    public static let bottomTrailing = Alignment(horizontal: .trailing, vertical: .bottom)
}

extension Alignment {
  @_alwaysEmitIntoClient public static var centerFirstTextBaseline: Alignment {
      get {
          .init(horizontal: .center, vertical: .firstTextBaseline)
      }
  }
    
  @_alwaysEmitIntoClient public static var centerLastTextBaseline: Alignment {
      get {
          .init(horizontal: .center, vertical: .lastTextBaseline)
      }
  }
    
  @_alwaysEmitIntoClient public static var leadingFirstTextBaseline: Alignment {
      get {
          .init(horizontal: .leading, vertical: .firstTextBaseline)
      }
  }
    
  @_alwaysEmitIntoClient public static var leadingLastTextBaseline: Alignment {
      get {
          .init(horizontal: .leading, vertical: .lastTextBaseline)
      }
  }
    
  @_alwaysEmitIntoClient public static var trailingFirstTextBaseline: Alignment {
      get {
          .init(horizontal: .trailing, vertical: .firstTextBaseline)
      }
  }
    
  @_alwaysEmitIntoClient public static var trailingLastTextBaseline: Alignment {
      get {
          .init(horizontal: .trailing, vertical: .lastTextBaseline)
      }
  }
}

extension Alignment {
    var fraction: UnitPoint {
        return UnitPoint(
            x: horizontal.key.fraction,
            y: vertical.key.fraction
        )
    }
}

extension Alignment: Sendable {}
extension Alignment: BitwiseCopyable {}

@_documentation(visibility: private) @frozen public struct AlignmentKey: Hashable, Comparable {
    private let bits: UInt
    
    public static func < (lhs: AlignmentKey, rhs: AlignmentKey) -> Bool {
        return lhs.bits < rhs.bits
    }
    
    public static func == (a: AlignmentKey, b: AlignmentKey) -> Bool {
        return a.bits == b.bits
    }
    
    init(id: any AlignmentID.Type, axis: Axis) {
        let value = AlignmentKey.typeCache.withLock { cache in
            if let cached = cache.bits[ObjectIdentifier(id)] {
                return cached
            } else {
                let bits = UInt(cache.ids.count)
                cache.ids.append(id)
                cache.bits[ObjectIdentifier(id)] = bits
                return bits
            }
        }
        
        self.bits = ((value << 1) | (axis == .horizontal ? 0 : 1)) &+ 2
    }
    
    var id: any AlignmentID.Type {
        return AlignmentKey.typeCache.withLock { cache in
            let value = ((bits - 2) >> 1)
            return cache.ids[Int(value)]
        }
    }
    
    var axis: Axis {
        return (bits & 1 == 1) ? .vertical : .horizontal
    }
    
    var fraction: CGFloat {
        let layoutComputer = LayoutComputer.defaultValue
        let id = id
        let dimensions = ViewDimensions(
            guideComputer: layoutComputer,
            size: .fixed(CGSize(width: 1, height: 1))
        )
        return id.defaultValue(in: dimensions)
    }
}

extension AlignmentKey {
    fileprivate static let typeCache = Mutex(TypeCache())
    
    fileprivate struct TypeCache: Sendable {
        var bits: [ObjectIdentifier: UInt] = [:]
        var ids: [any AlignmentID.Type] = []
    }
}

extension AlignmentKey: Sendable {}
extension AlignmentKey: BitwiseCopyable {}

protocol FrameAlignment: AlignmentID {
}

extension FrameAlignment {
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}

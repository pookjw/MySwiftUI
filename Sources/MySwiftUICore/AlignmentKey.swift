// 1135C055CD2C2B1265C25B13E3E74C01

public import CoreGraphics
private import Synchronization

@_documentation(visibility: private) @frozen public struct AlignmentKey : Hashable, Comparable {
    private let bits: UInt
    
    public static func < (lhs: AlignmentKey, rhs: AlignmentKey) -> Bool {
        fatalError("TODO")
    }
    
    public static func == (a: AlignmentKey, b: AlignmentKey) -> Bool {
        fatalError("TODO")
    }
    
    init(id: any AlignmentID.Type, axis: Axis) {
        let value = AlignmentKey.typeCache.withLock { $0.value(type: id) }
        self.bits = (((value & ((1 << 63) - 1)) << 1) | UInt(axis.rawValue)) + 2
    }
}

extension AlignmentKey {
    fileprivate static let typeCache = Mutex(TypeCache())
    
    fileprivate struct TypeCache: Sendable {
        var dictionary: [ObjectIdentifier: UInt] = [:]
        var array: [any AlignmentID.Type] = []
        
        // 원래 없음
        @inline(__always)
        mutating func value<T: AlignmentID>(type: T.Type) -> UInt {
            if let cached = dictionary[ObjectIdentifier(type)] {
                return cached
            }
            
            let index = UInt(array.count)
            array.append(type)
            dictionary[ObjectIdentifier(type)] = index
            return index
        }
    }
}

extension AlignmentKey: Sendable {}
extension AlignmentKey: BitwiseCopyable {}

@frozen public struct HorizontalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        key = AlignmentKey(id: id, axis: .horizontal)
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension HorizontalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

extension HorizontalAlignment {
    public static let leading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let center = HorizontalAlignment(HorizontalAlignment.Center.self)
    
    public static let trailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment {
    public static let listRowSeparatorLeading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let listRowSeparatorTrailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment {
    fileprivate struct TrailingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
    
    fileprivate struct LeadingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
    
    fileprivate struct Trailing: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.size.value.width
        }
    }
    
    fileprivate struct Leading: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return 0
        }
    }
    
    fileprivate struct LeadingText: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
    
    fileprivate struct Center: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.size.value.width * 0.5
        }
    }
    
    fileprivate struct FormDetailLeading: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
}

extension HorizontalAlignment: Sendable {}
extension HorizontalAlignment: BitwiseCopyable {}

extension HorizontalAlignment: AlignmentGuide {
    
}

protocol FrameAlignment: AlignmentID {
}

extension FrameAlignment {
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}

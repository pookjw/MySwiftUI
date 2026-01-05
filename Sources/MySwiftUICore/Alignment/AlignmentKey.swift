// 1135C055CD2C2B1265C25B13E3E74C01
public import CoreGraphics
private import Synchronization

@_documentation(visibility: private) @frozen public struct AlignmentKey : Hashable, Comparable {
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

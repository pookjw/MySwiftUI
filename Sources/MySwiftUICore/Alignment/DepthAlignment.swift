// F1D30FA54A33EC0F4C1C5265C087A467
public import CoreGraphics
private import Synchronization
private import Spatial

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@frozen public struct DepthAlignment: Equatable, Sendable {
    public init(_ id: any DepthAlignmentID.Type) {
        fatalError("TODO")
    }
    
    init(_ id: any AlignmentID.Type) {
        fatalError("TODO")
    }
    
    @_documentation(visibility: private) public var depthKey: DepthAlignmentKey
    
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Swift.Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension DepthAlignment {
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension DepthAlignment {
    public static let front: DepthAlignment = {
        fatalError("TODO")
    }()
    
    public static let center: DepthAlignment = {
        fatalError("TODO")
    }()
    
    public static let back: DepthAlignment = {
        fatalError("TODO")
    }()
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@_documentation(visibility: private) public struct DepthAlignmentKey: Hashable, Comparable, Sendable {
    private static let typeCache = Mutex(DepthAlignmentKey.TypeCache())
    private let bits: UInt
    
    var id: any DepthAlignmentID.Type {
        return DepthAlignmentKey.typeCache.withLock { cache in
            return cache.ids[Int(bits)]
        }
    }
    
    init(id: any DepthAlignmentID.Type) {
        self.bits = DepthAlignmentKey.typeCache.withLock { cache in
            if let bits = cache.bits[ObjectIdentifier(id)] {
                return bits
            } else {
                let bits = UInt(cache.ids.count)
                cache.ids.append(id)
                cache.bits[ObjectIdentifier(id)] = bits
                return bits
            }
        }
    }
    
    init() {
        bits = 0
    }
    
    var fraction: CGFloat {
//        let layoutComputer = LayoutComputer.defaultValue
//        let dimensions = ViewDimensions3D.ini
//        id.defaultValue(in: <#T##ViewDimensions3D#>)
        fatalError("TODO")
    }
    
    public static func < (lhs: DepthAlignmentKey, rhs: DepthAlignmentKey) -> Bool {
        fatalError("TODO")
    }
    
    public static func == (a: DepthAlignmentKey, b: DepthAlignmentKey) -> Bool {
        fatalError("TODO")
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension DepthAlignmentKey {
    fileprivate struct TypeCache: Sendable {
        var bits: [ObjectIdentifier: UInt] = [:]
        var ids: [any DepthAlignmentID.Type] = []
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public protocol DepthAlignmentID {
    static func defaultValue(in context: ViewDimensions3D) -> CGFloat
    static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?)
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension DepthAlignmentID {
    public static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
        fatalError("TODO")
    }
}

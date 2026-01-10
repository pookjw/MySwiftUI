// 57DDCF0A00C1B77B475771403C904EF9
public import CoreGraphics
internal import AttributeGraph
internal import Spatial
private import _MySwiftUIShims

public struct LayoutSubviews: Equatable, RandomAccessCollection, Sendable {
    public typealias SubSequence = LayoutSubviews
    public typealias Element = LayoutSubview
    public typealias Index = Int
    
    fileprivate var context: AnyRuleContext
    fileprivate var storage: LayoutSubviews.Storage
    public var layoutDirection: LayoutDirection
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        switch storage {
        case .direct(let attributes):
            return attributes.endIndex
        case .indirect(let attributes):
            return attributes.endIndex
        }
    }
    
    public subscript(index: Int) -> LayoutSubview {
        switch storage {
        case .direct(let attributes):
            let attribute = attributes[index]
            return LayoutSubview(
                proxy: LayoutProxy(
                    context: context,
                    attributes: attribute
                ),
                index: Int32(index),
                containerLayoutDirection: layoutDirection
            )
        case .indirect(let attributes):
            let attribute = attributes[index]
            return LayoutSubview(
                proxy: LayoutProxy(
                    context: context,
                    attributes: attribute.attributes
                ),
                index: attribute.index,
                containerLayoutDirection: layoutDirection
            )
        }
    }
    
    public subscript(bounds: Range<Int>) -> LayoutSubviews {
        get {
            fatalError("TODO")
        }
    }
    
    public subscript<S>(indices: S) -> LayoutSubviews where S : Sequence, S.Element == Int {
        get {
            fatalError("TODO")
        }
    }
    
    public static func == (lhs: LayoutSubviews, rhs: LayoutSubviews) -> Bool {
        fatalError("TODO")
    }
    
    public typealias Indices = Range<LayoutSubviews.Index>
    public typealias Iterator = IndexingIterator<LayoutSubviews>
    
    func selecting<T: Sequence>(indices: T) -> LayoutSubviews where T.Element == Int {
        fatalError("TODO")
    }
}

public struct LayoutSubview : Equatable {
    let proxy: LayoutProxy
    fileprivate let index: Int32
    fileprivate let containerLayoutDirection: LayoutDirection
    
    public func _trait<K>(key: K.Type) -> K.Value where K : _ViewTraitKey {
        fatalError("TODO")
    }
    
    public subscript<K>(key: K.Type) -> K.Value where K : LayoutValueKey {
        get {
            fatalError("TODO")
        }
    }
    
    public var priority: Double {
        return proxy.layoutPriority
    }
    
    public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        fatalError("TODO")
    }
    
    public func dimensions(in proposal: ProposedViewSize) -> ViewDimensions {
        fatalError("TODO")
    }
    
    public var spacing: ViewSpacing {
        get {
            fatalError("TODO")
        }
    }
    
    public func place(at position: CGPoint, anchor: UnitPoint = .topLeading, proposal: ProposedViewSize) {
        fatalError("TODO")
    }
    
    func place(in: ViewGeometry, layoutDirection: LayoutDirection) {
        fatalError("TODO")
    }
    
    func lengthThatFits(_: ProposedViewSize, in: Axis) -> CGFloat {
        fatalError("TODO")
    }
    
    func place(at: CGPoint, anchor: UnitPoint, dimensions: ViewDimensions) {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension LayoutSubview : Sendable {
}

extension LayoutSubviews {
    fileprivate enum Storage: Equatable {
        case direct([LayoutProxyAttributes])
        case indirect([LayoutSubviews.Storage.IndexedAttributes])
    }
}

extension LayoutSubviews.Storage {
    fileprivate struct IndexedAttributes: Equatable {
        var attributes: LayoutProxyAttributes
        var index: Int32
    }
}

struct ViewLayoutEngine<L: Layout>: LayoutEngine {
    private var layout: L
    private var proxies: LayoutProxyCollection // 0x24
    private var layoutDirection: LayoutDirection // 0x28
    private var sizeCache = ViewSizeCache() // 0x2c
    private var cachedAlignmentSize = ViewSize.zero // 0x30
    private var cachedAlignmentGeometry: [ViewGeometry] = [] // 0x34
    private var cachedAlignment = Cache3<ObjectIdentifier, CGFloat?>() // 0x38
    private var preferredSpacing: Spacing? = nil // 0x3c
    private var depthCache = ViewLayoutEngine<L>.DepthCache() // 0x40
    private var cacheOfCaches = Cache3<CGFloat?, L.Cache>() // 0x44
    private var _cache: L.Cache? = nil // 0x48
    private var shouldUseCacheOfCache: Bool // 0x4c
    
    init(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        /*
         layout -> sp
         context -> x21
         children -> x20
         L -> x19
         self -> x22
         */
        self.proxies = children
        self.layoutDirection = context.layoutDirection
        self.layout = layout
        
        if isLinkedOnOrAfter(.v7) {
            shouldUseCacheOfCache = children.requiresTrueDepthLayout()
        } else {
            shouldUseCacheOfCache = false
        }
        
        self.cache = layout.makeCache(subviews: subviews)
    }
    
    func update(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        fatalError("TODO")
    }
    
    var subviews: LayoutSubviews {
        return LayoutSubviews(
            context: proxies.context,
            storage: .direct(proxies.attributes),
            layoutDirection: layoutDirection
        )
    }
    
    func spacing() -> Spacing {
        fatalError("TODO")
    }
    
    func layoutPriority() -> Double {
        fatalError("TODO")
    }
    
    func sizeThatFits(_: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    mutating func childGeometries(at size: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        /*
         size -> d8/d9/d10/d11
         origin -> d13/d13
         */
        // x19
        let count = proxies.attributes.count
        guard
            cachedAlignmentSize != size ||
                origin != .zero ||
                cachedAlignmentGeometry.count != count
        else {
            return cachedAlignmentGeometry
        }
        
        // size -> sp + 0x20
        // sp + 0xa8
        let proposal = size.proposal
        
        var placementData = PlacementData(
            signature: .placement,
            geometry: Array(repeating: ViewGeometry.invalidValue, count: count),
            unknown: 0,
            bounds: CGRect(origin: origin, size: size.value),
            layoutDirection: layoutDirection
        )
        
        withUnsafeMutablePointer(to: &placementData) { pointer in
            // $s7SwiftUI16ViewLayoutEngineV15childGeometries2at6originSayAA0C8GeometryVGAA0C4SizeV_So7CGPointVtFySpyAA13PlacementData33_57DDCF0A00C1B77B475771403C904EF9LLVGXEfU_
            /*
             origin -> d0, d1 -> d13, d12
             size.value -> d2, d3 / d4, d5 -> d11, d10
             size._proposal -> d7, d6 -> d9, d8
             proposal -> x2, x3, x4, x5 -> x29 - 0x168 (sp + 0x4a8)
             count -> x6 -> x22
             type descriptor -> x7 -> x27
             self -> x1 -> x26
             pointer -> x0 -> x24
             */
            // type metadata accessor for SwiftUI.ViewLayoutEngine -> x25
            let old = _threadLayoutData()
            _setThreadLayoutData(pointer)
            // layout -> x28
            // type metadata accessor for SwiftUI.ViewLayoutEngine -> x20
            layout.placeSubviews(in: CGRect(origin: origin, size: size.value), proposal: ProposedViewSize(proposal), subviews: subviews, cache: &cache)
            _setThreadLayoutData(old)
            
            guard pointer.pointee.unknown != count else {
                return 
            }
            
            // <+616>
            // sp + 0x4a8
            let proposedSize = size.proposal
            
            // x26
            for index in 0..<count {
                guard pointer.pointee.geometry[index].isInvalid else {
                    continue
                }
                
                // sp + 0x550
                let dimensions = proxies[index].dimensions(in: proposedSize)
                // dimensions.layoutComputer -> x20/x28
                
                // d8, d9, d10, d11
                let bounds = pointer.pointee.bounds
                let d13 = bounds.origin.x + bounds.width * 0.5
                let d0 = bounds.origin.y + bounds.height * 0.5
                // dimensions.layoutComputer -> sp + 0x510
                
//                pointer.pointee.setGeometry(<#T##ViewGeometry#>, at: index, layoutDirection: .leftToRight)
            }
            fatalError("TODO")
        }
        
        return placementData.geometry
    }
    
    func explicitAlignment(_: AlignmentKey, at: ViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    func defaultAlignment(_: AlignmentKey, size: ViewSize, data: UnsafeMutableRawPointer) {
        fatalError("TODO")
    }
    
    func updateCache() {
        fatalError("TODO")
    }
    
    var cache: L.Cache {
        get {
            if shouldUseCacheOfCache {
                return withStashedDepthProposal { _ in
                    // $s7SwiftUI16ViewLayoutEngineV5cache5CacheQzvgAF12CoreGraphics7CGFloatVSgXEfU_TA
                    fatalError("TODO")
                }
            } else {
                return _cache!
            }
        }
        set {
            if shouldUseCacheOfCache {
                let depth: CGFloat?
                if let data = _threadLayoutDepthData() {
                    depth = data
                        .assumingMemoryBound(to: CGFloat?.self)
                        .pointee
                } else {
                    depth = nil
                }
                
                // FIXME
                { (depth: CGFloat?) -> () in
                    cacheOfCaches.put(depth, value: newValue)
                }(depth)
            } else {
                _cache = newValue
            }
        }
    }
    
    mutating func depthThatFits(_ size: _ProposedSize3D) -> CGFloat {
        var depthCache = depthCache
        let depth = depthCache.depthSize.get(size) {
            let viewSize = ViewSize(
                CGSize(width: size.width ?? .nan, height: size.height ?? .nan),
                proposal: _ProposedSize(width: size.width, height: size.height)
            )
            let geometries = childGeometries(at: viewSize, origin: .zero)
            return L.defaultDepthThatFits(size, children: proxies, geometries: geometries)
        }
        self.depthCache = depthCache
        return depth
    }
    
    func explicitDepthAlignment(_: DepthAlignmentKey, at: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
    
    func childDepths(at: ViewSize3D, childGeometries: [ViewGeometry]) -> [ViewDepth] {
        fatalError("TODO")
    }
}

extension ViewLayoutEngine {
    struct DepthCache {
        fileprivate var depthSize: Cache3<_ProposedSize3D, CGFloat>
        private var childDepthProposal: ViewSize3D
        private var childDepths: [ViewDepth]
        
        init() {
            depthSize = Cache3()
            childDepthProposal = .zero
            childDepths = []
        }
    }
}

struct ViewSizeCache {
    private var cache: Cache3<_ProposedSize3D, CGSize>
    
    init(cache: Cache3<_ProposedSize3D, CGSize> = Cache3()) {
        self.cache = cache
    }
    
    mutating func get(_ key: _ProposedSize, makeValue: () -> CGSize) -> CGSize {
        fatalError("TODO")
    }
}

struct LayoutProxy: Equatable {
    private var context: AnyRuleContext
    private var attributes: LayoutProxyAttributes
    
    func requiresTrueDepthLayout() -> Bool {
        fatalError("TODO")
    }
    
    func dimensions3D(in proposedSize: _ProposedSize3D) -> ViewDimensions3D {
        fatalError("TODO")
    }
    
    func explicitDepthAlignment(_ key: DepthAlignmentKey, at size: ViewSize3D) -> CGFloat? {
        fatalError("TODO")
    }
    
    func depth(in proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
    }
    
    func idealDepth() -> CGFloat {
        fatalError("TODO")
    }
    
    func finallyPlaced3D(at placement: Placement3D, in size: Size3D, layoutDirection: LayoutDirection) -> ViewGeometry3D {
        fatalError("TODO")
    }
    
    func volume(in proposedSize: _ProposedSize3D) -> Size3D {
        fatalError("TODO")
    }
    
    func size(in proposedSize: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    var layoutPriority: Double {
        return layoutComputer.layoutPriority
    }
    
    init(context: AnyRuleContext, layoutComputer: Attribute<LayoutComputer>?) {
        self.context = context
        self.attributes = LayoutProxyAttributes(
            layoutComputer: OptionalAttribute(layoutComputer),
            traitsList: OptionalAttribute()
        )
    }
    
    var ignoresAutomaticPadding: Bool {
        fatalError("TODO")
    }
    
    var requiresSpacingProjection: Bool {
        fatalError("TODO")
    }
    
    func spacing() -> Spacing {
        fatalError("TODO")
    }
    
    func explicitAlignment(_ key: AlignmentKey, at size: ViewSize) -> CGFloat? {
        fatalError("TODO")
    }
    
    func finallyPlaced(at placement: _Placement, in size: CGSize, layoutDirection: LayoutDirection) -> ViewGeometry {
        fatalError("TODO")
    }
    
    func dimensions(in proposedSize: _ProposedSize) -> ViewDimensions {
        fatalError("TODO")
    }
    
    var layoutComputer: LayoutComputer {
        if let layoutComputer = attributes.$layoutComputer {
            let rule = context.unsafeCast(to: LayoutComputer.self)
            return rule[layoutComputer]
        } else {
            return .defaultValue
        }
    }
    
    init(context: AnyRuleContext, attributes: LayoutProxyAttributes) {
        self.context = context
        self.attributes = attributes
    }
    
    var traits: ViewTraitCollection? {
        fatalError("TODO")
    }
    
    subscript<A: _ViewTraitKey>(_: A.Type) -> A.Value {
        fatalError("TODO")
    }
    
    func idealSize() -> CGSize {
        fatalError("TODO")
    }
    
    func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        fatalError("TODO")
    }
}

struct LayoutProxyCollection {
    fileprivate private(set) var context: AnyRuleContext
    fileprivate private(set) var attributes: [LayoutProxyAttributes]
    
    init(context: AnyRuleContext, attributes: [LayoutProxyAttributes]) {
        self.context = context
        self.attributes = attributes
    }
    
    var startIndex: Int {
        fatalError("TODO")
    }
    
    var endIndex: Int {
        fatalError("TODO")
    }
    
    subscript(_ index: Int) -> LayoutProxy {
        _read {
            let proxy = LayoutProxy(context: context, attributes: attributes[index])
            yield proxy
        }
    }
    
    func requiresTrueDepthLayout() -> Bool {
        // x26
        guard !attributes.isEmpty else {
             return false
        }
        
        var result = false
        // context -> w21
        
        for attribute in attributes {
            guard !result else {
                continue
            }
            
            let layoutComputer: LayoutComputer
            if let _layoutComputer = attribute.$layoutComputer {
                // <+168>
                layoutComputer = context[_layoutComputer]
            } else {
                layoutComputer = .defaultValue
            }
            
            result = layoutComputer.requiresTrueDepthLayout()
        }
        
        return result
    }
}

struct LayoutProxyAttributes: Equatable {
    @OptionalAttribute fileprivate var layoutComputer: LayoutComputer?
    @OptionalAttribute private var traitsList: ViewList?
    
    init(layoutComputer: OptionalAttribute<LayoutComputer>, traitsList: OptionalAttribute<ViewList>) {
        _layoutComputer = layoutComputer
        _traitsList = traitsList
    }
    
    init(traitsList: OptionalAttribute<ViewList>) {
        _layoutComputer = OptionalAttribute()
        _traitsList = traitsList
    }
    
    init(layoutComputer: OptionalAttribute<LayoutComputer>) {
        _layoutComputer = layoutComputer
        _traitsList = OptionalAttribute()
    }
    
    init() {
        _layoutComputer = OptionalAttribute()
        _traitsList = OptionalAttribute()
    }
    
    var isEmpty: Bool {
        return ($layoutComputer == nil) && ($traitsList == nil)
    }
}

fileprivate struct PlacementData {
    let signature: DataSignature
    var geometry: [ViewGeometry]
    let unknown: Int
    let bounds: CGRect
    let layoutDirection: LayoutDirection
    
    mutating func setGeometry(_: ViewGeometry, at: Int, layoutDirection: LayoutDirection) {
        fatalError("TODO")
    }
}

fileprivate enum DataSignature {
    case placement
    case alignment
}

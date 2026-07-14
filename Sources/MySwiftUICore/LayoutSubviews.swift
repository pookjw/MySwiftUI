// 57DDCF0A00C1B77B475771403C904EF9
public import CoreGraphics
internal import AttributeGraph
internal import Spatial
private import _MySwiftUIShims

public struct LayoutSubviews : Equatable, RandomAccessCollection, Sendable {
    public typealias SubSequence = LayoutSubviews
    public typealias Element = LayoutSubview
    public typealias Index = Int
    
    fileprivate var context: AnyRuleContext
    fileprivate var storage: LayoutSubviews.Storage
    public var layoutDirection: LayoutDirection
    
    @inline(always) // 원래 없음
    init(
        context: AnyRuleContext,
        attributes: [LayoutProxyAttributes],
        layoutDirection: LayoutDirection
    ) {
        self.context = context
        self.storage = .direct(attributes)
        self.layoutDirection = layoutDirection
    }
    
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
            assertUnimplemented()
        }
    }
    
    public subscript<S>(indices: S) -> LayoutSubviews where S : Sequence, S.Element == Int {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (lhs: LayoutSubviews, rhs: LayoutSubviews) -> Bool {
        assertUnimplemented()
    }
    
    public typealias Indices = Range<LayoutSubviews.Index>
    public typealias Iterator = IndexingIterator<LayoutSubviews>
    
    func selecting<T : Sequence>(indices: T) -> LayoutSubviews where T.Element == Int {
        assertUnimplemented()
    }
}

public struct LayoutSubview : Equatable {
    let proxy: LayoutProxy
    let index: Int32
    fileprivate let containerLayoutDirection: LayoutDirection
    
    public func _trait<K>(key: K.Type) -> K.Value where K : _ViewTraitKey {
        assertUnimplemented()
    }
    
    public subscript<K>(key: K.Type) -> K.Value where K : LayoutValueKey {
        get {
            assertUnimplemented()
        }
    }
    
    public var priority: Double {
        return proxy.layoutPriority
    }
    
    public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        return proxy.size(in: _ProposedSize(width: proposal.width, height: proposal.height))
    }
    
    public func dimensions(in proposal: ProposedViewSize) -> ViewDimensions {
        assertUnimplemented()
    }
    
    public var spacing: ViewSpacing {
        return ViewSpacing(proxy.spacing(), layoutDirection: containerLayoutDirection)
    }
    
    public func place(at position: CGPoint, anchor: UnitPoint = .topLeading, proposal: ProposedViewSize) {
        place(at: position, anchor: anchor, dimensions: proxy.dimensions(in: _ProposedSize(width: proposal.width, height: proposal.height)))
    }
    
    func place(in geometry: ViewGeometry, layoutDirection: LayoutDirection) {
        let placementDataPointer = unsafe _threadLayoutData()!
            .assumingMemoryBound(to: PlacementData.self)
        
        unsafe assert(placementDataPointer.pointee.signature == .placement)
        
        unsafe placementDataPointer
            .pointee
            .setGeometry(geometry, at: Int(index), layoutDirection: layoutDirection)
    }
    
    func lengthThatFits(_ size: ProposedViewSize, in axis: Axis) -> CGFloat {
        return proxy.lengthThatFits(_ProposedSize(width: size.width, height: size.height), in: axis)
    }
    
    func place(at position: CGPoint, anchor: UnitPoint, dimensions: ViewDimensions) {
        let d0 = position.x
        let d1 = position.y
        let d2 = anchor.x
        let d3 = anchor.y
        let d4 = dimensions.size.width
        let d7 = dimensions.size.height
        
        var d5 = d4 * d2
        d5 = d0 - d5
        if d2 == 0 {
            d5 = d0
        }
        var d6 = d3 * d7
        d6 = d1 - d6
        if d3 == 0 {
            d6 = d1
        }
        
        guard !d5.isNaN && !d6.isNaN else {
            fatalError("view origin is invalid: \(CGPoint(x: d0, y: d1))")
        }
        
        place(in: ViewGeometry(origin: CGPoint(x: d5, y: d6), dimensions: dimensions), layoutDirection: .leftToRight)
    }
}

@available(*, unavailable)
extension LayoutSubview : Sendable {
}

extension LayoutSubviews {
    fileprivate enum Storage : Equatable {
        case direct([LayoutProxyAttributes])
        case indirect([LayoutSubviews.Storage.IndexedAttributes])
    }
}

extension LayoutSubviews.Storage {
    fileprivate struct IndexedAttributes : Equatable {
        var attributes: LayoutProxyAttributes
        var index: Int32
    }
}

struct ViewLayoutEngine<L : Layout>: LayoutEngine {
    private(set) var layout: L
    private(set) var proxies: LayoutProxyCollection // 0x24
    private(set) var layoutDirection: LayoutDirection // 0x28
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
    
    mutating func update(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        /*
         self -> x19
         layout -> x0
         context.owner/environment -> w28, w26
         children -> sp + 0xc
         */
        // x22
        self.proxies = children
        
        // <+112>
        // inlined
        // self -> x21
        self.layoutDirection = context.layoutDirection
        
        // <+368>
        self.layout = layout
        self.sizeCache = ViewSizeCache()
        self.cachedAlignmentGeometry = []
        self.cachedAlignment = Cache3()
        self.depthCache = ViewLayoutEngine.DepthCache()
        
        let shouldUseCacheOfCache: Bool
        if isLinkedOnOrAfter(.v7) {
            shouldUseCacheOfCache = children.requiresTrueDepthLayout()
        } else {
            shouldUseCacheOfCache = false
        }
        self.shouldUseCacheOfCache = shouldUseCacheOfCache
        
        self.preferredSpacing = nil
        updateCache()
    }
    
    var subviews: LayoutSubviews {
        return LayoutSubviews(
            context: proxies.context,
            attributes: proxies.attributes,
            layoutDirection: layoutDirection
        )
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    mutating func sizeThatFits(_ size: _ProposedSize) -> CGSize {
        /*
         size -> x22
         */
        let subviews = subviews
        
        // inlined
        var sizeCache = sizeCache
        let size = sizeCache.get(size) { 
            layout.sizeThatFits(
                proposal: ProposedViewSize(size),
                subviews: subviews,
                cache: &self.cache
            )
        }
        self.sizeCache = sizeCache
        
        return size
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
        
        var placementData = unsafe PlacementData(
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
            let old = unsafe _threadLayoutData()
            unsafe _setThreadLayoutData(pointer)
            // layout -> x28
            // type metadata accessor for SwiftUI.ViewLayoutEngine -> x20
            layout.placeSubviews(in: CGRect(origin: origin, size: size.value), proposal: ProposedViewSize(proposal), subviews: subviews, cache: &cache)
            unsafe _setThreadLayoutData(old)
            
            guard unsafe pointer.pointee.unknown != count else {
                return 
            }
            
            // <+616>
            // sp + 0x4a8
            let proposedSize = size.proposal
            
            // x26
            for index in 0..<count {
                guard unsafe pointer.pointee.geometry[index].isInvalid else {
                    continue
                }
                
                // sp + 0x550
                let dimensions = proxies[index].dimensions(in: proposedSize)
                unsafe pointer.pointee.setGeometry(
                    dimensions.centered(in: CGSize(pointer.pointee.bounds.center)),
                    at: index,
                    layoutDirection: .leftToRight
                )
            }
        }
        
        return placementData.geometry
    }
    
    mutating func explicitAlignment(_ key: AlignmentKey, at size: ViewSize) -> CGFloat? {
        /*
         key -> x0 -> x21
         size -> x1
         L -> x2 -> x19
         */
        if !(self.cachedAlignmentSize == size) {
            self.cachedAlignmentSize = size
            self.cachedAlignmentGeometry = []
            self.cachedAlignment = Cache3()
        }
        
        // <+148>
        // x24
        let _key = key.id
        if let cached = self.cachedAlignment.find(ObjectIdentifier(_key)) {
            return cached
        }
        
        let result: CGFloat? = withUnsafeMutablePointer(to: &self) { selfPtr in
            // $s7SwiftUI16ViewLayoutEngineV17explicitAlignment_2at12CoreGraphics7CGFloatVSgAA0G3KeyV_AA0C4SizeVtFAISpyACyxGGXEfU_TA
            /*
             selfPtr -> x0 -> x26
             size -> d0/d1/d2/d3 -> d11/d10/d9/d8
             key -> x1 -> x25 -> x1
             _key -> x2/x3 -> x24/x23
             L -> x4/x5 -> x22/x20
             */
            var alignmentData = AlignmentData(
                flag: true,
                function: Self.self,
                size: size
            )
            
            // inlined
            return alignmentData.asCurrent { _ -> CGFloat? in
                // $s7SwiftUI16ViewLayoutEngineV17explicitAlignment_2at12CoreGraphics7CGFloatVSgAA0G3KeyV_AA0C4SizeVtFAISpyACyxGGXEfU_AISpyAA0G4Data33_57DDCF0A00C1B77B475771403C904EF9LLVGXEfU_
                /*
                 _ -> x0
                 key -> x1 -> x24
                 selfPtr -> x2 -> x23
                 _key -> x3/x4 -> x29 - 0xe0 / x29 - 0xd8
                 L -> x5/x6
                 size -> d0/d1/d2/d3 -> d9/d8/d11/d10
                 */
                // <+240>
                switch key.axis {
                case .horizontal:
                    // <+248>
                    // x19
                    let copy_1 = selfPtr.pointee
                    // selfPtr -> x23 -> x20
                    
                    // x24
                    let alignment = HorizontalAlignment(_key)
                    
                    // <+328>
                    let proposal = ProposedViewSize(size.proposal)
                    
                    // x27
                    let copy_2 = selfPtr.pointee
                    
                    let subviews = LayoutSubviews(
                        context: copy_2.proxies.context,
                        attributes: copy_2.proxies.attributes,
                        layoutDirection: copy_2.layoutDirection
                    )
                    
                    let result = copy_1.layout.explicitAlignment(
                        of: alignment,
                        in: CGRect(origin: .zero, size: size.value),
                        proposal: ProposedViewSize(size.proposal),
                        subviews: subviews,
                        cache: &selfPtr.pointee.cache
                    )
                    
                    return result
                case .vertical:
                    // <+580>
                    // x28
                    let copy_1 = selfPtr.pointee
                    // selfPtr -> x23 -> x20
                    
                    // x22
                    let alignment = VerticalAlignment(_key)
                    
                    // <+660>
                    let proposal = ProposedViewSize(size.proposal)
                    
                    // x27
                    let copy_2 = selfPtr.pointee
                    
                    let subviews = LayoutSubviews(
                        context: copy_2.proxies.context,
                        attributes: copy_2.proxies.attributes,
                        layoutDirection: copy_2.layoutDirection
                    )
                    
                    let result = copy_1.layout.explicitAlignment(
                        of: alignment,
                        in: CGRect(origin: .zero, size: size.value),
                        proposal: proposal,
                        subviews: subviews,
                        cache: &selfPtr.pointee.cache
                    )
                    
                    return result
                }
                
                assertUnimplemented()
            }
        }
        
        self.cachedAlignment.put(ObjectIdentifier(_key), value: result)
        return result
    }
    
    func defaultAlignment(_ key: AlignmentKey, size: ViewSize, data: UnsafeMutableRawPointer) {
        assertUnimplemented()
    }
    
    mutating func updateCache() {
        if shouldUseCacheOfCache {
            // <+436>
            // offset of cacheOfCaches -> sp + 0xb0
            cacheOfCaches = cacheOfCaches.map { incoming in
                guard var unwrapped = incoming else {
                    return nil
                }
                
                layout.updateCache(&unwrapped.value, subviews: subviews)
                return unwrapped
            }
        } else {
            // <+880>
            // sp + 0xa0
            let layout = layout
            // sp + 0x120
            let subviews = subviews
            // sp + 0x108
            let copy_1 = subviews
            // <+952>
            layout.updateCache(&cache, subviews: copy_1)
        }
    }
    
    var cache: L.Cache {
        get {
            if shouldUseCacheOfCache {
                return withStashedDepthProposal { _ in
                    // $s7SwiftUI16ViewLayoutEngineV5cache5CacheQzvgAF12CoreGraphics7CGFloatVSgXEfU_TA
                    assertUnimplemented()
                }
            } else {
                return _cache!
            }
        }
        set {
            if shouldUseCacheOfCache {
                let depth: CGFloat?
                if let data = unsafe _threadLayoutDepthData() {
                    depth = unsafe data
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
        assertUnimplemented()
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return self.proxies.requiresTrueDepthLayout()
    }
    
    mutating func childDepths(at size: ViewSize3D, childGeometries: [ViewGeometry]) -> [ViewDepth] {
        /*
         self -> x21
         childGeometries -> sp + 0x18
         */
        // sp + 0x30
        let size_1 = size
        // sp + 0x8
        let count = proxies.count
        // childDepthProposal, childDepths -> sp + 0x70
        let depthCache = depthCache
        
        // <+116>
        if depthCache.childDepthProposal == size_1 {
            let childDepths = depthCache.childDepths
            if childDepths.count == count {
                return childDepths
            }
        }
        
        // <+184>
        // sp + 0x70
        let size_2 = size
        // sp + 0x30
        let proposal = size_2.proposal
        // sp + 0x70
        let subviews = subviews
        
        let depths: [ViewDepth] = subviews
            .enumerated()
            .map { [childGeometries, depth = proposal.depth] index, subview in
                // sp
                let geometry = childGeometries[index]
                // sp + 0x30
                let proposal = geometry.dimensions.size.proposal
                let subview3D = LayoutSubview3D(base: subview)
                let size3D = _ProposedSize3D(width: proposal.width, height: proposal.height, depth: depth)
                let value = subview3D.depthThatFits(size3D)
                return ViewDepth(value, proposal: depth)
            }
        
        self.depthCache.childDepths = depths
        return depths
    }
}

extension ViewLayoutEngine {
    struct DepthCache {
        fileprivate var depthSize: Cache3<_ProposedSize3D, CGFloat>
        fileprivate private(set) var childDepthProposal: ViewSize3D
        fileprivate var childDepths: [ViewDepth]
        
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
    
    @inline(always) mutating func get(_ key: _ProposedSize, makeValue: () -> CGSize) -> CGSize {
        let depth: CGFloat?
        if let layoutDepthData = unsafe _threadLayoutDepthData() {
            depth = unsafe layoutDepthData
                .assumingMemoryBound(to: CGFloat?.self)
                .pointee
        } else {
            depth = nil
        }
        
        let key3D = _ProposedSize3D(width: key.width, height: key.height, depth: depth)
        
        let result = cache.get(key3D, makeValue: makeValue)
        if let recorder = unsafe LayoutTrace.recorder {
            recorder.cacheLookup = (proposal: key, hit: false)
        }
        
        return result
    }
}

package struct LayoutProxy : Equatable {
    private var context: AnyRuleContext
    private var attributes: LayoutProxyAttributes
    
    func requiresTrueDepthLayout() -> Bool {
        return layoutComputer.requiresTrueDepthLayout()
    }
    
    package func dimensions3D(in proposedSize: _ProposedSize3D) -> ViewDimensions3D {
        let volume = self.layoutComputer.volumeThatFits(proposedSize)
        
        return ViewDimensions3D(
            guideComputer: self.layoutComputer,
            size: volume,
            proposal: proposedSize
        )
    }
    
    func explicitDepthAlignment(_ key: DepthAlignmentKey, at size: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    package func depth(in proposedSize: _ProposedSize3D) -> CGFloat {
        return layoutComputer.depthThatFits(proposedSize)
    }
    
    func idealDepth() -> CGFloat {
        return layoutComputer.depthThatFits(.unspecified)
    }
    
    func finallyPlaced3D(at placement: Placement3D, in size: Size3D, layoutDirection: LayoutDirection) -> ViewGeometry3D {
        assertUnimplemented()
    }
    
    func volume(in proposedSize: _ProposedSize3D) -> Size3D {
        return layoutComputer.volumeThatFits(proposedSize)
    }
    
    func size(in proposedSize: _ProposedSize) -> CGSize {
        return layoutComputer.sizeThatFits(proposedSize)
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
        assertUnimplemented()
    }
    
    var requiresSpacingProjection: Bool {
        return layoutComputer.requiresSpacingProjection()
    }
    
    func spacing() -> Spacing {
        return layoutComputer.spacing()
    }
    
    func explicitAlignment(_ key: AlignmentKey, at size: ViewSize) -> CGFloat? {
        return layoutComputer.explicitAlignment(key, at: size)
    }
    
    func finallyPlaced(at placement: _Placement, in size: CGSize, layoutDirection: LayoutDirection) -> ViewGeometry {
        let dimenstions = self.dimensions(in: placement.proposedSize_)
        var geometry = ViewGeometry(placement: placement, dimensions: dimenstions)
        geometry.finalizeLayoutDirection(layoutDirection, parentSize: size)
        return geometry
    }
    
    func dimensions(in proposedSize: _ProposedSize) -> ViewDimensions {
        let layoutComputer = layoutComputer
        let size = layoutComputer.sizeThatFits(proposedSize)
        return ViewDimensions(guideComputer: layoutComputer, size: size, proposal: proposedSize)
    }
    
    var layoutComputer: LayoutComputer {
        if let layoutComputer = attributes.$layoutComputer {
            return self.context[layoutComputer]
        } else {
            return .defaultValue
        }
    }
    
    init(context: AnyRuleContext, attributes: LayoutProxyAttributes) {
        self.context = context
        self.attributes = attributes
    }
    
    var traits: ViewTraitCollection? {
        assertUnimplemented()
    }
    
    subscript<A : _ViewTraitKey>(_: A.Type) -> A.Value {
        assertUnimplemented()
    }
    
    func idealSize() -> CGSize {
        assertUnimplemented()
    }
    
    func lengthThatFits(_ size: _ProposedSize, in axis: Axis) -> CGFloat {
        return layoutComputer.lengthThatFits(size, in: axis)
    }
}

struct LayoutProxyCollection : RandomAccessCollection {
    private(set) var context: AnyRuleContext
    private(set) var attributes: [LayoutProxyAttributes]
    
    init(context: AnyRuleContext, attributes: [LayoutProxyAttributes]) {
        self.context = context
        self.attributes = attributes
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return attributes.endIndex
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

struct LayoutProxyAttributes : Equatable {
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
    
    mutating func setGeometry(_ geometry: ViewGeometry, at index: Int, layoutDirection: LayoutDirection) {
        /*
         index -> x21
         layoutDirection -> w22
         */
        // sp + 0x80
        let copy_1 = geometry
        /*
         self.geometry -> x19
         */
        self.geometry[index] = copy_1
        
        // <+176>
        if layoutDirection != self.layoutDirection {
            let d8 = bounds.origin.x
            var d9 = bounds.origin.y
            let d10 = bounds.size.width
            let d11 = bounds.size.height
            // sp
            let _ = copy_1
            
            var d0 = d8
            var d1 = d9
            var d2 = d10
            var d3 = d11
            
            d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
            d9 = d0
            
            let frame = self.geometry[index].frame
            d0 = frame.origin.x
            d1 = frame.origin.y
            d2 = frame.size.width
            d3 = frame.size.height
            
            d0 = CGRect(x: d0, y: d1, width: d2, height: d3).maxX
            
            d0 = d0 - d8
            d0 = d9 - d0
            
            self.geometry[index].origin.x = d0
        }
    }
}

fileprivate enum DataSignature {
    case placement
    case alignment
}

fileprivate struct AlignmentData {
    let flag: Bool
    let function: (any DefaultAlignmentFunction.Type)
    let size: ViewSize
    
    @inline(always) // 원래 없음
    mutating func asCurrent<T>(_ block: (UnsafeMutablePointer<AlignmentData>) -> T) -> T {
        return withUnsafeMutablePointer(to: &self) { pointer in
            let oldLayoutData = unsafe _threadLayoutData()
            unsafe _setThreadLayoutData(pointer)
            let result = unsafe block(pointer)
            unsafe _setThreadLayoutData(oldLayoutData)
            return result
        }
    }
}

fileprivate protocol DefaultAlignmentFunction {
    static func defaultAlignment(_ key: AlignmentKey, size: ViewSize, data: UnsafeMutableRawPointer) -> CGFloat?
}

extension ViewLayoutEngine : DefaultAlignmentFunction {
    static func defaultAlignment(_ key: AlignmentKey, size: ViewSize, data: UnsafeMutableRawPointer) -> CGFloat? {
        assertUnimplemented()
    }
}

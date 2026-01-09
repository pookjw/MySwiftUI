// 57DDCF0A00C1B77B475771403C904EF9
public import CoreGraphics
internal import AttributeGraph
internal import Spatial

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
    
    func childGeometries(at: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        fatalError("TODO")
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
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    func depthThatFits(_: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
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
        private var depthSize: Cache3<_ProposedSize3D, CGFloat>
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
            fatalError("TODO")
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

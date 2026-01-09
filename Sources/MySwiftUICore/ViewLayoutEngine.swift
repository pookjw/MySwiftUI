internal import CoreGraphics

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
        fatalError("TODO")
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
        _modify {
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

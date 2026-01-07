internal import CoreGraphics

struct ViewLayoutEngine<L: Layout>: LayoutEngine {
    private var layout: L
    private var proxies: LayoutProxyCollection
    private var layoutDirection: LayoutDirection
    private var sizeCache: ViewSizeCache
    private var cachedAlignmentSize: ViewSize
    private var cachedAlignmentGeometry: [ViewGeometry]
    private var cachedAlignment: Cache3<ObjectIdentifier, CGFloat?>
    private var preferredSpacing: Spacing?
    private var depthCache: ViewLayoutEngine<L>.DepthCache
    private var cacheOfCaches: Cache3<CGFloat?, L.Cache>
    private var _cache: L.Cache?
    private var shouldUseCacheOfCache: Bool
    
    init(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        /*
         layout -> sp
         context -> x21
         children -> x20
         */
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

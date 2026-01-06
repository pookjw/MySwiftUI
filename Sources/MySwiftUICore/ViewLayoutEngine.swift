private import CoreGraphics

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
        fatalError("TODO")
    }
}

extension ViewLayoutEngine {
    struct DepthCache {
        private var depthSize: Cache3<_ProposedSize3D, CGFloat>
        private var childDepthProposal: ViewSize3D
        private var childDepths: [ViewDepth]
    }
}

struct ViewSizeCache {
    private var cache: Cache3<_ProposedSize3D, CGSize>
}

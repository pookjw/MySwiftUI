// 57DDCF0A00C1B77B475771403C904EF9
private import _MySwiftUIShims
private import CoreGraphics

struct ViewPlacementCache {
    private var cache = Cache3<ViewPlacementCache.Key, _Placement>()
    
    init() {
    }
    
    // 원래 없음
    @inline(always) mutating func get(_ viewSize: ViewSize, makeValue: () -> _Placement) -> _Placement {
        let depth: CGFloat?
        if let layoutDepthData = unsafe _threadLayoutDepthData() {
            depth = unsafe layoutDepthData
                .assumingMemoryBound(to: CGFloat?.self)
                .pointee
        } else {
            depth = nil
        }
        
        let key = ViewPlacementCache.Key(viewSize: viewSize, depthProposal: depth)
        return cache.get(key, makeValue: makeValue)
    }
}

extension ViewPlacementCache {
    fileprivate struct Key : Equatable {
        let viewSize: ViewSize
        let depthProposal: CGFloat?
    }
}

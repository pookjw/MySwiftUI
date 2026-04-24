// 57DDCF0A00C1B77B475771403C904EF9
private import CoreGraphics

struct ViewPlacementCache {
    private var cache = Cache3<ViewPlacementCache.Key, _Placement>()
    
    init() {
    }
}

extension ViewPlacementCache {
    fileprivate struct Key : Equatable {
        private let viewSize: ViewSize
        private let depthProposal: CGFloat?
    }
}

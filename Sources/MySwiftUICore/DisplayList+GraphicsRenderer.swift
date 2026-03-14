// EFAEDE41CB8C85EF3A6A18DC05438A3C

private import CoreGraphics

extension DisplayList {
    final class GraphicsRenderer {
        private var oldCache: DisplayList.GraphicsRenderer.Cache
        private var newCache: DisplayList.GraphicsRenderer.Cache
        private var index: DisplayList.Index
        private var time: Time
        private var nextTime: Time
        private var stableIDs: _DisplayList_StableIdentityMap?
        private var inTransitionGroup: Bool
        private var stateHashes: [StrongHash]
        var platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            assertUnimplemented()
        }
    }
}
extension DisplayList.GraphicsRenderer {
    enum PlatformViewMode {
        case rendered(update: Bool)
        case ignored
        case unsupported
    }
    
    fileprivate struct Cache {
//        private var callbacks: [DisplayList.GraphicsRenderer.Cache.CallbackKey: Void /* TODO */]
        private var animators: [DisplayList.GraphicsRenderer.Cache.AnimatorKey: any _DisplayList_AnyEffectAnimator]
    }
}

extension DisplayList.GraphicsRenderer.Cache {
    fileprivate struct AnimatorKey: Hashable {
        private var index: DisplayList.Index.ID
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey, rhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    fileprivate struct CallbackKey: Hashable {
        private var index: DisplayList.Index.ID
        private var seed: DisplayList.Seed
        private var scale: CGFloat
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.CallbackKey, rhs: DisplayList.GraphicsRenderer.Cache.CallbackKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

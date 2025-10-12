internal import _QuartzCorePrivate

extension DisplayList.ViewUpdater {
    struct ViewCache {
        var map: [DisplayList.ViewUpdater.ViewCache.Key: DisplayList.ViewUpdater.ViewInfo] = [:]
        var reverseMap: [OpaquePointer: DisplayList.ViewUpdater.ViewCache.Key /* DisplayCache.Key이라고 표기되어 있는데 이런건 없음 */] = [:]
        var removed: Set<DisplayList.ViewUpdater.ViewCache.Key> = []
        fileprivate var animators: [DisplayList.ViewUpdater.ViewCache.Key: DisplayList.ViewUpdater.ViewCache.AnimatorInfo] = [:]
        fileprivate var asyncValues: [ObjectIdentifier: DisplayList.ViewUpdater.ViewCache.AsyncValues] = [:]
        fileprivate var pendingAsyncValues: [ObjectIdentifier: [DisplayList.ViewUpdater.ViewCache.PendingAsyncValue]] = [:]
        var asyncModifierGroup: CAPresentationModifierGroup? = nil
        var pendingAsyncUpdates: [() -> Void] = []
        var index = DisplayList.Index()
        var cacheSeed: UInt32 = 0
        var currentList = DisplayList()
        
        init() {}
        
        mutating func invalidateAll() {
            // self = sp + 0x8
            var map = map
            
            for (key, value) in self.map {
                var value = value
                value.isInvalid = true
                map[key] = value
            }
            
            self.map = map
        }
        
        mutating func clearAsyncValues() {
            // self = x20 = sp
            // x19
            let asyncValues = self.asyncValues
            
            fatalError("TODO")
        }
        
        func prepare(
            item: inout DisplayList.Item,
            platform: DisplayList.ViewUpdater.Platform,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Time {
            fatalError("TODO")
        }
        
        func reclaim(time: Time) {
            fatalError("TODO")
        }
    }
}


extension DisplayList.ViewUpdater.ViewCache {
    struct Key: Hashable {
        private var id: DisplayList.Index.ID
        private var system: PlatformViewDefinition.System
        private var tag: DisplayList.ViewUpdater.ViewCache.Tag
        
        static func == (lhs: DisplayList.ViewUpdater.ViewCache.Key, rhs: DisplayList.ViewUpdater.ViewCache.Key) -> Bool {
            fatalError("TODO")
        }
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
    }
    
    fileprivate struct AsyncValues {
        private var animations: Set<String>
        private var modifiers: [String: CAPresentationModifier]
    }
    
    fileprivate struct PendingAsyncValue {
        private var keyPath: String
        private var value: NSObject
        private var usesPresentationModifier: Bool
    }
}

extension DisplayList.ViewUpdater.ViewCache {
    fileprivate struct AnimatorInfo {
        private var state: DisplayList.ViewUpdater.ViewCache.AnimatorInfo.State
        private var deadline: Time
    }
    
    enum Tag {
        case item
        case inherited
    }
}

extension DisplayList.ViewUpdater.ViewCache.AnimatorInfo {
    fileprivate enum State {
        case active(any _DisplayList_AnyEffectAnimator)
        case finished(DisplayList.Effect, DisplayList.Version)
        case idle
    }
}

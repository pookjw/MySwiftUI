internal import _QuartzCorePrivate
private import QuartzCore
private import _MySwiftUIShims

extension DisplayList.ViewUpdater {
    @safe struct ViewCache {
        var map: [DisplayList.ViewUpdater.ViewCache.Key: DisplayList.ViewUpdater.ViewInfo] = [:]
        var reverseMap: [OpaquePointer: DisplayList.ViewUpdater.ViewCache.Key] = unsafe [:]
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
            for (key, value) in self.asyncValues {
                // x19
                let animations = value.animations
                // x21
                let modifiers = value.modifiers
                
                let layer = unsafe unsafeBitCast(key, to: CALayer.self)
                
                for animation in animations {
                    layer.removeAnimation(forKey: animation)
                }
                
                for modifier in modifiers.values {
                    layer.removePresentationModifier(modifier)
                }
            }
        }
        
        func prepare(
            item: inout DisplayList.Item,
            platform: DisplayList.ViewUpdater.Platform,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Time {
            // x29 = sp + 0x1d0
            /*
             item = x24
             platform = x27
             parentState = sp + 0x210
             */
            
            // <+132>
            switch item.value {
            case .content(let content):
                // <+404>
                switch content.value {
                case .shape(let path, let anyResolvedPaint, let fillStyle):
                    // <+416>
                    fatalError("TODO")
                default:
                    return .infinity
                }
            case .effect(let effect, let displayList):
                // <+156>
                fatalError("TODO")
            default:
                // <+676>
                return .infinity
            }
        }
        
        mutating func reclaim(time: Time) {
            for removedKey in self.removed {
                guard let viewInfo = map[removedKey] else {
                    continue
                }
                
                guard viewInfo.isRemoved else {
                    continue
                }
                
                map.removeValue(forKey: removedKey)
                // x25
                let view = viewInfo.view
                unsafe reverseMap.removeValue(forKey: OpaquePointer(Unmanaged.passUnretained(view).toOpaque()))
                
                // w24
                let kind = viewInfo.state.kind
                switch kind {
                case .inherited:
                    break
                case .color:
                    continue
                case .image:
                    continue
                case .shape:
                    continue
                case .sdfLayer:
                    continue
                case .sdfEffect:
                    break
                case .shadow:
                    continue
                case .backdrop:
                    continue
                case .chameleonColor:
                    continue
                case .drawing:
                    continue
                case .compositing:
                    break
                case .geometry:
                    break
                case .projection:
                    break
                case .affine3D:
                    break
                case .mask:
                    break
                case .platformView:
                    continue
                case .platformGroup:
                    break
                case .platformLayer:
                    continue
                case .platformEffect:
                    break
                }
                
                removeChildren(platform: viewInfo.platform, container: viewInfo.container)
                
                guard kind == .mask else {
                    continue
                }
                
                // w20
                let system = viewInfo.platform.system
                // x26
                var maskView = CoreViewMaskView(system, view)
                // x25
                var subview = view
                
                while maskView != nil {
                    unsafe removeChildren(platform: viewInfo.platform, container: unsafeBitCast(maskView, to: AnyObject.self))
                    
                    guard (system == .caLayer) || (system == .uiView) else {
                        break
                    }
                    
                    let layer = CoreViewLayer(system, subview)
                    
                    if layer.isSeparated {
                        if layer.value(forKeyPath: "separatedOptions.platter.enabled") as? Bool == true {
                            break
                        }
                    }
                    
                    guard CoreViewSubviewsCount(system, subview) == 1 else {
                        break
                    }
                    
                    var outSystem = system
                    subview = unsafe unsafeBitCast(CoreViewSubviewAtIndex(system, subview, 0, &outSystem), to: AnyObject.self)
                    
                    guard isPlatter(system, subview) else {
                        break
                    }
                    
                    maskView = CoreViewMaskView(system, subview)
                }
            }
        }
        
        fileprivate func removeChildren(platform: DisplayList.ViewUpdater.Platform, container: AnyObject) {
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
        var animations: Set<String>
        var modifiers: [String: CAPresentationModifier]
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

fileprivate func isPlatter(_: MySwiftUIViewSystem, _: AnyObject) -> Bool {
    fatalError("TODO")
}

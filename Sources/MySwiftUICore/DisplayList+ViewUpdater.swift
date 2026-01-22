// B86250B2E056EB47628ECF46032DFA4C

private import _DarwinFoundation3._stdlib
private import CoreGraphics
internal import _MySwiftUIShims
private import AttributeGraph

@safe fileprivate nonisolated(unsafe) var printTree: Bool? = nil
@safe fileprivate nonisolated(unsafe) var disableMixedViewHierarchy: Bool? = nil

extension DisplayList {
    @safe nonisolated(unsafe) static var overrideMayInsertCALayers: Bool? = nil
    
    package final class ViewUpdater: ViewRendererBase {
        let rootPlatform: DisplayList.ViewUpdater.Platform
        private weak var host: ViewRendererHost? = nil
        private var viewCache: DisplayList.ViewUpdater.ViewCache
        private var seed = DisplayList.Seed()
        private var asyncSeed = DisplayList.Seed()
        private var nextUpdate = Time()
        private var lastEnv = DisplayList.ViewRenderer.Environment.invalid
        private var lastList = DisplayList()
        private var lastTime = Time()
        private var isValid = true
        private var wasValid = true
        
#if !os(visionOS)
        var effectiveRootPlatform: DisplayList.ViewUpdater.Platform {
            let _disableMixedViewHierarchy: Bool
            if let disableMixedViewHierarchy {
                _disableMixedViewHierarchy = disableMixedViewHierarchy
            } else {
                if let value = getenv("SWIFTUI_DISABLE_MIXED_VIEW_HIERARCHY") {
                    _disableMixedViewHierarchy = (atoi(value) != 0)
                } else {
                    _disableMixedViewHierarchy = false
                }
                disableMixedViewHierarchy = _disableMixedViewHierarchy
            }
            
            guard !_disableMixedViewHierarchy else {
                return rootPlatform
            }
            
            let insertCALayers: Bool
            if let overrideMayInsertCALayers = DisplayList.overrideMayInsertCALayers {
                insertCALayers = overrideMayInsertCALayers
            } else {
                insertCALayers = isLinkedOnOrAfter(.v7)
            }
            
            if insertCALayers {
                var platform = rootPlatform
                platform.encoding = platform.encoding.asMixedViewHierarchy()
                return platform
            } else {
                return rootPlatform
            }
        }
#endif
        
        init(rootPlatform: DisplayList.ViewUpdater.Platform, host: (any ViewRendererHost)?) {
            self.rootPlatform = rootPlatform
            self.host = host
            self.viewCache = DisplayList.ViewUpdater.ViewCache()
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time {
            /*
             self = x19
             rootView = x22
             return pointer = x25
             displayList = x23 + w21 + w26
             time = d8
             version = x24
             maxVersion = x28
             */
            if lastEnv != environment {
                lastEnv = environment
                isValid = false
                viewCache.invalidateAll()
                seed = DisplayList.Seed()
            }
            
            /*
             true = <+208>
             false = <+220>
             */
            let flag: Bool
            if isValid {
                let seed = seed
                if version.value != 0 {
                    // <+172>
                    if seed == DisplayList.Seed(version) {
                        // <+208>
                        flag = true
                    } else {
                        // <+220>
                        flag = false
                    }
                } else {
                    // <+204>
                    if seed.value == 0 {
                        // <+208>
                        flag = true
                    } else {
                        // <+220>
                        flag = false
                    }
                }
            } else {
                // <+220>
                flag = false
            }
            
            if flag {
                // <+208>
                if nextUpdate >= time {
                    return nextUpdate
                }
            }
            
            // x27
#if !os(visionOS)
            let rootPlatform = effectiveRootPlatform
#else
            let rootPlatform = rootPlatform
#endif
            
            // <+220>
            if lastTime == .zero {
                let viewLayer = rootPlatform.viewLayer(rootView)
                viewLayer.allowsGroupOpacity = false
                viewLayer.allowsGroupBlending = false
            }
            
            // <+304>
            if version.value != 0 {
                self.seed = DisplayList.Seed(version)
                self.asyncSeed = DisplayList.Seed(version)
            } else {
                self.seed = DisplayList.Seed()
                self.asyncSeed = DisplayList.Seed()
            }
            
            self.wasValid = self.isValid
            self.isValid = true
            self.lastList = displayList
            self.lastTime = time
            
            let _printTree: Bool
            if let printTree = printTree {
                _printTree = printTree
            } else {
                if let value = unsafe getenv("SWIFTUI_PRINT_TREE") {
                    _printTree = unsafe (atoi(value) != 0)
                } else {
                    _printTree = false
                }
                printTree = _printTree
            }
            
            if _printTree {
                print("View at \(time)\n:\(displayList)")
            }
            
            // <+836>
            // sp, #0x68
            _ = self.lastEnv
            /*
             self = sp + 0x50
             time = sp + 0x58
             maxVersion = sp + 0x60
             */
            
            let globals = DisplayList.ViewUpdater.Model.State.Globals(
                updater: self,
                time: time,
                maxVersion: maxVersion,
                environment: environment
            )
            
            return unsafe withUnsafePointer(to: globals) { globals in
                var state = unsafe DisplayList.ViewUpdater.Model.State(globals: globals)
                
                self.viewCache.index = DisplayList.Index()
                self.viewCache.currentList = displayList
                // sp + 0x20 = viewCache.index의 주소
                
                self.viewCache.clearAsyncValues()
                
                let viewLayer = rootPlatform.viewLayer(rootView)
                // x26
                let oldNeedsDisplayOnBoundsChange = viewLayer.needsDisplayOnBoundsChange
                viewLayer.needsDisplayOnBoundsChange = false
                
                // sp + 0x28
                var container = DisplayList.ViewUpdater.Container(
                    system: rootPlatform.system,
                    rootView: rootView,
                    id: DisplayList.ViewUpdater.ViewInfo.ID(value: 0),
                    time: .infinity,
                    index: 0
                )
                
                for item in displayList.items {
                    // w22, w26, d9
                    // inlined
                    let oldIndex: DisplayList.Index = self.viewCache.index.enter(identity: item.identity)
                    
                    var item = item
                    let time = unsafe viewCache.prepare(item: &item, platform: rootPlatform, parentState: &state)
                    container.time = min(time, container.time)
                    
                    unsafe self.updateInheritedView(container: &container, from: item, parentState: &state)
                    
                    // inlined
                    self.viewCache.index.leave(index: oldIndex)
                }
                
                // <+1828>
                container.removeRemaining(viewCache: &viewCache)
                // time = sp + 0x300
                viewCache.reclaim(time: time)
                
                // <+1992>
                viewCache.currentList = DisplayList()
                
                // sp, #0x88
                let result2 = container.time
                
                if !isValid {
                    // <+2040>
                    container.time = time
                }
                
                if let host {
                    // <+2192>
                    if let observer = host.as(ViewGraphRenderObserver.self), result2 != .zero {
                        observer.didRender()
                    }
                }
                
                // <+2220>
                viewLayer.needsDisplayOnBoundsChange = oldNeedsDisplayOnBoundsChange
                
                self.nextUpdate = container.time
                return container.time
            }
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
        
        // $s7SwiftUI11DisplayListV11ViewUpdaterC015updateInheritedE033_B86250B2E056EB47628ECF46032DFA4CLL9container4from11parentStateyAE9ContainerAGLLVz_AC4ItemVSPyAE5ModelO0R0VGtF
        fileprivate func updateInheritedView(
            container: inout DisplayList.ViewUpdater.Container,
            from item: DisplayList.Item,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            // x29 = sp + 0x7f0
            // x21 = sp + 0x580
            // x27 = sp + 0x270
            // x28 = sp + 0x160
            /*
             self = x19
             container = x22
             parentState = x23
             */
            // sp + 0x5d0
            _ = item
            // sp + 0x580
            var copy_2 = item
            // sp + 0x628
            _ = unsafe parentState.pointee
            // sp + 0x430
            var copy_4 = unsafe parentState.pointee
            
            // <+164>
            // self = sp
            // sp + 0x270
            let index = viewCache.index
            
            // <+208>
            // w24
            let requirements = unsafe DisplayList.ViewUpdater.Model.merge(item: &copy_2, index: index, into: &copy_4)
            
            // <+248>
            if !requirements.contains(.unknown4) {
                // <+256>
                // sp + 0x2c0
                let copy_3 = copy_2
                // sp + 0x270 / w8
                let features = copy_3.features
                
                if !features.contains(.required) {
                    //<+300>
                    if case .states(_) = copy_2.value {
                        // <+320>
                        fatalError("TODO")
                    }  else {
                        // <+1724>
                        fatalError("TODO")
                    }
                } else {
                    // <+496>
                }
            }
            
            // <+496>
            if !requirements.contains(.unknown2) {
                // <+500>
                if !requirements.contains(.unknown1) {
                    // <+508>
                    fatalError("TODO")
                } else {
                    // <+1608>
                    // sp + 0x270
                    let copy_5 = copy_2
                    // sp + 0x2c0
                    _ = copy_5
                    // sp + 0x220
                    let copy_7 = copy_2
                    unsafe updateItemView(container: &container, from: copy_7, localState: &copy_4)
                    return
                }
            } else {   
                // <+588>
                fatalError("TODO")
            }
        }
        
        fileprivate func updateItemView(
            container: inout DisplayList.ViewUpdater.Container,
            from item: DisplayList.Item,
            localState: inout DisplayList.ViewUpdater.Model.State
        ) {
            /*
             x29 = sp + 0x3d0
             x27 = sp + 0x280
             */
            /*
             self = x19
             container = x21
             localState = x25
             */
            // sp + 0x310
            _ = item
            // sp + 0x280
            let copy_2 = item
            // sp + 0x1b0
            let rootPlatform = rootPlatform
            
            // self.viewCache = x20
            // localState (pointer) = sp + 0x40
            
            // sp + 0x2d0
            let result = unsafe viewCache.update(item: copy_2, platform: rootPlatform, state: &localState, tag: .item, in: container.id)
            
            // <+188>
            self.isValid = (self.isValid && result.isValid)
            
            // x20
            let index = container.index
            CoreViewAddSubview(rootPlatform.system, container.rootView, result.platform.system, result.view, index)
            // <+248>
            container.index = index &+ 1
            container.time = min(container.time, result.nextUpdate)
            
            guard (result.key.id.identity.value & 0xc0000000) == 0x40000000 else {
                return
            }
            
            // <+292>
            fatalError("TODO")
        }
    }
}

extension DisplayList.ViewUpdater.ViewInfo {
    struct ID: Equatable {
        private(set) var value: Int
        
        fileprivate init(value: Int) {
            self.value = value
        }
    }
    
    struct Seeds {
        var item: DisplayList.Seed
        var content: DisplayList.Seed
        var opacity: DisplayList.Seed
        var blend: DisplayList.Seed
        var transform: DisplayList.Seed
        var clips: DisplayList.Seed
        var filters: DisplayList.Seed
        var shadow: DisplayList.Seed
        var properties: DisplayList.Seed
        var platformSeeds: DisplayList.ViewUpdater.PlatformViewInfo.Seeds
        
        // 원래 없음
        @inline(__always)
        init(item: DisplayList.Seed, content: DisplayList.Seed, opacity: DisplayList.Seed, blend: DisplayList.Seed, transform: DisplayList.Seed, clips: DisplayList.Seed, filters: DisplayList.Seed, shadow: DisplayList.Seed, properties: DisplayList.Seed, platformSeeds: DisplayList.ViewUpdater.PlatformViewInfo.Seeds) {
            self.item = item
            self.content = content
            self.opacity = opacity
            self.blend = blend
            self.transform = transform
            self.clips = clips
            self.filters = filters
            self.shadow = shadow
            self.properties = properties
            self.platformSeeds = platformSeeds
        }
        
        mutating func invalidate() {
            fatalError("TODO")
        }
    }
}

extension DisplayList.ViewUpdater {
    struct ViewInfo {
        private(set) var platform: DisplayList.ViewUpdater.Platform
        private(set) var view: AnyObject
        private(set) var layer: CALayer
        private(set) var container: AnyObject
        var state: DisplayList.ViewUpdater.Platform.State
        private(set) var id: DisplayList.ViewUpdater.ViewInfo.ID
        var parentID: DisplayList.ViewUpdater.ViewInfo.ID
        var seeds: DisplayList.ViewUpdater.ViewInfo.Seeds
        var cacheSeed: UInt32
        var isRemoved: Bool
        var isInvalid: Bool
        var nextUpdate: Time
        
        init(platform: DisplayList.ViewUpdater.Platform, view: AnyObject, kind: PlatformViewDefinition.ViewKind) {
            /*
             platform = x22
             view = x19
             kind = w23
             return = x20
             */
            // x21
            let layer = platform.viewLayer(view)
            let uniqueID = DisplayList.ViewUpdater.ViewInfo.ID(value: AGMakeUniqueID())
            
            self.platform = platform
            self.view = view
            self.layer = layer
            self.container = view
            self.state = DisplayList.ViewUpdater.Platform.State.init(
                position: .infinity,
                size: CGSize(width: CGFloat.infinity, height: CGFloat.infinity),
                kind: kind,
                flags: [],
                platformState: DisplayList.ViewUpdater.Platform.PlatformState()
            )
            self.id = uniqueID
            self.parentID = DisplayList.ViewUpdater.ViewInfo.ID(value: -1)
            
            let seed: DisplayList.Seed
            switch kind {
            case .platformGroup:
                seed = .undefined
            case .platformLayer:
                seed = .undefined
            case .platformEffect:
                seed = .undefined
            default:
                seed = DisplayList.Seed()
            }
            
            self.seeds = DisplayList.ViewUpdater.ViewInfo.Seeds(
                item: seed,
                content: seed,
                opacity: seed,
                blend: seed,
                transform: seed,
                clips: seed,
                filters: seed,
                shadow: seed,
                properties: seed,
                platformSeeds: DisplayList.ViewUpdater.PlatformViewInfo.Seeds(
                    zPosition: seed,
                    separatedState: seed,
                    separatedOptions: seed,
                    remoteEffects: seed,
                    renderingTechnique: seed,
                    projectiveShadow: seed,
                    hitTestsAsOpaque: seed,
                    serverResponderID: seed
                )
            )
            
            self.cacheSeed = 0
            self.isRemoved = false
            self.isInvalid = false
            self.nextUpdate = .infinity
        }
    }
    
    @safe struct PlatformViewInfo {
        let view: AnyObject
        let kind: PlatformViewDefinition.ViewKind
        private(set) var state: UnsafeMutablePointer<DisplayList.ViewUpdater.Platform.State>
        private(set) var seeds: UnsafeMutablePointer<DisplayList.ViewUpdater.PlatformViewInfo.Seeds>
        
        // 원래 없음
        @inline(__always)
        init(view: AnyObject, kind: PlatformViewDefinition.ViewKind, state: UnsafeMutablePointer<DisplayList.ViewUpdater.Platform.State>, seeds: UnsafeMutablePointer<DisplayList.ViewUpdater.PlatformViewInfo.Seeds>) {
            self.view = view
            self.kind = kind
            unsafe self.state = unsafe state
            unsafe self.seeds = unsafe seeds
        }
    }
    
    fileprivate struct Container {
        let system: ViewSystem
        let rootView: AnyObject
        let id: DisplayList.ViewUpdater.ViewInfo.ID
        var time: Time
        var index: Int
        
        func removeRemaining(viewCache: inout DisplayList.ViewUpdater.ViewCache) {
            // viewCache = x26
            // x22
            let system = system
            
            let count = CoreViewSubviewsCount(system, rootView)
            guard index < count else {
                return
            }
            
            // x27
            let reverseMap = unsafe viewCache.reverseMap
            // x24 = sp, #0x1d0
            // x23
            for _index in (index..<Int(count)).reversed() {
                // sp, #0x68
                var outSystem = system
                let subview = unsafe unsafeBitCast(CoreViewSubviewAtIndex(system, rootView, Int(_index), &outSystem), to: AnyObject.self)
                
                guard system == outSystem else {
                    continue
                }
                
                guard let key = unsafe reverseMap[OpaquePointer(Unmanaged.passUnretained(subview).toOpaque())] else {
                    continue
                }
                
                // x9
                var viewInfo = viewCache.map[key]!
                
                if !viewInfo.isRemoved {
                    viewInfo.isRemoved = true
                    viewCache.map[key] = viewInfo
                }
                
                CoreViewRemoveFromSuperview(system, subview)
            }
        }
    }
}

extension DisplayList.ViewUpdater {
    @safe struct AsyncLayer {
        private var layer: CALayer
        private let cache: UnsafeMutablePointer<DisplayList.ViewUpdater.ViewCache>
        private let kind: PlatformViewDefinition.ViewKind
        private let flags: DisplayList.ViewUpdater.Platform.ViewFlags
        private var nextUpdate: Time
        private var isInvalid: Bool
    }
}

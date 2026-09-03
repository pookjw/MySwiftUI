// B86250B2E056EB47628ECF46032DFA4C

private import _DarwinFoundation3._stdlib
private import CoreGraphics
internal import _MySwiftUIShims
private import AttributeGraph

@safe nonisolated(unsafe) fileprivate var printTree: Bool? = nil
@safe nonisolated(unsafe) fileprivate var disableMixedViewHierarchy: Bool? = nil

extension DisplayList {
    @safe nonisolated(unsafe) static var overrideMayInsertCALayers: Bool? = nil
    
    package final class ViewUpdater : ViewRendererBase {
        let rootPlatform: DisplayList.ViewUpdater.Platform // 0x10
        private weak var host: ViewRendererHost? = nil // 0x18
        private var viewCache: DisplayList.ViewUpdater.ViewCache // 0x28
        private var seed = DisplayList.Seed() // 0x90
        private var asyncSeed = DisplayList.Seed() // 0x92
        private var nextUpdate = Time() // 0x98
        private var lastEnv = DisplayList.ViewRenderer.Environment.invalid // 0xa0
        private var lastList = DisplayList() // 0xa8
        private var lastTime = Time() // 0xb8
        private var isValid = true // 0xc0
        private var wasValid = true // 0xc1
        
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
            assertUnimplemented()
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
                print("View at \(time):\n\(displayList.description)")
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
            
            return withUnsafePointer(to: globals) { globals in
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
        
        func renderAsync(
            to displayList: DisplayList,
            time: Time,
            targetTimestamp: Time?,
            version: DisplayList.Version,
            maxVersion: DisplayList.Version
        ) -> Time? {
            /*
             self -> x20 -> x27
             return pointer -> x8 -> sp + 0xc0
             displayList -> x0 -> x24/w25/w26
             time -> x1 -> d12
             targetTimestamp -> x2 -> x11/w12
             version -> x3
             maxVersion -> x4 -> x23
             */
            let d12 = time
            if self.isValid {
                // <+132>
                if DisplayList.Seed(version) == self.asyncSeed {
                    // <+180>
                    let d0 = self.nextUpdate
                    if !(d0 < time) {
                        // <+21828>
                        return d0
                    }
                } else {
                    // <+192>
                }
            } else {
                // <+192>
            }
            
            // <+192>
            // targetTimestamp -> x11 -> sp + 0x88 / sp + 0x84
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
                print("Async view at \(time):\n\(displayList.description)")
            }
            
            // <+668>
            // displayList -> x24/w25/w26 -> sp + 0xf0 / sp + 0x90 / sp + 0x94
            // sp + 0xf8
#if !os(visionOS)
            let rootPlatform = self.effectiveRootPlatform
#else
            let rootPlatform = self.rootPlatform
#endif
            // sp + 0xa4
            let tag = DisplayList.ViewUpdater.ViewCache.Tag.inherited
            let system = rootPlatform.system
            
            // sp + 0x130
            let globals_1 = DisplayList.ViewUpdater.Model.State.Globals(
                updater: self,
                time: time,
                maxVersion: maxVersion,
                environment: self.lastEnv
            )
            
            // sp + 0x150
            let globals_2 = DisplayList.ViewUpdater.Model.State.Globals(
                updater: self,
                time: self.lastTime,
                maxVersion: maxVersion,
                environment: self.lastEnv
            )
            
            return withUnsafePointer(to: globals_1) { pointer_1 -> Time? in
                return withUnsafePointer(to: globals_2) { pointer_2 -> Time? in
                    // sp + 0x1ca0
                    var state_1 = unsafe DisplayList.ViewUpdater.Model.State(globals: pointer_1)
                    // sp + 0x1df0
                    var state_2 = unsafe DisplayList.ViewUpdater.Model.State(globals: pointer_2)
                    
                    // <+1164>
                    self.viewCache.index = DisplayList.Index()
                    self.wasValid = self.isValid
                    self.isValid = true
                    
                    // self -> x27 -> x22
                    // self.lastList.items -> x25
                    let lastListItems = self.lastList.items
                    // x24
                    let lastListItemsCount = lastListItems.count
                    // x26
                    let incomingListItems = displayList.items
                    
                    guard lastListItemsCount == displayList.items.count else {
                        // <+1392>
                        self.viewCache.invalidateAsyncValues()
                        self.isValid = self.wasValid
                        return nil
                    }
                    
                    // <+1244>
                    // self.viewCache -> sp + 0x108
                    // lastListItems -> x25 -> sp + 0xd0
                    guard lastListItemsCount != 0 else {
                        // <+1464>
                        self.viewCache.commitAsyncValues(targetTimestamp: targetTimestamp)
                        self.lastList = displayList
                        self.lastTime = time
                        self.asyncSeed = self.seed
                        self.nextUpdate = .infinity
                        return .infinity
                    }
                    
                    // <+1292>
                    /*
                     incomingListItems buffer -> sp + 0xb0
                     lastListItems buffer -> sp + 0xb8
                     */
                    var d10 = Time.infinity
                    
                    for index in 0..<lastListItemsCount {
                        // <+1860>
                        // sp + 0x1be0
                        let copy_1 = lastListItems[index]
                        // sp + 0x1b90
                        var copy_2 = lastListItems[index]
                        // sp + 0x1c30
                        let copy_3 = incomingListItems[index]
                        // sp + 0x1b40
                        var copy_4 = incomingListItems[index]
                        
                        guard copy_1.identity == copy_3.identity else {
                            // <+21844>
                            self.viewCache.invalidateAsyncValues()
                            self.isValid = self.wasValid
                            return nil
                        }
                        
                        // <+2084>
                        guard copy_4.matchesTopLevelStructure(of: copy_2) else {
                            // <+21896>
                            self.viewCache.invalidateAsyncValues()
                            self.isValid = self.wasValid
                            return nil
                        }
                        
                        // <+2148>
                        // inlined
                        // sp + 0xe4
                        let oldIndex_1 = self.viewCache.index.enter(identity: copy_4.identity)
                        
                        // sp + 0x1660
                        let copy_5 = rootPlatform
                        
                        // <+2240>
                        var d0 = unsafe self.viewCache.prepare(item: &copy_2, platform: copy_5, parentState: &state_2)
                        
                        // <+2316>
                        var d8 = (d0 < d10) ? d0 : d10
                        self.viewCache.index = oldIndex_1
                        
                        // <+2332>
                        // sp + 0x18a0
                        let copy_6 = rootPlatform
                        d0 = unsafe self.viewCache.prepare(item: &copy_4, platform: copy_6, parentState: &state_1)
                        let d13 = (d0 < d8) ? d0 : d8
                        
                        // <+2392>
                        // sp + 0x1800
                        let _ = copy_2
                        // sp + 0x17b0
                        var copy_8 = copy_2
                        // sp + 0x1850
                        let copy_9 = copy_4
                        // <+2528>
                        // sp + 0x18a0
                        let _ = unsafe state_2
                        // sp + 0x1660
                        var copy_11 = unsafe state_2
                        // sp + 0x1370
                        let copy_12 = self.viewCache.index
                        
                        // w19, w20
                        let requirements_1 = unsafe DisplayList.ViewUpdater.Model.merge(
                            item: &copy_8,
                            index: copy_12,
                            into: &copy_11
                        )
                        
                        // sp + 0x14c0
                        var copy_13 = copy_9
                        // sp + 0x19f0
                        let _ = unsafe state_1
                        // sp + 0x1510
                        var copy_15 = unsafe state_1
                        // sp + 0x1040
                        let copy_16 = self.viewCache.index
                        
                        let requirements_2 = unsafe DisplayList.ViewUpdater.Model.merge(
                            item: &copy_13,
                            index: copy_16,
                            into: &copy_15
                        )
                        
                        guard requirements_1 == requirements_2 else {
                            // <+21948>
                            self.viewCache.index.leave(index: oldIndex_1)
                            self.viewCache.invalidateAsyncValues()
                            self.isValid = self.wasValid
                            return nil
                        }
                        
                        // <+2860>
                        if requirements_1.contains(.unknown1) {
                            // <+2988>
                            // inlined
                            guard let result = unsafe self.viewCache.updateAsync(
                                oldItem: copy_8,
                                oldState: &state_2,
                                newItem: copy_13,
                                newState: &state_1,
                                tag: tag,
                                platform: rootPlatform
                            ) else {
                                self.viewCache.index.leave(index: oldIndex_1)
                                self.viewCache.invalidateAsyncValues()
                                self.isValid = self.wasValid
                                return nil
                            }
                            
                            var d9 = result.nextUpdate
                            // <+3796>
                            self.isValid = self.isValid && result.isValid
                            // <+3812>
                            if copy_8.version != copy_13.version {
                                // <+4020>
                                let flag_1: Bool // true -> <+1764> / false -> <+18260>
                                let flag_2: Bool // true -> <+4488> / false -> <+4112>
                                
                                if requirements_1.contains(.unknown2) {
                                    // <+4488>
                                    flag_2 = true
                                } else {
                                    // <+4024>
                                    // sp + 0xdf0
                                    let copy_17 = copy_13
                                    // sp + 0xca0
                                    let features_1 = copy_17.features
                                    
                                    if features_1.contains(.required) {
                                        // <+4488>
                                        flag_2 = true
                                    } else {
                                        // <+4112>
                                        flag_2 = false
                                    }
                                }
                                
                                if flag_2 {
                                    // <+4488>
                                    if requirements_1.contains(.unknown0) {
                                        // <+5544>
                                        // sp + 0x1f40
                                        let copy_17 = copy_8
                                        // sp + 0x1f90
                                        let copy_18 = copy_13
                                        
                                        // <+5692>
                                        guard let result = unsafe self.updateAsync(
                                            oldItem: copy_17,
                                            oldState: &copy_11,
                                            newItem: copy_18,
                                            newState: &copy_15,
                                            tag: .item,
                                            platform: rootPlatform
                                        ) else {
                                            self.viewCache.index.leave(index: oldIndex_1)
                                            self.viewCache.invalidateAsyncValues()
                                            self.isValid = self.wasValid
                                            return nil
                                        }
                                        
                                        // <+6208>
                                        d9 = result.nextUpdate
                                        self.isValid = self.isValid && result.isValid
                                        // sp + 0x1280
                                        let copy_19 = copy_17.value
                                        // sp + 0x12a0
                                        let copy_20 = copy_18.value
                                        
                                        if
                                            case .effect(let effect_1, let list_1) = copy_19,
                                            case .effect(let effect_2, let list_2) = copy_20
                                        {
                                            // <+6316>
                                            if (copy_17.version != copy_18.version) || !self.wasValid {
                                                // <+8368>
                                                // inlined
                                                unsafe copy_11.reset()
                                                // inlined
                                                unsafe copy_15.reset()
                                                
                                                // <+8444>
                                                // sp + 0x820
                                                let copy_22 = rootPlatform
                                                // sp + 0xb00
                                                let copy_23 = list_1
                                                // sp + 0x960
                                                let copy_24 = list_2
                                                
                                                guard let _d10 = unsafe self.updateAsync(
                                                    platform: copy_22,
                                                    oldList: copy_23,
                                                    oldParentState: &copy_11,
                                                    newList: copy_24,
                                                    newParentState: &copy_15
                                                ) else {
                                                    // <+22872>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                d10 = _d10
                                                
                                                // <+8544>
                                                var d11: Time
                                                if
                                                    case .mask(let list_1, _) = effect_1,
                                                    case .mask(let list_2, _) = effect_2
                                                {
                                                    // <+8600>
                                                    // sp + 0x820
                                                    let copy_25 = rootPlatform
                                                    // sp + 0xb00
                                                    let copy_26 = list_1
                                                    // sp + 0x960
                                                    let copy_27 = list_2
                                                    
                                                    guard let _d11 = unsafe self.updateAsync(
                                                        platform: copy_25,
                                                        oldList: copy_26,
                                                        oldParentState: &copy_11,
                                                        newList: copy_27,
                                                        newParentState: &copy_15
                                                    ) else {
                                                        // <+22928>
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    d11 = _d11
                                                    
                                                    // <+8744>
                                                    if !(d11 < d10) {
                                                        // <+9828>
                                                        d11 = d10
                                                        // <+9832>
                                                    } else {
                                                        // <+9832>
                                                    }
                                                } else {
                                                    d11 = d10
                                                    // <+9832>
                                                }
                                                
                                                // <+9832>
                                                if !(d11 < d9) {
                                                    // <+18236>
                                                    // <+18260>
                                                } else {
                                                    // <+9868>
                                                    let key = DisplayList.ViewUpdater.ViewCache.Key(
                                                        id: result.indexID,
                                                        system: PlatformViewDefinition.System(base: rootPlatform.system),
                                                        tag: .item
                                                    )
                                                    
                                                    self.viewCache.map[key]!.nextUpdate = d11
                                                    d9 = d11
                                                    // <+18260>
                                                }
                                                
                                                // <+18260>
                                            } else {
                                                // <+6336>
                                                if case .mask(let list, _) = effect_1 {
                                                    // sp + 0x8c0
                                                    let copy_21 = list
                                                    self.viewCache.index.skip(list: copy_21)
                                                    // <+10560>
                                                } else {
                                                    // <+10500>
                                                    // <+10560>
                                                }
                                                
                                                // <+10560>
                                                self.viewCache.index.skip(list: list_1)
                                                // <+18260>
                                            }
                                        } else {
                                            // <+6628>
                                            // <+18260>
                                        }
                                        
                                        // <+18260>
                                        flag_1 = false
                                    } else {
                                        // <+4496>
                                        // sp + 0x820
                                        let copy_17 = copy_8.value
                                        // sp + 0x840
                                        let copy_18 = copy_13.value
                                        
                                        if
                                            case .effect(_, let list_1) = copy_17,
                                            case .effect(_, let list_2) = copy_18
                                        {
                                            // <+4644>
                                            guard list_1.items.count == list_2.items.count else {
                                                // <+22776>
                                                self.viewCache.index.leave(index: oldIndex_1)
                                                self.viewCache.invalidateAsyncValues()
                                                self.isValid = self.wasValid
                                                return nil
                                            }
                                            
                                            // <+4724>
                                            d9 = .infinity
                                            
                                            for index in list_1.items.indices {
                                                // sp + 0xca0
                                                let copy_19 = list_1.items[index]
                                                // sp + 0xb00
                                                var copy_20 = list_1.items[index]
                                                // sp + 0xdf0
                                                let copy_21 = list_2.items[index]
                                                // sp + 0x960
                                                var copy_22 = list_2.items[index]
                                                
                                                // <+4980>
                                                guard copy_21.identity == copy_19.identity else {
                                                    // <+22460>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                guard copy_22.matchesTopLevelStructure(of: copy_20) else {
                                                    // <+22476>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+5028>
                                                // sp + 0x58
                                                let oldIndex_2 = self.viewCache.index.enter(identity: copy_22.identity)
                                                // sp + 0x1190
                                                let copy_23 = rootPlatform
                                                
                                                // <+5116>
                                                let d11 = unsafe self.viewCache.prepare(
                                                    item: &copy_20,
                                                    platform: copy_23,
                                                    parentState: &copy_11
                                                )
                                                
                                                self.viewCache.index = oldIndex_2
                                                // sp + 0x1190
                                                let copy_24 = rootPlatform
                                                
                                                let d14 = unsafe self.viewCache.prepare(
                                                    item: &copy_22,
                                                    platform: copy_24,
                                                    parentState: &copy_15
                                                )
                                                
                                                // sp + 0x1280
                                                let copy_25 = rootPlatform
                                                
                                                guard let d10 = unsafe self.updateInheritedViewAsync(
                                                    platform: copy_25,
                                                    oldItem: copy_20,
                                                    oldParentState: &copy_11,
                                                    newItem: copy_22,
                                                    newParentState: &copy_15
                                                ) else {
                                                    // <+22552>
                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+5324>
                                                d0 = (d11 < d9) ? d11 : d9
                                                d0 = (d14 < d0) ? d14 : d0
                                                d9 = (d0 > d10) ? d10 : d0
                                                
                                                self.viewCache.index.leave(index: oldIndex_2)
                                            }
                                            
                                            // <+9396>
                                            // <+10640>
                                            // <+18260>
                                            flag_1 = false
                                        } else {
                                            // <+19052>
                                            // <+1764>
                                            flag_1 = true
                                        }
                                    }
                                } else {
                                    // <+4112>
                                    // sp + 0xdf0
                                    let copy_18 = copy_8
                                    // sp + 0xb00
                                    let features_2 = copy_18.features
                                    // sp + 0xca0
                                    let copy_19 = copy_13
                                    // sp + 0x960
                                    let features_3 = copy_19.features
                                    
                                    if features_2 != features_3 {
                                        // <+22748>
                                        self.viewCache.index.leave(index: oldIndex_1)
                                        self.viewCache.invalidateAsyncValues()
                                        self.isValid = self.wasValid
                                        return nil
                                    } else {
                                        // <+4276>
                                        if case .effect(let effect, let displayList) = copy_8.value {
                                            // <+4300>
                                            self.viewCache.index.skip(list: displayList)
                                            self.viewCache.index.skip(effect: effect)
                                            // <+6960>
                                            // <+1764>
                                        } else {
                                            // <+6960>
                                            // <+1764>
                                        }
                                    }
                                    
                                    // <+1764>
                                    flag_1 = true
                                }
                                
                                if flag_1 {
                                    // <+1764>
                                } else {
                                    // <+18260>
                                    if !(d9 < d8) {
                                        // <+19052>
                                        // <+1764>
                                    } else {
                                        // <+18292>
                                        let key = DisplayList.ViewUpdater.ViewCache.Key(
                                            id: result.indexID,
                                            system: PlatformViewDefinition.System(base: system),
                                            tag: tag
                                        )
                                        
                                        self.viewCache.map[key]!.nextUpdate = d9
                                        d8 = d9
                                        // <+1764>
                                    }
                                }
                                
                                // <+1764>
                            } else {
                                // <+3820>
                                if case .effect(_, let displayList) = copy_8.value {
                                    // <+3840>
                                    self.viewCache.index.skip(list: displayList)
                                    // <+5532>
                                    // <+1764>
                                } else {
                                    // <+5484>
                                    // <+1764>
                                }
                                
                                // <+1764>
                            }
                            
                            // <+1764>
                        } else if requirements_1.contains(.unknown2) {
                            // <+7080>
                            if requirements_1.contains(.unknown0) {
                                // <+7372>
                                // sp + 0x1fe0
                                let copy_17 = copy_8
                                // x29 - 0x100
                                let copy_18 = copy_13
                                
                                // inlined
                                guard let result = unsafe self.updateAsync(
                                    oldItem: copy_17,
                                    oldState: &copy_11,
                                    newItem: copy_18,
                                    newState: &copy_15,
                                    tag: .item,
                                    platform: rootPlatform
                                ) else {
                                    // <+8800>
                                    self.viewCache.index.leave(index: oldIndex_1)
                                    self.viewCache.invalidateAsyncValues()
                                    self.isValid = self.wasValid
                                    return nil
                                }
                                
                                // <+8032>
                                var d9 = result.nextUpdate
                                self.isValid = self.isValid && result.isValid
                                
                                // <+8048>
                                // sp + 0x1280
                                let copy_19 = copy_17.value
                                // sp + 0x12a0
                                let copy_20 = copy_18.value
                                
                                if
                                    case .effect(let effect_1, let list_1) = copy_19,
                                    case .effect(let effect_2, let list_2) = copy_20
                                {
                                    // <+8140>
                                    if (copy_17.version != copy_18.version) || !self.wasValid {
                                        // <+10652>
                                        // inlined
                                        unsafe copy_11.reset()
                                        // inlined
                                        unsafe copy_15.reset()
                                        
                                        // <+11084>
                                        if list_1.items.count != list_2.items.count {
                                            // <+20240>
                                            self.viewCache.index.leave(index: oldIndex_1)
                                            self.viewCache.invalidateAsyncValues()
                                            self.isValid = self.wasValid
                                            return nil
                                        } else {
                                            // <+11100>
                                            d10 = .infinity
                                            
                                            for index in list_1.items.indices {
                                                // <+11104>
                                                // sp + 0xca0
                                                let item_1 = list_1.items[index]
                                                // sp + 0xb00
                                                var item_2 = list_1.items[index]
                                                // sp + 0xdf0
                                                let item_3 = list_2.items[index]
                                                // sp + 0x960
                                                var item_4 = list_2.items[index]
                                                
                                                // <+11328>
                                                guard item_1.identity == item_3.identity else {
                                                    // <+20148>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+11336>
                                                guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                    // <+20224>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+11376>
                                                // sp + 0x58
                                                let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                                // sp + 0x1230
                                                let copy_21 = rootPlatform
                                                
                                                // <+11520>
                                                let d11 = unsafe self.viewCache.prepare(
                                                    item: &item_2,
                                                    platform: copy_21,
                                                    parentState: &copy_11
                                                )
                                                
                                                self.viewCache.index = oldIndex_2
                                                // sp + 0x1230
                                                let copy_22 = rootPlatform
                                                
                                                // <+11568>
                                                let d14 = unsafe self.viewCache.prepare(
                                                    item: &item_4,
                                                    platform: copy_22,
                                                    parentState: &copy_15
                                                )
                                                
                                                // sp + 0x820
                                                let copy_23 = rootPlatform
                                                
                                                // <+11624>
                                                guard let _d8 = unsafe self.updateInheritedViewAsync(
                                                    platform: copy_23,
                                                    oldItem: item_2,
                                                    oldParentState: &copy_11,
                                                    newItem: item_4,
                                                    newParentState: &copy_15
                                                ) else {
                                                    // <+20308>
                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                d8 = _d8
                                                // <+11660>
                                                d0 = (d11 < d10) ? d11 : d10
                                                d0 = (d14 < d0) ? d14 : d0
                                                d10 = (d0 > d8) ? d8 : d0
                                                
                                                self.viewCache.index.leave(index: oldIndex_2)
                                            }
                                            
                                            // <+19120>
                                            if
                                                case .mask(let list_3, _) = effect_1,
                                                case .mask(let list_4, _) = effect_2
                                            {
                                                // <+19180>
                                                if list_3.items.count != list_4.items.count {
                                                    // <+20548>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                } else {
                                                    // <+19244>
                                                    var d11 = Time.infinity
                                                    
                                                    for index in list_3.items.indices {
                                                        // sp + 0xca0
                                                        let item_1 = list_3.items[index]
                                                        // sp + 0xb00
                                                        var item_2 = list_3.items[index]
                                                        // sp + 0xdf0
                                                        let item_3 = list_4.items[index]
                                                        // sp + 0x960
                                                        var item_4 = list_4.items[index]
                                                        
                                                        // <+19484>
                                                        guard item_1.identity == item_3.identity else {
                                                            // <+21556>
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        // <+19492>
                                                        guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                            // <+21632>
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        // <+19532>
                                                        // sp + 0x58
                                                        let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                                        
                                                        // <+19628>
                                                        // sp + 0x1230
                                                        let copy_21 = rootPlatform
                                                        
                                                        let d14 = unsafe self.viewCache.prepare(
                                                            item: &item_2,
                                                            platform: copy_21,
                                                            parentState: &copy_11
                                                        )
                                                        
                                                        self.viewCache.index = oldIndex_2
                                                        // sp + 0x1230
                                                        let copy_22 = rootPlatform
                                                        
                                                        let d15 = unsafe self.viewCache.prepare(
                                                            item: &item_4,
                                                            platform: copy_22,
                                                            parentState: &copy_15
                                                        )
                                                        // sp + 0x820
                                                        let copy_23 = rootPlatform
                                                        
                                                        guard let _d8 = unsafe self.updateInheritedViewAsync(
                                                            platform: copy_23,
                                                            oldItem: item_2,
                                                            oldParentState: &copy_11,
                                                            newItem: item_4,
                                                            newParentState: &copy_15
                                                        ) else {
                                                            // <+21724>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        d8 = _d8
                                                        // <+19812>
                                                        d0  = (d14 < d11) ? d14 : d11
                                                        d11 = (d15 < d0) ? d15 : d0
                                                        d11 = (d11 > d8) ? d8 : d11
                                                        
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                    }
                                                    
                                                    // <+20632>
                                                    d10 = (d11 < d10) ? d11 : d10
                                                    // <+20696>
                                                }
                                            } else {
                                                // <+20696>
                                            }
                                            
                                            // <+20696>
                                            if !(d10 < d9) {
                                                // <+21532>
                                                // <+10464>
                                            } else {
                                                // <+20724>
                                                let key = DisplayList.ViewUpdater.ViewCache.Key(
                                                    id: result.indexID,
                                                    system: PlatformViewDefinition.System(base: rootPlatform.system),
                                                    tag: .item
                                                )
                                                
                                                self.viewCache.map[key]!.nextUpdate = d10
                                                d9 = d10
                                                // <+10464>
                                            }
                                            
                                            // <+10464>
                                            d8 = d9
                                            // <+1764>
                                        }
                                        
                                        // <+1764>
                                    } else {
                                        // <+8164>
                                        if case .mask(let list_3, _) = effect_1 {
                                            // <+8180>
                                            self.viewCache.index.skip(list: list_3)
                                            // <+19980>
                                        } else {
                                            // <+19924>
                                            // <+19980>
                                        }
                                        
                                        // <+19980>
                                        self.viewCache.index.skip(list: list_1)
                                        d8 = d9
                                        // <+1764>
                                    }
                                    
                                    // <+1764>
                                } else {
                                    // <+10460>
                                    d8 = d9
                                    // <+1764>
                                }
                                
                                // <+1764>
                            } else {
                                // <+7084>
                                // sp + 0x1300
                                let copy_17 = copy_8.value
                                // sp + 0x1320
                                let copy_18 = copy_13.value
                                
                                if
                                    case .effect(_, let list_1) = copy_17,
                                    case .effect(_, let list_2) = copy_18
                                {
                                    // <+7240>
                                    if list_1.items.count != list_2.items.count {
                                        // <+8316>
                                        self.viewCache.index.leave(index: oldIndex_1)
                                        self.viewCache.invalidateAsyncValues()
                                        self.isValid = self.wasValid
                                        return nil
                                    } else {
                                        // <+7308>
                                        d8 = .infinity
                                        
                                        for index in list_1.items.indices {
                                            // <+12168>
                                            // sp + 0x1230
                                            let item_1 = list_1.items[index]
                                            // sp + 0x11e0
                                            var item_2 = list_1.items[index]
                                            // sp + 0x1280
                                            let item_3 = list_2.items[index]
                                            // sp + 0x1190
                                            var item_4 = list_2.items[index]
                                            
                                            // <+12392>
                                            guard item_1.identity == item_3.identity else {
                                                // <+16592>
                                                self.viewCache.index.leave(index: oldIndex_1)
                                                self.viewCache.invalidateAsyncValues()
                                                self.isValid = self.wasValid
                                                return nil
                                            }
                                            
                                            // <+12416>
                                            guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                // <+16672>
                                                self.viewCache.index.leave(index: oldIndex_1)
                                                self.viewCache.invalidateAsyncValues()
                                                self.isValid = self.wasValid
                                                return nil
                                            }
                                            
                                            // <+12468>
                                            // sp + 0x58
                                            let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                            // <+12556>
                                            // sp + 0xdf0
                                            let copy_19 = rootPlatform
                                            
                                            d0 = unsafe self.viewCache.prepare(
                                                item: &item_2,
                                                platform: copy_19,
                                                parentState: &copy_11
                                            )
                                            
                                            d8 = (d0 < d8) ? d0 : d8
                                            self.viewCache.index = oldIndex_2
                                            // sp + 0x1040
                                            let copy_20 = rootPlatform
                                            
                                            d0 = unsafe self.viewCache.prepare(
                                                item: &item_4,
                                                platform: copy_20,
                                                parentState: &copy_15
                                            )
                                            
                                            let d9 = (d0 < d8) ? d0 : d8
                                            // <+12712>
                                            // sp + 0xfa0
                                            let _ = item_2
                                            // sp + 0xf40
                                            var copy_22 = item_2
                                            // sp + 0xff0
                                            let copy_23 = item_4
                                            // sp + 0x1040
                                            let _ = unsafe copy_11
                                            // sp + 0xdf0
                                            var copy_25 = unsafe copy_11
                                            
                                            // <+12844>
                                            // sp + 0xb00
                                            let copy_26 = self.viewCache.index
                                            // x23/w19
                                            let requirements_2 = unsafe DisplayList.ViewUpdater.Model.merge(
                                                item: &copy_22,
                                                index: copy_26,
                                                into: &copy_25
                                            )
                                            
                                            // sp + 0xc50
                                            var copy_27 = copy_23
                                            // sp + 0x1370
                                            let _ = unsafe copy_15
                                            // sp + 0xca0
                                            var copy_29 = unsafe copy_15
                                            // sp + 0x960
                                            let copy_30 = self.viewCache.index
                                            let requirements_3 = unsafe DisplayList.ViewUpdater.Model.merge(
                                                item: &copy_27,
                                                index: copy_30,
                                                into: &copy_29
                                            )
                                            
                                            guard requirements_2 == requirements_3 else {
                                                // <+16464>
                                                self.viewCache.index.leave(index: oldIndex_2)
                                                self.viewCache.index.leave(index: oldIndex_1)
                                                self.viewCache.invalidateAsyncValues()
                                                self.isValid = self.wasValid
                                                return nil
                                            }
                                            
                                            // <+13112>
                                            if requirements_2.contains(.unknown1) {
                                                // <+13580>
                                                // sp + 0x960
                                                let copy_31 = rootPlatform
                                                // sp + 0xa48
                                                guard let result = unsafe self.viewCache.updateAsync(
                                                    oldItem: copy_22,
                                                    oldState: &copy_11,
                                                    newItem: copy_27,
                                                    newState: &copy_15,
                                                    tag: .inherited,
                                                    platform: copy_31
                                                ) else {
                                                    // <+16464>
                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                d8 = result.nextUpdate
                                                self.isValid = self.isValid && result.isValid
                                                
                                                // <+13712>
                                                if result.changed {
                                                    // <+14340>
                                                    if requirements_2.contains(.unknown2) {
                                                        // <+14928>
                                                        if requirements_2.contains(.unknown0) {
                                                            // <+15380>
                                                            // sp + 0xb00
                                                            let copy_33 = rootPlatform
                                                            
                                                            guard let _d10 = unsafe self.updateItemViewAsync(
                                                                platform: copy_33,
                                                                oldItem: copy_22,
                                                                oldState: &copy_25,
                                                                newItem: copy_27,
                                                                newState: &copy_29
                                                            ) else {
                                                                // <+20508>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            d10 = _d10
                                                            // <+15904>
                                                        } else {
                                                            // <+14932>
                                                            // sp + 0xb00
                                                            let copy_33 = copy_22.value
                                                            // sp + 0xb20
                                                            let copy_34 = copy_27.value
                                                            
                                                            if
                                                                case .effect(_, let list_3) = copy_33,
                                                                case .effect(_, let list_4) = copy_34
                                                            {
                                                                // <+15084>
                                                                // sp + 0xa00
                                                                let copy_35 = rootPlatform
                                                                
                                                                guard let _d10 = unsafe self.updateAsync(
                                                                    platform: copy_35,
                                                                    oldList: list_3,
                                                                    oldParentState: &copy_25,
                                                                    newList: list_4,
                                                                    newParentState: &copy_29
                                                                ) else {
                                                                    // <+20508>
                                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                                    self.viewCache.invalidateAsyncValues()
                                                                    self.isValid = self.wasValid
                                                                    return nil
                                                                }
                                                                
                                                                d10 = _d10
                                                                
                                                                // <+15904>
                                                            } else {
                                                                // <+15516>
                                                                d10 = .infinity
                                                                // <+15904>
                                                            }
                                                            
                                                            // <+15904>
                                                        }
                                                        
                                                        // <+15904>
                                                    } else {
                                                        // <+14348>
                                                        // sp + 0xb00
                                                        let copy_32 = copy_27
                                                        // sp + 0x960
                                                        let features_1 = copy_32.features
                                                        
                                                        if features_1.contains(.required) {
                                                            // <+14928>
                                                            if requirements_2.contains(.unknown0) {
                                                                // <+15380>
                                                                // sp + 0xb00
                                                                let copy_33 = rootPlatform
                                                                
                                                                guard let _d10 = unsafe self.updateItemViewAsync(
                                                                    platform: copy_33,
                                                                    oldItem: copy_22,
                                                                    oldState: &copy_25,
                                                                    newItem: copy_27,
                                                                    newState: &copy_29
                                                                ) else {
                                                                    // <+20508>
                                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                                    self.viewCache.invalidateAsyncValues()
                                                                    self.isValid = self.wasValid
                                                                    return nil
                                                                }
                                                                
                                                                d10 = _d10
                                                                // <+15904>
                                                            } else {
                                                                // <+14932>
                                                                // sp + 0xb00
                                                                let copy_33 = copy_22.value
                                                                // sp + 0xb20
                                                                let copy_34 = copy_27.value
                                                                
                                                                if
                                                                    case .effect(_, let list_3) = copy_33,
                                                                    case .effect(_, let list_4) = copy_34
                                                                {
                                                                    // <+15084>
                                                                    // sp + 0xa00
                                                                    let copy_35 = rootPlatform
                                                                    
                                                                    guard let _d10 = unsafe self.updateAsync(
                                                                        platform: copy_35,
                                                                        oldList: list_3,
                                                                        oldParentState: &copy_25,
                                                                        newList: list_4,
                                                                        newParentState: &copy_29
                                                                    ) else {
                                                                        // <+20508>
                                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                                        self.viewCache.invalidateAsyncValues()
                                                                        self.isValid = self.wasValid
                                                                        return nil
                                                                    }
                                                                    
                                                                    d10 = _d10
                                                                    
                                                                    // <+15904>
                                                                } else {
                                                                    // <+15516>
                                                                    d10 = .infinity
                                                                    // <+15904>
                                                                }
                                                                
                                                                // <+15904>
                                                            }
                                                            
                                                            // <+15904>
                                                        } else {
                                                            // <+14436>
                                                            // sp + 0xb00
                                                            let copy_33 = copy_22
                                                            // sp + 0x8c0
                                                            let features_2 = copy_33.features
                                                            // sp + 0x960
                                                            let copy_34 = copy_27
                                                            // sp + 0xa00
                                                            let features_3 = copy_34.features
                                                            
                                                            guard features_2 == features_3 else {
                                                                // <+20496>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                           
                                                            // <+14592>
                                                            if case .effect(let effect_3, let list_3) = copy_22.value {
                                                                for item in list_3.items {
                                                                    self.viewCache.index.skip(item: item)
                                                                }
                                                                
                                                                // <+15780>
                                                                self.viewCache.index.skip(effect: effect_3)
                                                            } else {
                                                                // <+15888>
                                                            }
                                                            
                                                            // <+15888>
                                                            d10 = .infinity
                                                            // <+15904>
                                                        }
                                                        
                                                        // <+15904>
                                                    }
                                                    
                                                    // <+15904>
                                                    if !(d8 > d10) {
                                                        // <+12036>
                                                        // <+12076>
                                                    } else {
                                                        // <+15932>
                                                        let key = DisplayList.ViewUpdater.ViewCache.Key(
                                                            id: result.indexID,
                                                            system: result.system,
                                                            tag: result.tag
                                                        )
                                                        
                                                        self.viewCache.map[key]!.nextUpdate = d10
                                                        // <+11884>
                                                        d8 = d10
                                                        // <+12076>
                                                    }
                                                    
                                                    // <+12076>
                                                } else {
                                                    // <+13716>
                                                    if case .effect(_, let list_3) = copy_22.value {
                                                        // <+13736>
                                                        for item in list_3.items {
                                                            self.viewCache.index.skip(item: item)
                                                        }
                                                        
                                                        // <+13948>
                                                        // <+12076>
                                                    } else {
                                                        // <+15248>
                                                        // <+12076>
                                                    }
                                                    
                                                    // <+12076>
                                                }
                                                
                                                // <+12076>
                                            } else if requirements_2.contains(.unknown2) {
                                                // <+14004>
                                                if requirements_2.contains(.unknown0) {
                                                    // <+14816>
                                                    // sp + 0xf90
                                                    let copy_31 = rootPlatform
                                                    
                                                    guard let _d8 = unsafe self.updateItemViewAsync(
                                                        platform: copy_31,
                                                        oldItem: copy_22,
                                                        oldState: &copy_25,
                                                        newItem: copy_27,
                                                        newState: &copy_29
                                                    ) else {
                                                        // <+16504>
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    d8 = _d8
                                                    // <+12076>
                                                } else {
                                                    // <+14016>
                                                    // sp + 0xb00
                                                    let copy_31 = copy_22.value
                                                    // sp + 0xb20
                                                    let copy_32 = copy_27.value
                                                    
                                                    if
                                                        case .effect(_, let list_3) = copy_31,
                                                        case .effect(_, let list_4) = copy_32
                                                    {
                                                        // <+14160>
                                                        // sp + 0x820
                                                        let copy_33 = rootPlatform
                                                        
                                                        guard let _d8 = unsafe self.updateAsync(
                                                            platform: copy_33,
                                                            oldList: list_3,
                                                            oldParentState: &copy_25,
                                                            newList: list_4,
                                                            newParentState: &copy_29
                                                        ) else {
                                                            // <+16504>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        d8 = _d8
                                                        // <+12076>
                                                    } else {
                                                        // <+15288>
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                }
                                                
                                                // <+12076>
                                            } else {
                                                // <+13124>
                                                // sp + 0xb00
                                                let copy_31 = copy_27
                                                // sp + 0x960
                                                let features_1 = copy_31.features
                                                
                                                if features_1.contains(.required) {
                                                    // <+14004>
                                                    if requirements_2.contains(.unknown0) {
                                                        // <+14816>
                                                        // sp + 0xf90
                                                        let copy_31 = rootPlatform
                                                        
                                                        guard let _d8 = unsafe self.updateItemViewAsync(
                                                            platform: copy_31,
                                                            oldItem: copy_22,
                                                            oldState: &copy_25,
                                                            newItem: copy_27,
                                                            newState: &copy_29
                                                        ) else {
                                                            // <+16504>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        d8 = _d8
                                                        // <+12076>
                                                    } else {
                                                        // <+14016>
                                                        // sp + 0xb00
                                                        let copy_31 = copy_22.value
                                                        // sp + 0xb20
                                                        let copy_32 = copy_27.value
                                                        
                                                        if
                                                            case .effect(_, let list_3) = copy_31,
                                                            case .effect(_, let list_4) = copy_32
                                                        {
                                                            // <+14160>
                                                            // sp + 0x820
                                                            let copy_33 = rootPlatform
                                                            
                                                            guard let _d8 = unsafe self.updateAsync(
                                                                platform: copy_33,
                                                                oldList: list_3,
                                                                oldParentState: &copy_25,
                                                                newList: list_4,
                                                                newParentState: &copy_29
                                                            ) else {
                                                                // <+16504>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            d8 = _d8
                                                            // <+12076>
                                                        } else {
                                                            // <+15288>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                    }
                                                    
                                                    // <+12076>
                                                } else {
                                                    // <+13208>
                                                    // sp + 0xb00
                                                    let copy_32 = copy_22
                                                    // sp + 0x8c0
                                                    let features_2 = copy_32.features
                                                    // sp + 0x960
                                                    let copy_33 = copy_27
                                                    // sp + 0x820
                                                    let features_3 = copy_33.features
                                                    
                                                    if features_2 != features_3 {
                                                        // <+15484>
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    } else {
                                                        // <+13368>
                                                        if case .effect(let effect_3, let list_3) = copy_22.value {
                                                            // <+13388>
                                                            for item in list_3.items {
                                                                self.viewCache.index.skip(item: item)
                                                            }
                                                            
                                                            self.viewCache.index.skip(effect: effect_3)
                                                            // <+12076>
                                                        } else {
                                                            // <+15712>
                                                            // <+12076>
                                                        }
                                                        
                                                        // <+12076>
                                                    }
                                                    
                                                    // <+12076>
                                                }
                                                // <+12076>
                                            }
                                            
                                            // <+12076>
                                            d8 = (d9 > d8) ? d8 : d9
                                            self.viewCache.index.leave(index: oldIndex_2)
                                            // <+1764>
                                        }
                                        
                                        // <+16736>
                                        // <+1764>
                                    }
                                    // <+1764>
                                } else {
                                    // <+1628>
                                    d8 = .infinity
                                    // <+1764>
                                }
                                
                                // <+1764>
                            }
                            
                            // <+1764>
                        } else {
                            // <+2868>
                            // inlined
                            let features_1 = copy_13.features
                            
                            // <+7076>
                            if !features_1.contains(.required) {
                                // <+8912>
                                // w28
                                // inlined
                                let features_2 = copy_8.features
                                // <+16876>
                                // inlined
                                let features_3 = copy_13.features
                                
                                if features_2 == features_3 {
                                    // <+17532>
                                    if
                                        case .effect(let effect, let list) = copy_8.value
                                    {
                                        // <+17552>
                                        for item in list.items {
                                            self.viewCache.index.skip(item: item)
                                        }
                                        
                                        // <+17780>
                                        self.viewCache.index.skip(effect: effect)
                                    } else {
                                        // <+17768>
                                    }
                                    
                                    d8 = .infinity
                                    // <+1764>
                                } else {
                                    // <+22376>
                                    self.viewCache.index.leave(index: oldIndex_1)
                                    self.viewCache.invalidateAsyncValues()
                                    self.isValid = self.wasValid
                                    return nil
                                }
                            } else {
                                // <+7080>
                                if requirements_1.contains(.unknown0) {
                                    // <+7372>
                                    // sp + 0x1fe0
                                    let copy_17 = copy_8
                                    // x29 - 0x100
                                    let copy_18 = copy_13
                                    
                                    // inlined
                                    guard let result = unsafe self.updateAsync(
                                        oldItem: copy_17,
                                        oldState: &copy_11,
                                        newItem: copy_18,
                                        newState: &copy_15,
                                        tag: .item,
                                        platform: rootPlatform
                                    ) else {
                                        // <+8800>
                                        self.viewCache.index.leave(index: oldIndex_1)
                                        self.viewCache.invalidateAsyncValues()
                                        self.isValid = self.wasValid
                                        return nil
                                    }
                                    
                                    // <+8032>
                                    var d9 = result.nextUpdate
                                    self.isValid = self.isValid && result.isValid
                                    
                                    // <+8048>
                                    // sp + 0x1280
                                    let copy_19 = copy_17.value
                                    // sp + 0x12a0
                                    let copy_20 = copy_18.value
                                    
                                    if
                                        case .effect(let effect_1, let list_1) = copy_19,
                                        case .effect(let effect_2, let list_2) = copy_20
                                    {
                                        // <+8140>
                                        if (copy_17.version != copy_18.version) || !self.wasValid {
                                            // <+10652>
                                            // inlined
                                            unsafe copy_11.reset()
                                            // inlined
                                            unsafe copy_15.reset()
                                            
                                            // <+11084>
                                            if list_1.items.count != list_2.items.count {
                                                // <+20240>
                                                self.viewCache.index.leave(index: oldIndex_1)
                                                self.viewCache.invalidateAsyncValues()
                                                self.isValid = self.wasValid
                                                return nil
                                            } else {
                                                // <+11100>
                                                d10 = .infinity
                                                
                                                for index in list_1.items.indices {
                                                    // <+11104>
                                                    // sp + 0xca0
                                                    let item_1 = list_1.items[index]
                                                    // sp + 0xb00
                                                    var item_2 = list_1.items[index]
                                                    // sp + 0xdf0
                                                    let item_3 = list_2.items[index]
                                                    // sp + 0x960
                                                    var item_4 = list_2.items[index]
                                                    
                                                    // <+11328>
                                                    guard item_1.identity == item_3.identity else {
                                                        // <+20148>
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    // <+11336>
                                                    guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                        // <+20224>
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    // <+11376>
                                                    // sp + 0x58
                                                    let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                                    // sp + 0x1230
                                                    let copy_21 = rootPlatform
                                                    
                                                    // <+11520>
                                                    let d11 = unsafe self.viewCache.prepare(
                                                        item: &item_2,
                                                        platform: copy_21,
                                                        parentState: &copy_11
                                                    )
                                                    
                                                    self.viewCache.index = oldIndex_2
                                                    // sp + 0x1230
                                                    let copy_22 = rootPlatform
                                                    
                                                    // <+11568>
                                                    let d14 = unsafe self.viewCache.prepare(
                                                        item: &item_4,
                                                        platform: copy_22,
                                                        parentState: &copy_15
                                                    )
                                                    
                                                    // sp + 0x820
                                                    let copy_23 = rootPlatform
                                                    
                                                    // <+11624>
                                                    guard let _d8 = unsafe self.updateInheritedViewAsync(
                                                        platform: copy_23,
                                                        oldItem: item_2,
                                                        oldParentState: &copy_11,
                                                        newItem: item_4,
                                                        newParentState: &copy_15
                                                    ) else {
                                                        // <+20308>
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    d8 = _d8
                                                    // <+11660>
                                                    d0 = (d11 < d10) ? d11 : d10
                                                    d0 = (d14 < d0) ? d14 : d0
                                                    d10 = (d0 > d8) ? d8 : d0
                                                    
                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                }
                                                
                                                // <+19120>
                                                if
                                                    case .mask(let list_3, _) = effect_1,
                                                    case .mask(let list_4, _) = effect_2
                                                {
                                                    // <+19180>
                                                    if list_3.items.count != list_4.items.count {
                                                        // <+20548>
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    } else {
                                                        // <+19244>
                                                        var d11 = Time.infinity
                                                        
                                                        for index in list_3.items.indices {
                                                            // sp + 0xca0
                                                            let item_1 = list_3.items[index]
                                                            // sp + 0xb00
                                                            var item_2 = list_3.items[index]
                                                            // sp + 0xdf0
                                                            let item_3 = list_4.items[index]
                                                            // sp + 0x960
                                                            var item_4 = list_4.items[index]
                                                            
                                                            // <+19484>
                                                            guard item_1.identity == item_3.identity else {
                                                                // <+21556>
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            // <+19492>
                                                            guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                                // <+21632>
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            // <+19532>
                                                            // sp + 0x58
                                                            let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                                            
                                                            // <+19628>
                                                            // sp + 0x1230
                                                            let copy_21 = rootPlatform
                                                            
                                                            let d14 = unsafe self.viewCache.prepare(
                                                                item: &item_2,
                                                                platform: copy_21,
                                                                parentState: &copy_11
                                                            )
                                                            
                                                            self.viewCache.index = oldIndex_2
                                                            // sp + 0x1230
                                                            let copy_22 = rootPlatform
                                                            
                                                            let d15 = unsafe self.viewCache.prepare(
                                                                item: &item_4,
                                                                platform: copy_22,
                                                                parentState: &copy_15
                                                            )
                                                            // sp + 0x820
                                                            let copy_23 = rootPlatform
                                                            
                                                            guard let _d8 = unsafe self.updateInheritedViewAsync(
                                                                platform: copy_23,
                                                                oldItem: item_2,
                                                                oldParentState: &copy_11,
                                                                newItem: item_4,
                                                                newParentState: &copy_15
                                                            ) else {
                                                                // <+21724>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            d8 = _d8
                                                            // <+19812>
                                                            d0  = (d14 < d11) ? d14 : d11
                                                            d11 = (d15 < d0) ? d15 : d0
                                                            d11 = (d11 > d8) ? d8 : d11
                                                            
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                        }
                                                        
                                                        // <+20632>
                                                        d10 = (d11 < d10) ? d11 : d10
                                                        // <+20696>
                                                    }
                                                } else {
                                                    // <+20696>
                                                }
                                                
                                                // <+20696>
                                                if !(d10 < d9) {
                                                    // <+21532>
                                                    // <+10464>
                                                } else {
                                                    // <+20724>
                                                    let key = DisplayList.ViewUpdater.ViewCache.Key(
                                                        id: result.indexID,
                                                        system: PlatformViewDefinition.System(base: rootPlatform.system),
                                                        tag: .item
                                                    )
                                                    
                                                    self.viewCache.map[key]!.nextUpdate = d10
                                                    d9 = d10
                                                    // <+10464>
                                                }
                                                
                                                // <+10464>
                                                d8 = d9
                                                // <+1764>
                                            }
                                            
                                            // <+1764>
                                        } else {
                                            // <+8164>
                                            if case .mask(let list_3, _) = effect_1 {
                                                // <+8180>
                                                self.viewCache.index.skip(list: list_3)
                                                // <+19980>
                                            } else {
                                                // <+19924>
                                                // <+19980>
                                            }
                                            
                                            // <+19980>
                                            self.viewCache.index.skip(list: list_1)
                                            d8 = d9
                                            // <+1764>
                                        }
                                        
                                        // <+1764>
                                    } else {
                                        // <+10460>
                                        d8 = d9
                                        // <+1764>
                                    }
                                    
                                    // <+1764>
                                } else {
                                    // <+7084>
                                    // sp + 0x1300
                                    let copy_17 = copy_8.value
                                    // sp + 0x1320
                                    let copy_18 = copy_13.value
                                    
                                    if
                                        case .effect(_, let list_1) = copy_17,
                                        case .effect(_, let list_2) = copy_18
                                    {
                                        // <+7240>
                                        if list_1.items.count != list_2.items.count {
                                            // <+8316>
                                            self.viewCache.index.leave(index: oldIndex_1)
                                            self.viewCache.invalidateAsyncValues()
                                            self.isValid = self.wasValid
                                            return nil
                                        } else {
                                            // <+7308>
                                            d8 = .infinity
                                            
                                            for index in list_1.items.indices {
                                                // <+12168>
                                                // sp + 0x1230
                                                let item_1 = list_1.items[index]
                                                // sp + 0x11e0
                                                var item_2 = list_1.items[index]
                                                // sp + 0x1280
                                                let item_3 = list_2.items[index]
                                                // sp + 0x1190
                                                var item_4 = list_2.items[index]
                                                
                                                // <+12392>
                                                guard item_1.identity == item_3.identity else {
                                                    // <+16592>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+12416>
                                                guard item_4.matchesTopLevelStructure(of: item_2) else {
                                                    // <+16672>
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+12468>
                                                // sp + 0x58
                                                let oldIndex_2 = self.viewCache.index.enter(identity: item_4.identity)
                                                // <+12556>
                                                // sp + 0xdf0
                                                let copy_19 = rootPlatform
                                                
                                                d0 = unsafe self.viewCache.prepare(
                                                    item: &item_2,
                                                    platform: copy_19,
                                                    parentState: &copy_11
                                                )
                                                
                                                d8 = (d0 < d8) ? d0 : d8
                                                self.viewCache.index = oldIndex_2
                                                // sp + 0x1040
                                                let copy_20 = rootPlatform
                                                
                                                d0 = unsafe self.viewCache.prepare(
                                                    item: &item_4,
                                                    platform: copy_20,
                                                    parentState: &copy_15
                                                )
                                                
                                                let d9 = (d0 < d8) ? d0 : d8
                                                // <+12712>
                                                // sp + 0xfa0
                                                let _ = item_2
                                                // sp + 0xf40
                                                var copy_22 = item_2
                                                // sp + 0xff0
                                                let copy_23 = item_4
                                                // sp + 0x1040
                                                let _ = unsafe copy_11
                                                // sp + 0xdf0
                                                var copy_25 = unsafe copy_11
                                                
                                                // <+12844>
                                                // sp + 0xb00
                                                let copy_26 = self.viewCache.index
                                                // x23/w19
                                                let requirements_2 = unsafe DisplayList.ViewUpdater.Model.merge(
                                                    item: &copy_22,
                                                    index: copy_26,
                                                    into: &copy_25
                                                )
                                                
                                                // sp + 0xc50
                                                var copy_27 = copy_23
                                                // sp + 0x1370
                                                let _ = unsafe copy_15
                                                // sp + 0xca0
                                                var copy_29 = unsafe copy_15
                                                // sp + 0x960
                                                let copy_30 = self.viewCache.index
                                                let requirements_3 = unsafe DisplayList.ViewUpdater.Model.merge(
                                                    item: &copy_27,
                                                    index: copy_30,
                                                    into: &copy_29
                                                )
                                                
                                                guard requirements_2 == requirements_3 else {
                                                    // <+16464>
                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                    self.viewCache.invalidateAsyncValues()
                                                    self.isValid = self.wasValid
                                                    return nil
                                                }
                                                
                                                // <+13112>
                                                if requirements_2.contains(.unknown1) {
                                                    // <+13580>
                                                    // sp + 0x960
                                                    let copy_31 = rootPlatform
                                                    // sp + 0xa48
                                                    guard let result = unsafe self.viewCache.updateAsync(
                                                        oldItem: copy_22,
                                                        oldState: &copy_11,
                                                        newItem: copy_27,
                                                        newState: &copy_15,
                                                        tag: .inherited,
                                                        platform: copy_31
                                                    ) else {
                                                        // <+16464>
                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                        self.viewCache.invalidateAsyncValues()
                                                        self.isValid = self.wasValid
                                                        return nil
                                                    }
                                                    
                                                    d8 = result.nextUpdate
                                                    self.isValid = self.isValid && result.isValid
                                                    
                                                    // <+13712>
                                                    if result.changed {
                                                        // <+14340>
                                                        if requirements_2.contains(.unknown2) {
                                                            // <+14928>
                                                            if requirements_2.contains(.unknown0) {
                                                                // <+15380>
                                                                // sp + 0xb00
                                                                let copy_33 = rootPlatform
                                                                
                                                                guard let _d10 = unsafe self.updateItemViewAsync(
                                                                    platform: copy_33,
                                                                    oldItem: copy_22,
                                                                    oldState: &copy_25,
                                                                    newItem: copy_27,
                                                                    newState: &copy_29
                                                                ) else {
                                                                    // <+20508>
                                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                                    self.viewCache.invalidateAsyncValues()
                                                                    self.isValid = self.wasValid
                                                                    return nil
                                                                }
                                                                
                                                                d10 = _d10
                                                                // <+15904>
                                                            } else {
                                                                // <+14932>
                                                                // sp + 0xb00
                                                                let copy_33 = copy_22.value
                                                                // sp + 0xb20
                                                                let copy_34 = copy_27.value
                                                                
                                                                if
                                                                    case .effect(_, let list_3) = copy_33,
                                                                    case .effect(_, let list_4) = copy_34
                                                                {
                                                                    // <+15084>
                                                                    // sp + 0xa00
                                                                    let copy_35 = rootPlatform
                                                                    
                                                                    guard let _d10 = unsafe self.updateAsync(
                                                                        platform: copy_35,
                                                                        oldList: list_3,
                                                                        oldParentState: &copy_25,
                                                                        newList: list_4,
                                                                        newParentState: &copy_29
                                                                    ) else {
                                                                        // <+20508>
                                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                                        self.viewCache.invalidateAsyncValues()
                                                                        self.isValid = self.wasValid
                                                                        return nil
                                                                    }
                                                                    
                                                                    d10 = _d10
                                                                    
                                                                    // <+15904>
                                                                } else {
                                                                    // <+15516>
                                                                    d10 = .infinity
                                                                    // <+15904>
                                                                }
                                                                
                                                                // <+15904>
                                                            }
                                                            
                                                            // <+15904>
                                                        } else {
                                                            // <+14348>
                                                            // sp + 0xb00
                                                            let copy_32 = copy_27
                                                            // sp + 0x960
                                                            let features_1 = copy_32.features
                                                            
                                                            if features_1.contains(.required) {
                                                                // <+14928>
                                                                if requirements_2.contains(.unknown0) {
                                                                    // <+15380>
                                                                    // sp + 0xb00
                                                                    let copy_33 = rootPlatform
                                                                    
                                                                    guard let _d10 = unsafe self.updateItemViewAsync(
                                                                        platform: copy_33,
                                                                        oldItem: copy_22,
                                                                        oldState: &copy_25,
                                                                        newItem: copy_27,
                                                                        newState: &copy_29
                                                                    ) else {
                                                                        // <+20508>
                                                                        self.viewCache.index.leave(index: oldIndex_2)
                                                                        self.viewCache.index.leave(index: oldIndex_1)
                                                                        self.viewCache.invalidateAsyncValues()
                                                                        self.isValid = self.wasValid
                                                                        return nil
                                                                    }
                                                                    
                                                                    d10 = _d10
                                                                    // <+15904>
                                                                } else {
                                                                    // <+14932>
                                                                    // sp + 0xb00
                                                                    let copy_33 = copy_22.value
                                                                    // sp + 0xb20
                                                                    let copy_34 = copy_27.value
                                                                    
                                                                    if
                                                                        case .effect(_, let list_3) = copy_33,
                                                                        case .effect(_, let list_4) = copy_34
                                                                    {
                                                                        // <+15084>
                                                                        // sp + 0xa00
                                                                        let copy_35 = rootPlatform
                                                                        
                                                                        guard let _d10 = unsafe self.updateAsync(
                                                                            platform: copy_35,
                                                                            oldList: list_3,
                                                                            oldParentState: &copy_25,
                                                                            newList: list_4,
                                                                            newParentState: &copy_29
                                                                        ) else {
                                                                            // <+20508>
                                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                                            self.viewCache.invalidateAsyncValues()
                                                                            self.isValid = self.wasValid
                                                                            return nil
                                                                        }
                                                                        
                                                                        d10 = _d10
                                                                        
                                                                        // <+15904>
                                                                    } else {
                                                                        // <+15516>
                                                                        d10 = .infinity
                                                                        // <+15904>
                                                                    }
                                                                    
                                                                    // <+15904>
                                                                }
                                                                
                                                                // <+15904>
                                                            } else {
                                                                // <+14436>
                                                                // sp + 0xb00
                                                                let copy_33 = copy_22
                                                                // sp + 0x8c0
                                                                let features_2 = copy_33.features
                                                                // sp + 0x960
                                                                let copy_34 = copy_27
                                                                // sp + 0xa00
                                                                let features_3 = copy_34.features
                                                                
                                                                guard features_2 == features_3 else {
                                                                    // <+20496>
                                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                                    self.viewCache.invalidateAsyncValues()
                                                                    self.isValid = self.wasValid
                                                                    return nil
                                                                }
                                                               
                                                                // <+14592>
                                                                if case .effect(let effect_3, let list_3) = copy_22.value {
                                                                    for item in list_3.items {
                                                                        self.viewCache.index.skip(item: item)
                                                                    }
                                                                    
                                                                    // <+15780>
                                                                    self.viewCache.index.skip(effect: effect_3)
                                                                } else {
                                                                    // <+15888>
                                                                }
                                                                
                                                                // <+15888>
                                                                d10 = .infinity
                                                                // <+15904>
                                                            }
                                                            
                                                            // <+15904>
                                                        }
                                                        
                                                        // <+15904>
                                                        if !(d8 > d10) {
                                                            // <+12036>
                                                            // <+12076>
                                                        } else {
                                                            // <+15932>
                                                            let key = DisplayList.ViewUpdater.ViewCache.Key(
                                                                id: result.indexID,
                                                                system: result.system,
                                                                tag: result.tag
                                                            )
                                                            
                                                            self.viewCache.map[key]!.nextUpdate = d10
                                                            // <+11884>
                                                            d8 = d10
                                                            // <+12076>
                                                        }
                                                        
                                                        // <+12076>
                                                    } else {
                                                        // <+13716>
                                                        if case .effect(_, let list_3) = copy_22.value {
                                                            // <+13736>
                                                            for item in list_3.items {
                                                                self.viewCache.index.skip(item: item)
                                                            }
                                                            
                                                            // <+13948>
                                                            // <+12076>
                                                        } else {
                                                            // <+15248>
                                                            // <+12076>
                                                        }
                                                        
                                                        // <+12076>
                                                    }
                                                    
                                                    // <+12076>
                                                } else if requirements_2.contains(.unknown2) {
                                                    // <+14004>
                                                    if requirements_2.contains(.unknown0) {
                                                        // <+14816>
                                                        // sp + 0xf90
                                                        let copy_31 = rootPlatform
                                                        
                                                        guard let _d8 = unsafe self.updateItemViewAsync(
                                                            platform: copy_31,
                                                            oldItem: copy_22,
                                                            oldState: &copy_25,
                                                            newItem: copy_27,
                                                            newState: &copy_29
                                                        ) else {
                                                            // <+16504>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                        
                                                        d8 = _d8
                                                        // <+12076>
                                                    } else {
                                                        // <+14016>
                                                        // sp + 0xb00
                                                        let copy_31 = copy_22.value
                                                        // sp + 0xb20
                                                        let copy_32 = copy_27.value
                                                        
                                                        if
                                                            case .effect(_, let list_3) = copy_31,
                                                            case .effect(_, let list_4) = copy_32
                                                        {
                                                            // <+14160>
                                                            // sp + 0x820
                                                            let copy_33 = rootPlatform
                                                            
                                                            guard let _d8 = unsafe self.updateAsync(
                                                                platform: copy_33,
                                                                oldList: list_3,
                                                                oldParentState: &copy_25,
                                                                newList: list_4,
                                                                newParentState: &copy_29
                                                            ) else {
                                                                // <+16504>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            d8 = _d8
                                                            // <+12076>
                                                        } else {
                                                            // <+15288>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        }
                                                    }
                                                    
                                                    // <+12076>
                                                } else {
                                                    // <+13124>
                                                    // sp + 0xb00
                                                    let copy_31 = copy_27
                                                    // sp + 0x960
                                                    let features_1 = copy_31.features
                                                    
                                                    if features_1.contains(.required) {
                                                        // <+14004>
                                                        if requirements_2.contains(.unknown0) {
                                                            // <+14816>
                                                            // sp + 0xf90
                                                            let copy_31 = rootPlatform
                                                            
                                                            guard let _d8 = unsafe self.updateItemViewAsync(
                                                                platform: copy_31,
                                                                oldItem: copy_22,
                                                                oldState: &copy_25,
                                                                newItem: copy_27,
                                                                newState: &copy_29
                                                            ) else {
                                                                // <+16504>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                            
                                                            d8 = _d8
                                                            // <+12076>
                                                        } else {
                                                            // <+14016>
                                                            // sp + 0xb00
                                                            let copy_31 = copy_22.value
                                                            // sp + 0xb20
                                                            let copy_32 = copy_27.value
                                                            
                                                            if
                                                                case .effect(_, let list_3) = copy_31,
                                                                case .effect(_, let list_4) = copy_32
                                                            {
                                                                // <+14160>
                                                                // sp + 0x820
                                                                let copy_33 = rootPlatform
                                                                
                                                                guard let _d8 = unsafe self.updateAsync(
                                                                    platform: copy_33,
                                                                    oldList: list_3,
                                                                    oldParentState: &copy_25,
                                                                    newList: list_4,
                                                                    newParentState: &copy_29
                                                                ) else {
                                                                    // <+16504>
                                                                    self.viewCache.index.leave(index: oldIndex_2)
                                                                    self.viewCache.index.leave(index: oldIndex_1)
                                                                    self.viewCache.invalidateAsyncValues()
                                                                    self.isValid = self.wasValid
                                                                    return nil
                                                                }
                                                                
                                                                d8 = _d8
                                                                // <+12076>
                                                            } else {
                                                                // <+15288>
                                                                self.viewCache.index.leave(index: oldIndex_2)
                                                                self.viewCache.index.leave(index: oldIndex_1)
                                                                self.viewCache.invalidateAsyncValues()
                                                                self.isValid = self.wasValid
                                                                return nil
                                                            }
                                                        }
                                                        
                                                        // <+12076>
                                                    } else {
                                                        // <+13208>
                                                        // sp + 0xb00
                                                        let copy_32 = copy_22
                                                        // sp + 0x8c0
                                                        let features_2 = copy_32.features
                                                        // sp + 0x960
                                                        let copy_33 = copy_27
                                                        // sp + 0x820
                                                        let features_3 = copy_33.features
                                                        
                                                        if features_2 != features_3 {
                                                            // <+15484>
                                                            self.viewCache.index.leave(index: oldIndex_2)
                                                            self.viewCache.index.leave(index: oldIndex_1)
                                                            self.viewCache.invalidateAsyncValues()
                                                            self.isValid = self.wasValid
                                                            return nil
                                                        } else {
                                                            // <+13368>
                                                            if case .effect(let effect_3, let list_3) = copy_22.value {
                                                                // <+13388>
                                                                for item in list_3.items {
                                                                    self.viewCache.index.skip(item: item)
                                                                }
                                                                
                                                                self.viewCache.index.skip(effect: effect_3)
                                                                // <+12076>
                                                            } else {
                                                                // <+15712>
                                                                // <+12076>
                                                            }
                                                            
                                                            // <+12076>
                                                        }
                                                        
                                                        // <+12076>
                                                    }
                                                    // <+12076>
                                                }
                                                
                                                // <+12076>
                                                d8 = (d9 > d8) ? d8 : d9
                                                self.viewCache.index.leave(index: oldIndex_2)
                                                // <+1764>
                                            }
                                            
                                            // <+16736>
                                            // <+1764>
                                        }
                                        // <+1764>
                                    } else {
                                        // <+1628>
                                        d8 = .infinity
                                        // <+1764>
                                    }
                                    
                                    // <+1764>
                                }
                                
                                // <+1764>
                            }
                            
                            // <+1764>
                        }
                        
                        // <+1764>
                        d10 = (d8 < d13) ? d8 : d13
                        self.viewCache.index.leave(index: oldIndex_1)
                        continue
                    }
                    
                    // <+1468>
                    self.viewCache.commitAsyncValues(targetTimestamp: targetTimestamp)
                    // <+1604>
                    self.lastList = displayList
                    self.lastTime = d12
                    self.asyncSeed = self.seed
                    self.nextUpdate = d10
                    
                    return d10
                }
            }
        }
        
        func updateAsync(
            oldItem: DisplayList.Item,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            tag: DisplayList.ViewUpdater.ViewCache.Tag,
            platform: DisplayList.ViewUpdater.Platform
        ) -> DisplayList.ViewUpdater.ViewCache.AsyncResult? {
            assertUnimplemented()
        }
        
        func destroy(rootView: AnyObject) {
            assertUnimplemented()
        }
        
        var viewCacheIsEmpty: Bool {
            assertUnimplemented()
        }
        
        fileprivate func updateInheritedView(
            container: inout DisplayList.ViewUpdater.Container,
            from item: DisplayList.Item,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            /*
             self -> x20 -> x19
             container -> x0 -> x22
             parentState -> x2 -> x23
             */
            // sp + 0x470
            let copy_1 = item
            // sp + 0x420
            var copy_2 = item
            // sp + 0x4c8
            let parentStatePointee1 = parentState.pointee
            // sp + 0x2d0
            var parentStatePointee2 = parentState.pointee
            // sp + 0xf0
            let index = self.viewCache.index
            // sp + 0x160
            let copy_3 = copy_1
            
            // <+232>
            // x24
            let requirements = DisplayList.ViewUpdater.Model.merge(item: &copy_2, index: index, into: &parentStatePointee2)
            
            if !requirements.contains(.unknown2) {
                // <+256>
                switch copy_2.value {
                case .content(let content):
                    // <+288>
                    assertUnimplemented()
                case .effect(let effect, let displayList):
                    // <+364>
                    assertUnimplemented()
                case .states(let array):
                    // <+336>
                    assertUnimplemented()
                case .empty:
                    // <+740>
                    assertUnimplemented()
                }
            } else if !requirements.contains(.unknown1) {
                // <+924>
                if !requirements.contains(.unknown0) {
                    // <+944>
                    if case .effect(_, let displayList) = copy_2.value {
                        self.update(container: &container, from: displayList, parentState: &parentStatePointee2)
                    }
                    
                    // <+1840>
                    // <+1988>
                    return
                } else {
                    // <+1816>
                    self.updateItemView(container: &container, from: copy_2, localState: &parentStatePointee2)
                    // <+1988>
                    return
                }
            } else {
                // <+1012>
                assertUnimplemented()
            }
            
            assertUnimplemented()
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
            assertUnimplemented()
        }
        
        fileprivate func update(
            container: inout DisplayList.ViewUpdater.Container,
            from displayList: DisplayList,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            for item in displayList.items {
                /*
                 self -> x20 -> x19
                 parentState -> x2 -> x21
                 container -> x0 -> x22
                 */
                // inlined
                let oldIndex = self.viewCache.index.enter(identity: item.identity)
                var item = item
                let time = unsafe self.viewCache.prepare(item: &item, platform: self.rootPlatform, parentState: parentState)
                
                if time < container.time {
                    container.time = time
                }
                
                unsafe self.updateInheritedView(container: &container, from: item, parentState: parentState)
                self.viewCache.index.leave(index: oldIndex)
            }
        }
        
        fileprivate func updateAsync(
            platform: DisplayList.ViewUpdater.Platform,
            oldList: DisplayList,
            oldParentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newList: DisplayList,
            newParentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Time? {
            /*
             self -> x20
             return pointer -> x8
             platform -> x0
             oldList -> x1
             oldParentState -> x2 -> sp + 0x20
             newList -> x3
             newParentState -> x4 -> sp + 0x28
             */
            guard oldList.items.count == newList.items.count else {
                return nil
            }
            
            // <+72>
            /*
             return pointer -> x8 -> sp + 0x8
             platform -> x0 -> sp + 0x18
             */
            var d8 = Time.infinity
            
            for index in oldList.items.indices {
                // <+184>
                // x11 (sp + 0x1a0)
                let item_1 = oldList.items[index]
                // x10 + 0xa0 (sp + 0x150)
                var item_2 = oldList.items[index]
                // x11 + 0x50 (sp + 0x1f0)
                let item_3 = newList.items[index]
                // x10 + 0x50 (sp + 0x100)
                var item_4 = newList.items[index]
                
                guard item_1.identity == item_3.identity else {
                    return nil
                }
                
                // <+352>
                guard item_4.matchesTopLevelStructure(of: item_2) else {
                    return nil
                }
                
                // sp + 0x30
                let oldIndex = self.viewCache.index.enter(identity: item_4.identity)
                let currentIndex = self.viewCache.index
                
                // <+476>
                let d9 = unsafe self.viewCache.prepare(
                    item: &item_2,
                    platform: platform,
                    parentState: oldParentState
                )
                
                self.viewCache.index = currentIndex
                
                let d10 = unsafe self.viewCache.prepare(
                    item: &item_4,
                    platform: platform,
                    parentState: newParentState
                )
                
                guard let d1 = unsafe self.updateInheritedViewAsync(
                    platform: platform,
                    oldItem: item_2,
                    oldParentState: oldParentState,
                    newItem: item_4,
                    newParentState: newParentState
                ) else {
                    self.viewCache.index.leave(index: oldIndex)
                    return nil
                }
                
                var d0 = (d9  < d8) ? d9 : d8
                d0 = (d10 < d0) ? d10 : d0
                d8 = (d0 > d1) ? d1 : d0
                
                // <+696>
                self.viewCache.index.leave(index: oldIndex)
            }
            
            return d8
        }
        
        fileprivate func updateInheritedViewAsync(
            platform: DisplayList.ViewUpdater.Platform,
            oldItem: DisplayList.Item,
            oldParentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            newParentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Time? {
            /*
             self -> x20
             return pointer -> x8 -> x19
             platform -> x0 -> sp + 0x70
             oldItem -> x1 -> x24
             oldParentState -> x2 -> x26
             newItem -> x3 -> x23
             newParentState -> x4 -> x28
             */
            // sp + 0x7a0
            let copy_1 = oldItem
            // sp + 0x7f0
            let copy_2 = newItem
            // <+148>
            // x21
            var copy_3 = oldItem
            // sp + 0x848
            let copy_4 = unsafe oldParentState.pointee
            // sp + 0x650
            var copy_5 = unsafe oldParentState.pointee
            // oldParentState -> x26 -> sp + 0x60
            // self.viewCache -> x26
            // sp + 0x4e0
            let copy_6 = self.viewCache.index
            // x27/w25
            let requirements_1 = unsafe DisplayList.ViewUpdater.Model.merge(item: &copy_3, index: copy_6, into: &copy_5)
            // x22
            var copy_7 = newItem
            // sp + 0x998
            let copy_8 = unsafe newParentState.pointee
            // sp + 0x4e0
            var copy_9 = unsafe newParentState.pointee
            // sp + 0x170
            let copy_10 = self.viewCache.index
            let requirements_2 = unsafe DisplayList.ViewUpdater.Model.merge(item: &copy_7, index: copy_10, into: &copy_9)
            
            guard requirements_1 == requirements_2 else {
                return nil
            }
            
            func updateItemAsync(oldState: inout DisplayList.ViewUpdater.Model.State, newState: inout DisplayList.ViewUpdater.Model.State) -> Time? {
                /*
                 oldState -> x0 -> sp + 0xd0
                 newState -> x1 -> sp + 0xd8
                 requirements_1 -> x2 -> x25
                 copy_7 -> x3 -> x27
                 copy_3 -> x4 -> x26
                 self -> x5 -> x21
                 platform -> x6 -> sp + 0xc0
                 */
                let flag: Bool // true -> <+772> / false -> <+620>
                if requirements_1.contains(.unknown2) {
                    // <+772>
                    flag = true
                } else {
                    // <+92>
                    // inlined
                    // w20
                    let features_1 = copy_7.features
                   
                    // <+616>
                    if features_1.contains(.required) {
                        // <+772>
                        flag = true
                    } else {
                        // <+620>
                        flag = false
                    }
                }
                
                if flag {
                    // <+772>
                    if requirements_1.contains(.unknown0) {
                        // <+1072>
                        // sp + 0x850
                        let copy_11 = copy_3
                        // sp + 0x6a0
                        let copy_12 = copy_3
                        // sp + 0x9a0
                        let copy_13 = copy_7
                        // sp + 0x500
                        let copy_14 = copy_7
                        
                        return unsafe self.updateItemViewAsync(
                            platform: platform,
                            oldItem: copy_11,
                            oldState: &oldState,
                            newItem: copy_14,
                            newState: &newState
                        )
                    } else {
                        // <+792>
                        /*
                         copy_3.value -> sp + 0xb0 / x19 / (x28 -> x27)
                         copy_7.value -> sp + 0xc0 / x25 / x26
                         */
                        if
                            case .effect(let effect_1, let list_1) = copy_3.value,
                            case .effect(let effect_2, let list_2) = copy_7.value
                        {
                            // <+896>
                            guard list_1.items.count == list_2.items.count else {
                                // <+1316>
                                return .infinity
                            }
                            
                            // <+896>
                            var d8 = Time.infinity
                            
                            for index in list_1.items.indices {
                                // <+1008>
                                /*
                                 list_1.items buffer -> sp + 0x80
                                 list_2.items buffer -> sp + 0x78
                                 */
                                // sp + 0xb90
                                let item_1 = list_1.items[index]
                                // sp + 0xb40
                                var item_2 = list_1.items[index]
                                // sp + 0xbe0
                                let item_3 = list_2.items[index]
                                // sp + 0xaf0
                                var item_4 = list_2.items[index]
                                
                                guard item_1.identity == item_3.identity else {
                                    // <+5332>
                                    return nil
                                }
                                
                                // <+1672>
                                guard item_4.matchesTopLevelStructure(of: item_2) else {
                                    // <+5376>
                                    return nil
                                }
                                
                                // <+1704>
                                // sp + 0x94
                                let oldIndex = self.viewCache.index.enter(identity: item_4.identity)
                                
                                // <+1784>
                                var d0 = unsafe self.viewCache.prepare(
                                    item: &item_2,
                                    platform: platform,
                                    parentState: &oldState
                                )
                                d8 = (d0 < d8) ? d0 : d8
                                self.viewCache.index = oldIndex
                                
                                // <+1868>
                                d0 = unsafe self.viewCache.prepare(
                                    item: &item_4,
                                    platform: platform,
                                    parentState: &newState
                                )
                                let d12 = (d8 < d8) ? d0 : d8
                                
                                // <+1916>
                                // sp + 0x7b0
                                let copy_11 = item_2
                                // sp + 0x800
                                let copy_12 = item_4
                                // x27
                                var copy_13 = item_2
                                // sp + 0x850
                                let copy_14 = unsafe oldState
                                // sp + 0x650
                                var copy_15 = unsafe oldState
                                // sp + 0x3b0
                                let copy_17 = self.viewCache.index
                                // <+2072>
                                // x26/w20
                                let requirements_2 = unsafe DisplayList.ViewUpdater.Model.merge(
                                    item: &copy_13,
                                    index: copy_17,
                                    into: &copy_15
                                )
                                
                                // x25
                                var copy_18 = item_4
                                // sp + 0x9a0
                                let copy_19 = unsafe newState
                                // sp + 0x500
                                var copy_20 = unsafe newState
                                // sp + 0x2b0
                                let copy_21 = self.viewCache.index
                                let requirements_3 = unsafe DisplayList.ViewUpdater.Model.merge(
                                    item: &copy_18,
                                    index: copy_21,
                                    into: &copy_20
                                )
                                
                                guard requirements_2 == requirements_3 else {
                                    self.viewCache.index.leave(index: oldIndex)
                                    return nil
                                }
                                
                                // <+2280>
                                if requirements_2.contains(.unknown1) {
                                    // <+2392>
                                    // sp + 0x148
                                    guard var result = unsafe self.viewCache.updateAsync(
                                        oldItem: copy_13,
                                        oldState: &copy_15,
                                        newItem: copy_18,
                                        newState: &copy_20,
                                        tag: .inherited,
                                        platform: platform
                                    ) else {
                                        self.viewCache.index.leave(index: oldIndex)
                                        return nil
                                    }
                                    
                                    self.isValid = self.isValid && result.isValid
                                    
                                    if copy_13.version == copy_18.version {
                                        // <+3308>
                                        if case .effect(let effect, let list) = copy_13.value {
                                            for item in list.items {
                                                self.viewCache.index.skip(item: item)
                                            }
                                            // <+3488>
                                        } else {
                                            // <+3488>
                                        }
                                        
                                        // <+3536>
                                    } else {
                                        // <+3144>
                                        guard let nextTime = unsafe updateItemAsync(oldState: &copy_15, newState: &copy_20) else {
                                            // <+5740>
                                            self.viewCache.index.leave(index: oldIndex)
                                            return nil
                                        }
                                        
                                        // <+3212>
                                        self.viewCache.setNextUpdate(nextTime, in: &result)
                                        d8 = result.nextUpdate
                                        // <+3536>
                                    }
                                    
                                    // <+3536>
                                } else {
                                    if let _d8 = unsafe updateItemAsync(oldState: &copy_15, newState: &copy_20) {
                                        d8 = _d8
                                        // <+3536>
                                    } else {
                                        // <+5552>
                                        self.viewCache.index.leave(index: oldIndex)
                                        return nil
                                    }
                                    
                                    // <+3536>
                                }
                                
                                // <+3536>
                                d8 = (d12 > d8) ? d8 : d12
                                self.viewCache.index.leave(index: oldIndex)
                            }
                            
                            // <+4096>
                            return d8
                        } else {
                            // <+1316>
                            return .infinity
                        }
                    }
                } else {
                    // <+620>
                    // inlined
                    // w28
                    let features_2 = copy_3.features
                    // <+4316>
                    // inlined
                    // w20
                    let features_3 = copy_7.features
                    
                    // <+4784>
                    guard features_2 == features_3 else {
                        // <+5316>
                        return nil
                    }
                    
                    // <+4792>
                    if case .effect(let effect, let list) = copy_3.value {
                        for item in list.items {
                            self.viewCache.index.skip(item: item)
                        }
                        
                        self.viewCache.index.skip(effect: effect)
                        // <+5128>
                    } else {
                        // <+5128>
                    }
                    
                    // <+5128>
                    return .infinity
                }
            }
            
            // <+476>
            guard requirements_1.contains(.unknown1) else {
                // <+484>
                return unsafe updateItemAsync(oldState: &copy_5, newState: &copy_9)
            }
            
            // <+604>
            // requirements_1 -> sp + 0x4c
            // inlined
            guard var result = unsafe self.viewCache.updateAsync(
                oldItem: copy_3,
                oldState: &copy_5,
                newItem: copy_7,
                newState: &copy_9,
                tag: .inherited,
                platform: platform
            ) else {
                return nil
            }
            
            // <+1480>
            self.isValid = self.isValid && result.isValid
            
            guard result.changed else {
                // <+1620>
                if case .effect(_, let list) = copy_3.value {
                    for item in list.items {
                        self.viewCache.index.skip(item: item)
                    }
                }
                
                return result.nextUpdate
            }
            
            guard let time = unsafe updateItemAsync(oldState: &copy_5, newState: &copy_9) else {
                return nil
            }
            
            // <+1832>
            self.viewCache.setNextUpdate(time, in: &result)
            return result.nextUpdate
        }
        
        fileprivate func updateItemViewAsync(
            platform: DisplayList.ViewUpdater.Platform,
            oldItem: DisplayList.Item,
            oldState: inout DisplayList.ViewUpdater.Model.State,
            newItem: DisplayList.Item,
            newState: inout DisplayList.ViewUpdater.Model.State
        ) -> Time? {
            assertUnimplemented()
        }
    }
}

extension DisplayList.ViewUpdater.ViewInfo {
    struct ID : Equatable {
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
        @inline(always)
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
            assertUnimplemented()
        }
    }
}

extension DisplayList.ViewUpdater {
    struct ViewInfo {
        private(set) var platform: DisplayList.ViewUpdater.Platform // 0x0
        var view: AnyObject // 0x8
        private(set) var layer: CALayer // 0x10
        private(set) var container: AnyObject // 0x18
        var state: DisplayList.ViewUpdater.Platform.State // 0x20
        private(set) var id: DisplayList.ViewUpdater.ViewInfo.ID // 0x58
        var parentID: DisplayList.ViewUpdater.ViewInfo.ID // 0x60
        var seeds: DisplayList.ViewUpdater.ViewInfo.Seeds // 0x68
        var cacheSeed: UInt32 // 0x8c
        var isRemoved: Bool // 0x90
        var isInvalid: Bool // 0x91
        var nextUpdate: Time // 0x98
        
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
        
        mutating func reset() {
            assertUnimplemented()
        }
    }
    
    @safe struct PlatformViewInfo {
        let view: AnyObject
        let kind: PlatformViewDefinition.ViewKind
        private(set) var state: UnsafeMutablePointer<DisplayList.ViewUpdater.Platform.State>
        private(set) var seeds: UnsafeMutablePointer<DisplayList.ViewUpdater.PlatformViewInfo.Seeds>
        
        // 원래 없음
        @inline(always)
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
            for _index in (index..<Int(bitPattern: count)).reversed() {
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
                    viewCache.removed.insert(key)
                }
                
                CoreViewRemoveFromSuperview(system, subview)
            }
        }
    }
}

extension DisplayList.ViewUpdater {
    @safe struct AsyncLayer {
        private(set) var layer: CALayer
        let cache: UnsafeMutablePointer<DisplayList.ViewUpdater.ViewCache>
        let kind: PlatformViewDefinition.ViewKind
        let flags: DisplayList.ViewUpdater.Platform.ViewFlags
        private(set) var nextUpdate: Time
        private(set) var isInvalid: Bool
    }
}

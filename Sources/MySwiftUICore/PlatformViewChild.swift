// 6401BBC0F2663213443101ED0E1CE437
public import AttributeGraph
internal import CoreGraphics

struct PlatformViewChild<Representable : CoreViewRepresentable>: StatefulRule, ObservedAttribute, RemovableAttribute, InvalidatableAttribute, ScrapeableAttribute {
    @Attribute private var view: Representable // 0x0
    @Attribute private var environment: EnvironmentValues // 0x4
    @Attribute private var transaction: Transaction // 0x8
    @Attribute private var phase: _GraphInputs.Phase // 0xc
    @Attribute private var position: CGPoint // 0x10
    @Attribute private var size: ViewSize // 0x14
    @Attribute private var transform: ViewTransform // 0x18
    private let parentID: ScrapeableID // 0x1c
    private let bridge: PreferenceBridge // 0x20
    private var links: _DynamicPropertyBuffer // 0x28
    private var features: CoreViewRepresentableFeatureBufferProxy // 0x38
    private var coordinator: Representable.Coordinator? // 0x48 (offset) / 0x4c (offset field)
    private var platformView: Representable.Host? // 0x50 (offset) / 0x50 (offset field)
    private var resetSeed: UInt32 // 0x58 (offset) / 0x54 (offset field)
    private let tracker: PropertyList.Tracker // 0x60 (offset) / 0x58 (offset field)
    
    init(
        view: Attribute<Representable>,
        environment: Attribute<EnvironmentValues>,
        transaction: Attribute<Transaction>,
        phase: Attribute<_GraphInputs.Phase>,
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        transform: Attribute<ViewTransform>,
        parentID: ScrapeableID,
        bridge: PreferenceBridge,
        links: _DynamicPropertyBuffer,
        features: CoreViewRepresentableFeatureBufferProxy,
        coordinator: Representable.Coordinator?,
        platformView: Representable.Host?,
        resetSeed: UInt32
    ) {
        self._view = view
        self._environment = environment
        self._transaction = transaction
        self._phase = phase
        self._position = position
        self._size = size
        self._transform = transform
        self.parentID = parentID
        self.bridge = bridge
        self.links = links
        self.features = features
        self.coordinator = coordinator
        self.platformView = platformView
        self.resetSeed = resetSeed
        self.tracker = PropertyList.Tracker()
    }
    
    typealias Value = ViewLeafView<Representable>
    
    var representedViewProvider: Representable.PlatformViewProvider? {
        // x20
        guard let platformView else {
            return nil
        }
        
        return unsafe unsafeBitCast(platformView.coreRepresentedViewProvider, to: Representable.PlatformViewProvider.self) // FIXME
    }
    
    mutating func updateValue() {
        // self -> x20 -> x22
        let graph = AnyAttribute.current!.graph
        let pattern: UInt
        if let platformView {
            pattern = UInt(bitPattern: ObjectIdentifier(platformView))
        } else {
            pattern = 0
        }
        
        Signpost.platformUpdate.traceInterval(object: platformView, "PlatformUpdate: (%p) %{public}@ [ %p ]", [UInt(bitPattern: ObjectIdentifier(graph)), "\(Representable.self)", pattern]) { 
            // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_
            // self -> x0 -> x28
            // <+1124>
            
            // x29 - 0x148 / x19
            var (view, viewChanged) = $view.valueAndFlags(options: [])
            // w21 -> x29 - 0x140 / x29 - 0x1a0
            let (phase, phaseChanged) = $phase.valueAndFlags(options: [])
            // x20 (x29 - 0x170), x24 / x29 - 0x1b0
            var (environment, environmentChanged) = $environment.valueAndFlags(options: [])
            
            if phase.resetSeed != self.resetSeed {
                // <+1348>
                links.reset()
                resetPlatformView()
            }
            
            // <+1404>
            // x20
            let leafView: UnsafePointer<ViewLeafView<Representable>>? = unsafe Graph.outputValue()
            // x29 - 0x278
            let hasLeafView = unsafe (leafView != nil)
            
            let updated = unsafe withUnsafePointer(to: &view) { pointer in
                // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_SbSpyxGXEfU_TA
                return unsafe links.update(container: UnsafeMutableRawPointer(mutating: pointer), phase: phase)
            }
            
            // x29 - 0x200
            var modified = true
            if !updated {
                // <+1572>
                if hasLeafView, !viewChanged.contains(.changed), !phaseChanged.contains(.changed) {
                    // <+1588>
                    modified = Graph.currentAttributeWasModified
                } else {
                    // <+1616>
                }
            } else {
                // <+1628>
            }
            
            // environment -> x29 - 0x170 -> x20
            // <+1644>
            // x29 - 0xa8
            let transaction = Graph.withoutUpdate { 
                // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_AA11TransactionVyXEfU0_
                /*
                 self -> x0 -> x28
                 view -> x1 -> x29 - 0x88
                 */
                // <+416>
                if self.coordinator == nil {
                    // <+500>
                    let unchecked = MainActor.assumeIsolated { [unchecked =  UncheckedSendable(view)] in
                        return UncheckedSendable(unchecked.value.makeCoordinator())
                    }
                    
                    self.coordinator = unchecked.value
                }
                
                // <+656>
                return self.transaction
            }
            
            // <+1696>
            /*
             transaction -> x29 - 0xa8 -> x25
             environment -> x20/x24 -> x29 - 0x70/x29 - 0x68
             */
            environment.preferenceBridge = self.bridge
            
            // <+1800>
            // x29 - 0x160
            let coordinator = UncheckedSendable(self.coordinator)
            // x27
            let platformView = self.platformView
            /*
             transaction -> x25 -> x29 - 0x198
             self -> x28 -> x29 - 0x168
             */
            // x29 - 0x190
            let bridge = self.bridge
            
            // x29 - 0x158
            let context: PlatformViewRepresentableContext<Representable>
            
            if let platformView {
                // <+1948>
                if environmentChanged == .changed {
                    // <+1972>
                    if tracker.hasDifferentUsedValues(environment.plist) {
                        // <+2028>
                        tracker.reset()
                        modified = true
                    }
                    
                    // <+2064>
                } else {
                    // <+2128>
                }
                
                for feature in features.base {
                    feature.update(forHost: platformView, environment: &environment, isInitialUpdate: false)
                }
                
                // <+2324>
                /*
                 phaseChanged -> x29 - 0x1a0 -> x24
                 environment -> x29 - 0x70 -> x28
                 */
                // <+2376>
                // x26
                let tracker = self.tracker
                tracker.initializeValues(from: environment.plist)
                // <+2468>
                Graph.withoutUpdate {
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_yyXEfU1_
                    /*
                     phaseChanged -> w0
                     environmentChanged -> w1
                     hasLeafView -> w2
                     */
                    guard (phaseChanged == .changed || environmentChanged == .changed) && hasLeafView else {
                        return
                    }
                    
                    platformView.coreUpdateEnvironment(environment, viewPhase: ViewGraphHost.Phase(base: phase))
                }
                
                // <+2544>
                // x29 - 0x158
                context = MainActor.assumeIsolated { [unchecked = UncheckedSendable((bridge, transaction, environment))] in
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_AA0cD20RepresentableContextVyxGyScMYcXEfU2_Tm
                    return PlatformViewRepresentableContext<Representable>(
                        coordinator: coordinator.value!,
                        preferenceBridge: unchecked.value.0,
                        transaction: unchecked.value.1,
                        environmentStorage: .eager(unchecked.value.2)
                    )
                }
                
                if modified {
                    // <+2636>
                    // <+4312>
                } else {
                    // <+2668>
                    return
                }
            } else {
                // <+2076>
                tracker.reset()
                // <+2724>
                self.tracker.initializeValues(from: environment.plist)
                // <+2468>
                // x29 - 0x158
                context = MainActor.assumeIsolated { [unchecked = UncheckedSendable((bridge, transaction, environment))] in
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_AA0cD20RepresentableContextVyxGyScMYcXEfU2_Tm
                    return PlatformViewRepresentableContext<Representable>(
                        coordinator: coordinator.value!,
                        preferenceBridge: unchecked.value.0,
                        transaction: unchecked.value.1,
                        environmentStorage: .eager(unchecked.value.2)
                    )
                }
                
                let renderHost = ViewGraph.current.delegate as? ViewRendererHost
                let attribute = Attribute<ViewLeafView<Representable>>(identifier: .current!)
                
                let host: Representable.Host? = ObservationCenter.current._withObservation(attribute: attribute) { [features] in
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_TA
                    return Graph.withoutUpdate {
                        // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_AGyXEfU_
                        // x29 - 0x80
                        let contextValues = MainActor.assumeIsolated { [unchecked = UncheckedSendable((bridge, transaction, environment))] in
                            // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_AGyXEfU_AA17UncheckedSendableVyAA26RepresentableContextValuesVGyScMYcXEfU_Tm
                            let contextValues = RepresentableContextValues(
                                preferenceBridge: unchecked.value.0,
                                transaction: unchecked.value.1,
                                environmentStorage: .eager(unchecked.value.2)
                            )
                            return UncheckedSendable(contextValues)
                        }.value
                        
                        // <+276>
                        return contextValues.asCurrent { () -> Representable.Host? in
                            // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_AGyXEfU_AGyXEfU0_TA
                            // sp + 0x18
                            let host: Representable.Host = MainActor.assumeIsolated { [unchecked = UncheckedSendable((view, context, renderHost, environment))] () -> UncheckedSendable<Representable.Host> in
                                // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_AGyXEfU_AGyXEfU0_AA17UncheckedSendableVyAFGyScMYcXEfU_
                                let view = unchecked.value.0
                                let context = unchecked.value.1
                                let renderHost = unchecked.value.2
                                let environment = unchecked.value.3
                                // x27
                                let provider = view.makeViewProvider(context: context)
                                let host = unsafe Representable.Host(
                                    unsafeBitCast(provider, to: Representable.Host.Content.PlatformViewProvider.self), // FIXME
                                    host: renderHost,
                                    environment: environment,
                                    viewPhase: ViewGraphHost.Phase(base: phase)
                                )
                                return UncheckedSendable(host)
                            }.value
                            
                            for feature in features.base {
                                feature.update(forHost: host, environment: &environment, isInitialUpdate: true)
                            }
                            
                            return host
                        }
                    }
                }
                
                // <+4172>
                self.platformView = host
                // <+4312>
            }
            
            // <+4312>
            let delegate = ViewGraph.current.delegate as? ViewRendererHost
            // <+4456>
            let attribute = Attribute<ViewLeafView<Representable>>(identifier: .current!)
            ObservationCenter.current._withObservation(attribute: attribute) { 
                Graph.withoutUpdate {
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_yyXEfU5_yyXEfU_
                    /*
                     delegate -> x0/x1 -> x29 - 0x78/0x80
                     self -> x2 / x29 - 0x58
                     context -> x3 / x29 - 0x70
                     view -> x4 / x29 - 0x68
                     */
                    guard let representedViewProvider = self.representedViewProvider else {
                        return
                    }
                    
                    // <+340>
                    // delegate -> x23
                    let block = { [unchecked = UncheckedSendable((view, context, representedViewProvider))] in
                        // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_yyXEfU5_yyXEfU_yyXEfU_
                        // x29 - 0x80 -> x29 - 0x100
                        let values = MainActor.assumeIsolated { [unchecked = UncheckedSendable((bridge, transaction, environment))] in
                            // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_4HostQzSgyXEfU4_AGyXEfU_AA17UncheckedSendableVyAA26RepresentableContextValuesVGyScMYcXEfU_Tm
                            let values = RepresentableContextValues(
                                preferenceBridge: unchecked.value.0,
                                transaction: unchecked.value.1,
                                environmentStorage: .eager(unchecked.value.2)
                            )
                            
                            return UncheckedSendable(values)
                        }
                        
                        // <+316>
                        values.value.asCurrent {
                            unchecked.value.0.updateViewProvider(unchecked.value.2, context: unchecked.value.1)
                        }
                    }
                    
                    if let delegate {
                        Update.ensure { 
                            delegate.performExternalUpdate { 
                                block()
                            }
                        }
                    } else {
                        // <+520>
                        block()
                    }
                }
            }
            
            // <+5600>
            let newView = MainActor.assumeIsolated { [unchecked = UncheckedSendable((view, self, context))] in
                return ViewLeafView(content: unchecked.value.0, platformView: unchecked.value.1.platformView!, coordinator: unchecked.value.2.coordinator)
            }
            self.value = newView
        }
    }
    
    func resetPlatformView() {
        assertUnimplemented()
    }
    
    mutating func destroy() {
        // self -> x20 -> x27
        // <+548>
        links.destroy()
        // <+556>
        if let coordinator, let representedViewProvider {
            // <+632>
            Update.syncMain { [u0 = UncheckedSendable(representedViewProvider), u1 = UncheckedSendable(coordinator)] in
                Representable.dismantleViewProvider(u0.value, coordinator: u1.value)
            }
            
            self.reset()
        }
        
        // <+1260>
        bridge.invalidate()
        features.base.destroy()
    }
    
    fileprivate mutating func reset() {
        self.coordinator = nil
        self.platformView = nil
    }
    
    static func willRemove(attribute: AnyAttribute) {
        // x19
        let bridge = unsafe attribute
            .info
            .body
            .assumingMemoryBound(to: self)
            .pointee
            .bridge
        // x21
        let children = unsafe bridge.children
        
        guard unsafe !children.isEmpty else {
            return
        }
        
        for child in children {
            assertUnimplemented()
        }
    }
    
    static func willInvalidate(attribute: AnyAttribute) {
        let bridge = attribute
            .info
            .body
            .assumingMemoryBound(to: self)
            .pointee
            .bridge
       
        bridge.invalidate()
    }
    
    static func didReinsert(attribute: AnyAttribute) {
        assertUnimplemented()
    }
}

@_spi(Internal) public struct ViewLeafView<Representable : CoreViewRepresentable>: UnaryView, PrimitiveView, @preconcurrency PlatformViewFactory {
    let content: Representable
    package let platformView: Representable.Host
    private var coordinator: Representable.Coordinator
    
    init(content: Representable, platformView: Representable.Host, coordinator: Representable.Coordinator) {
        self.content = content
        self.platformView = platformView
        self.coordinator = coordinator
    }
    
    package var representedViewProvider: Representable.PlatformViewProvider {
        return unsafe unsafeBitCast(platformView.coreRepresentedViewProvider, to: Representable.PlatformViewProvider.self)
    }
    
    func makePlatformView() -> AnyObject? {
        return platformView
    }
    
    func updatePlatformView(_ platformView: inout AnyObject) {
        platformView = self.platformView
    }
    
    func renderPlatformView(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        assertUnimplemented()
    }
    
    var capabilities: DisplayList.PlatformViewCapabilities {
        assertUnimplemented()
    }
    
    func sizeThatFits(in proposedSize: _ProposedSize, environment: Attribute<EnvironmentValues>, context: AnyRuleContext) -> CGSize {
        /*
         proposedSize -> x0
         environment -> x1 -> x21
         context -> x2 -> x19
         */
        // sp + 0x20
        var result = CGSize.zero
        
        Update.syncMain {
            // $s7SwiftUI08ViewLeafC0V12sizeThatFits2in11environment7contextSo6CGSizeVAA13_ProposedSizeV_14AttributeGraph0N0VyAA17EnvironmentValuesVGAL14AnyRuleContextVtFyyXEfU_
            /*
             result pointer -> x7 -> x29 - 0x98
             self -> x0 -> x20
             environment -> x1 -> x22
             context -> x2 -> x21
             proposedSize -> x3/w4/x5/w6 -> x27/w25/x24/w23
             */
            // <+128>
            // x19
            let context = MainActor.assumeIsolated { 
                // $s7SwiftUI08ViewLeafC0V12sizeThatFits2in11environment7contextSo6CGSizeVAA13_ProposedSizeV_14AttributeGraph0N0VyAA17EnvironmentValuesVGAL14AnyRuleContextVtFyyXEfU_AA08Platformc13RepresentableT0VyxGyScMYcXEfU_
                return PlatformViewRepresentableContext<Representable>(
                    coordinator: self.coordinator,
                    preferenceBridge: nil,
                    transaction: Transaction(),
                    environmentStorage: .lazy(environment, context)
                )
            }
            
            let size = MainActor.assumeIsolated {
                // $s7SwiftUI08ViewLeafC0V12sizeThatFits2in11environment7contextSo6CGSizeVAA13_ProposedSizeV_14AttributeGraph0N0VyAA17EnvironmentValuesVGAL14AnyRuleContextVtFyyXEfU_AISgyScMYcXEfU0_
                return content.sizeThatFits(ProposedViewSize(proposedSize), provider: self.representedViewProvider, context: context)
            }
            
            if let size {
                // <+280>
                result = size
            } else {
                var result2: CGSize
                if Semantics.UnifiedLayout.isEnabled {
                    result2 = self.unifiedLayoutSize(in: proposedSize)
                } else {
                    // <+296>
                    // x29 - 0x90
                    let traits = self.layoutTraits()
                    result2 = proposedSize
                        .fixingUnspecifiedDimensions(at: traits.idealSize)
                        .clamped(to: traits)
                }
                
                MainActor.assumeIsolated {
                    // $s7SwiftUI08ViewLeafC0V12sizeThatFits2in11environment7contextSo6CGSizeVAA13_ProposedSizeV_14AttributeGraph0N0VyAA17EnvironmentValuesVGAL14AnyRuleContextVtFyyXEfU_yyScMYcXEfU1_
                    content.overrideSizeThatFits(&result2, in: ProposedViewSize(proposedSize), platformView: self.representedViewProvider)
                }
                
                result = result2
            }
        }
        
        return result
    }
    
    fileprivate func unifiedLayoutSize(in proposedSize: _ProposedSize) -> CGSize {
        // self -> x20
        // proposedSize -> x0 -> x24/w22/x23/w21
        var d0: CGFloat
        var d1: CGFloat
        if let width = proposedSize.width, let height = proposedSize.height {
            d0 = width
            d1 = height
        } else {
            let traits = self.layoutTraits()
            d0 = traits.idealSize.width
            d1 = traits.idealSize.height
            
            if let width = proposedSize.width {
                d0 = width
            }
            
            if let height = proposedSize.height {
                d1 = height
            }
        }
        
        // <+120>
        let d10: CGFloat = 50_000
        let d8 = (d0 > d10) ? d10 : d0
        let d9 = (d1 > d10) ? d10 : d1
        let w21: Int8
        do {
            let w8: Int8 = ((d8 == 0) || (proposedSize.width == nil)) ? 1 : 0
            let w9: Int8 = (w8 == 1) ? 3 : 2
            w21 = ((d9 == 0) || (proposedSize.height == nil)) ? w9 : w8
        }
        
        // <+180>
        do {
            let size = platformView.coreLayoutSizeThatFits(CGSize(width: d8, height: d9), fixedAxes: Axis.Set(rawValue: w21))
            d0 = size.width
            d1 = size.height
        }
        
        // <+304>
        let d2 = CGFloat.infinity
        d0 = ((d0 == d10) && (d8 == d10)) ? d2 : d0
        d1 = ((d1 == d10) && (d9 == d10)) ? d2 : d1
        return CGSize(width: d0, height: d1)
    }
    
    func layoutTraits() -> _LayoutTraits {
        return Graph.withoutUpdate {
            // $s7SwiftUI08ViewLeafC0V12layoutTraitsAA07_LayoutF0VyFAFyXEfU_
            var traits = platformView.coreLayoutTraits()
            let block: @MainActor () -> _LayoutTraits = {
                // $s7SwiftUI08ViewLeafC0V12layoutTraitsAA07_LayoutF0VyFAFyXEfU_yyScMYcXEfU_
                self.content.overrideLayoutTraits(&traits, for: self.representedViewProvider)
                return traits
            }
            
            return block()
        }
    }
    
    nonisolated func depthThatFits(in proposedSize: _ProposedSize3D) -> CGFloat {
        var depth: CGFloat = 0
        let exec: @MainActor () -> CGFloat = {
            // $s7SwiftUI08ViewLeafC0V13depthThatFits2in12CoreGraphics7CGFloatVAA15_ProposedSize3DV_tFyyXEfU_AHyScMYcXEfU_
            return content.depthThatFits(proposedSize, provider: representedViewProvider)
        }
        
        Update.syncMain {
            depth = exec()
        }
        
        return depth
    }
    
    package var viewType: Any.Type {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeView(view: _GraphValue<ViewLeafView<Representable>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - 0xf4
         inputs -> x1 -> x24
         return register -> x8 -> x28
         */
        var outputs = _ViewOutputs()
        // x29 - 0x118 (sp + 0x48)
        let copy_1 = inputs
        // <+152>
        if unsafe inputs.preferences.contains(DisplayList.Key.self) {
            // <+196>
            // x29 - 0x158
            let identity: _DisplayList_Identity
            if !inputs.base.options.contains(.needsStableDisplayListIDs) {
                // <+240>
                identity = _DisplayList_Identity()
                // <+280>
            } else {
                // <+1348>
                let weakAttribute = copy_1[_DisplayList_StableIdentityScope.self]
                let attribute = weakAttribute.attribute!
                identity = attribute.value.pushIdentity()
                // <+280>
            }
            
            // <+280>
            // x29 - 0xb8 (sp + 0xa8)
            let copy_2 = copy_1
            
            // x29 - 0xb8 (sp + 0xa8)
            let platformDisplayList = PlatformViewDisplayList<Representable>(
                identity: identity,
                view: view.value,
                position: copy_2.animatedPosition(),
                containerPosition: inputs.containerPosition,
                size: copy_2.animatedSize(), // <+580>
                transform: inputs.transform,
                _environment: copy_2.environment,
                safeAreaInsets: inputs.safeAreaInsets,
                contentSeed: DisplayList.Seed()
            )
            // x29 - 0xd0 (sp + 0x90)
            let platformDisplayListAttribute = Attribute(platformDisplayList)
            unsafe outputs.preferences.appendPreference(key: DisplayList.Key.self, value: platformDisplayListAttribute)
            
            // <+788>
        }
        
        // <+804>
        if inputs.base.options.contains(.viewRequestsLayoutComputer) {
            // <+812>
            let environment = LeafLayoutEnvironment(environment: inputs.environment, tracker: PropertyList.Tracker())
            // w24
            let environmentAttribute = Attribute(environment)
            
            let layoutComputer = InvalidatableLeafLayoutComputer(_view: view.value, environment: environmentAttribute, viewGraph: .current)
            let layoutAttribute = Attribute(layoutComputer)
            outputs.layoutComputer = layoutAttribute
        }
        
        // <+1292>
        return outputs
    }
}

fileprivate struct PlatformViewDisplayList<Representable : CoreViewRepresentable>: StatefulRule {
    let identity: _DisplayList_Identity // 0x0
    @Attribute private(set) var view: ViewLeafView<Representable> // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var containerPosition: CGPoint // 0xc
    @Attribute private(set) var size: ViewSize // 0x10
    @Attribute private(set) var transform: ViewTransform // 0x14
    private(set) var _environment: Attribute<EnvironmentValues> // 0x18
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets? // 0x1c
    private(set) var contentSeed: DisplayList.Seed // 0x20
    
    var environment: EnvironmentValues {
        return _environment.value
    }
    
    typealias Value = DisplayList
    
    mutating func updateValue() {
        // self -> x20 -> x26
        // x22
        let newVersion = DisplayList.Version(forUpdate: ())
        // x27/x28, w21
        let view = $view.changedValue(options: [])
        if view.changed {
            // <+312>
            self.contentSeed = DisplayList.Seed(newVersion)
        }
        
        // <+344>
        var d8: CGFloat
        var d9: CGFloat
        do {
            let position = self.position
            d8 = position.x
            d9 = position.y
        }
        
        var d0: CGFloat
        var d1: CGFloat
        do {
            let containerPosition = self.containerPosition
            d0 = containerPosition.x
            d1 = containerPosition.y
        }
        
        var d10 = d8 - d0
        d8 = d9 - d1
        
        var d15: CGFloat
        var d11: CGFloat
        do {
            let size = self.size
            d15 = size.width
            d11 = size.height
        }
        
        // <+432>
        let options: CoreViewRepresentableLayoutOptions = MainActor.assumeIsolated {
            // $s7SwiftUI23PlatformViewDisplayList33_6401BBC0F2663213443101ED0E1CE437LLV11updateValueyyFAA04CoreD26RepresentableLayoutOptionsVyScMYcXEfU_
            let provider = view.value.representedViewProvider
            return Representable.layoutOptions(provider)
        }
        
        // <+496>
        if options.contains(.propagatesSafeArea) {
            // <+516>
            let context = AnyRuleContext(attribute: .current!)
            let x190x8 = d11
            let x190x10 = d10
            let x190x18 = d8
            
            var d14: CGFloat = 0
            d10 = 0
            d9 = 0
            d11 = 0
            if let safeAreaInsetsAttribute = $safeAreaInsets {
                // x19 + 0xe0, x19 + 0xf0
                let safeAreaInsets = context.changedValue(of: safeAreaInsetsAttribute, options: [])
                // x29 - 0x100
                let placementContext = _PositionAwarePlacementContext(
                    context: context,
                    owner: context.attribute,
                    size: $size,
                    environment: _environment,
                    transform: $transform,
                    position: $position,
                    safeAreaInsets: OptionalAttribute(safeAreaInsetsAttribute)
                )
                
                let resolved = safeAreaInsets.value.resolve(regions: .all, cornerAdaptation: [], in: placementContext)
                d14 = resolved.top
                d10 = resolved.leading
                d9 = resolved.bottom
                d11 = resolved.trailing
            }
            
            // <+688>
            // x29 - 0x100
            // w23
            let layoutDirection = environment.layoutDirection
            
            let d12 = (layoutDirection == .rightToLeft) ? d10 : d11
            let d13 = (layoutDirection == .rightToLeft) ? d11 : d10
            
            d1 = x190x10
            d8 = x190x18
            
            d1 = d1 - d13
            d8 = d8 - d14
            d0 = d10 + d11
            d10 = d1
            d1 = d14 + d9
            d15 = d15 + d0
            d11 = x190x8
            d11 = d11 + d1
            
            // <+840>
            d0 = d14
            d1 = d13
            let d2 = d9
            let d3 = d12
            
            view.value.platformView.coreUpdateSafeAreaInsets(
                EdgeInsets(top: d0, leading: d1, bottom: d2, trailing: d3)
            )
            // <+968>
        }
        
        // <+968>
        // x19 + 0xe0
        var item = DisplayList.Item(
            .content(DisplayList.Content(.platformView(view.value), seed: contentSeed)),
            frame: CGRect(x: d10, y: d8, width: d15, height: d11),
            identity: identity,
            version: newVersion
        )
        
        // <+1084>
        item.canonicalize(options: .defaultValue)
        // x29 - 0x100
        let copy_1 = item
        
        switch copy_1.value {
        case .content(let content):
            // <+1560>
            switch content.value {
            case .platformView(let _):
                // <+2444>
                // <+2184>
                break
            default:
                assertUnimplemented()
            }
        case .effect(let _, let _):
            // <+1272>
            assertUnimplemented()
        case .states(let _):
            // <+1672>
            assertUnimplemented()
        case .empty:
            // <+1132>
            // <+2176>
            break
        }
        
        // <+2176>
        // <+2184>
        self.value = DisplayList(item)
    }
}

fileprivate struct LeafLayoutEnvironment : StatefulRule {
    @Attribute var environment: EnvironmentValues
    let tracker: PropertyList.Tracker
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate struct InvalidatableLeafLayoutComputer<Representable : CoreViewRepresentable>: StatefulRule, CustomStringConvertible {
    private(set) var _view: Attribute<ViewLeafView<Representable>>
    @Attribute private(set) var environment: EnvironmentValues
    private(set) weak var viewGraph: ViewGraph?
    
    var view: ViewLeafView<Representable> {
        return _view.value
    }
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        // self -> x20 -> x19 + 0x38
        // <+204>
        // x19 + 0x180
        if self.view.platformView.coreLayoutInvalidator == nil {
            self.view.platformView.coreLayoutInvalidator = ViewGraphHost.LayoutInvalidator(
                viewGraph: viewGraph,
                layoutComputer: WeakAttribute<LayoutComputer>(Attribute(identifier: .current!))
            )
        }
        
        // <+600>
        let engine = PlatformViewLayoutEngine(
            cache: ViewSizeCache(),
            view: view,
            environment: $environment,
            context: AnyRuleContext(attribute: .current!),
            depthCache: Cache3()
        )
        
        update(to: engine)
    }
}

fileprivate struct PlatformViewLayoutEngine<Representable : CoreViewRepresentable>: LayoutEngine {
    private var cache: ViewSizeCache
    private var view: ViewLeafView<Representable>
    private var environment: Attribute<EnvironmentValues>
    private var context: AnyRuleContext
    private var depthCache: Cache3<_ProposedSize3D, CGFloat>
    
    init(cache: ViewSizeCache, view: ViewLeafView<Representable>, environment: Attribute<EnvironmentValues>, context: AnyRuleContext, depthCache: Cache3<_ProposedSize3D, CGFloat>) {
        self.cache = cache
        self.view = view
        self.environment = environment
        self.context = context
        self.depthCache = depthCache
    }
    
    func spacing() -> Spacing {
        return Spacing()
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        // defer 있음
        /*
         self -> x20 -> x19
         proposedSize -> x0 -> x20
         */
        // x29 - 0x128
        let _ = proposedSize
        // x29 - 0xa0
        let layoutInvalidtor = view.platformView.coreLayoutInvalidator
        view.platformView.coreLayoutInvalidator = nil
        
        defer {
            view.platformView.coreLayoutInvalidator = layoutInvalidtor
        }
        
        return cache.get(proposedSize) {
            return view.sizeThatFits(in: proposedSize, environment: environment, context: context)
        }
    }
    
    func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        if alignmentKey == VerticalAlignment.firstTextBaseline.key {
            // <+88>
            assertUnimplemented()
        } else if alignmentKey == VerticalAlignment.lastTextBaseline.key {
            // <+248>
            assertUnimplemented()
        } else {
            // <+596>
            return nil
        }
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        return depthCache.get(proposedSize) {
            return view.depthThatFits(in: proposedSize)
        }
    }
}

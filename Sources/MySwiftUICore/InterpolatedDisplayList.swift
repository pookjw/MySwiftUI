// 7377A3587909D054D379011E12826F37
internal import AttributeGraph
private import CoreGraphics

protocol InterpolatableContent {
    static var defaultTransition: ContentTransition { get }
    func requiresTransition(to other: Self) -> Bool
    var appliesTransitionsForSizeChanges: Bool { get }
    var addsDrawingGroup: Bool { get }
    func modifyTransition(state: inout ContentTransition.State, to other: Self)
    func defaultAnimation(to other: Self) -> Animation?
}

extension InterpolatableContent {
    static var defaultTransition: ContentTransition {
        assertUnimplemented()
    }
    
    func defaultAnimation(to other: Self) -> Animation? {
        assertUnimplemented()
    }
}

extension InterpolatableContent where Self : Equatable {
    func requiresTransition(to other: Self) -> Bool {
        assertUnimplemented()
    }
    
    var appliesTransitionsForSizeChanges: Bool {
        assertUnimplemented()
    }
    
    var addsDrawingGroup: Bool {
        assertUnimplemented()
    }
}


extension _ViewOutputs {
    @inline(always) // 원래 없음
    mutating func interpolateDisplayList<T : InterpolatableContent>(
        group: DisplayList.InterpolatorGroup,
        content: Attribute<T>,
        inputs: _ViewInputs
    ) {
        guard let list = self.preferences[DisplayList.Key.self] else {
            return
        }
        
        let interpolated = InterpolatedDisplayList(
            group: group,
            content: content,
            position: inputs.position,
            animatedPosition: inputs.animatedPosition(),
            containerPosition: inputs.containerPosition,
            size: inputs.size.cgSize(),
            phase: inputs.viewPhase,
            time: inputs.time,
            transaction: inputs.transaction,
            environment: inputs.environment,
            pixelLength: inputs.base.pixelLength,
            list: OptionalAttribute(list),
            animatesSize: false,
            defersRender: false,
            supportsVFD: inputs.base.options.contains(.supportsVariableFrameDuration),
            lastContent: nil,
            lastSize: .zero,
            resetSeed: 0,
            contentVersion: DisplayList.Version()
        )
        
        let newList = Attribute(interpolated)
        newList.flags = [.unknown0]
        
        self.preferences[DisplayList.Key.self] = newList
    }
}

fileprivate struct InterpolatedDisplayList<T : InterpolatableContent> : AsyncAttribute, StatefulRule {
    private let group: DisplayList.InterpolatorGroup // 0x0
    @Attribute private var content: T // 0x8
    @Attribute private var position: CGPoint // 0xc
    @Attribute private var animatedPosition: CGPoint // 0x10
    @Attribute private var containerPosition: CGPoint // 0x14
    @Attribute private var size: CGSize // 0x18
    @Attribute private var phase: _GraphInputs.Phase // 0x1c
    @Attribute private var time: Time // 0x20
    @Attribute private var transaction: Transaction // 0x24
    @Attribute private var environment: EnvironmentValues // 0x28
    @Attribute private var pixelLength: CGFloat // 0x2c
    @OptionalAttribute private var list: DisplayList? // 0x30
    private let animatesSize: Bool // 0x34
    private let defersRender: Bool // 0x35
    private let supportsVFD: Bool // 0x36
    private var lastContent: T? // 0x5c (offset field)
    private var lastSize: CGSize // 0x60 (offset field)
    private var resetSeed: UInt32 // 0x64 (offset field)
    private var contentVersion: DisplayList.Version // 0x68 (offset field)
    
    init(
        group: DisplayList.InterpolatorGroup,
        content: Attribute<T>,
        position: Attribute<CGPoint>,
        animatedPosition: Attribute<CGPoint>,
        containerPosition: Attribute<CGPoint>,
        size: Attribute<CGSize>,
        phase: Attribute<_GraphInputs.Phase>,
        time: Attribute<Time>,
        transaction: Attribute<Transaction>,
        environment: Attribute<EnvironmentValues>,
        pixelLength: Attribute<CGFloat>,
        list: OptionalAttribute<DisplayList>,
        animatesSize: Bool,
        defersRender: Bool,
        supportsVFD: Bool,
        lastContent: T?,
        lastSize: CGSize,
        resetSeed: UInt32,
        contentVersion: DisplayList.Version
    ) {
        self.group = group
        self._content = content
        self._position = position
        self._animatedPosition = animatedPosition
        self._containerPosition = containerPosition
        self._size = size
        self._phase = phase
        self._time = time
        self._transaction = transaction
        self._environment = environment
        self._pixelLength = pixelLength
        self._list = list
        self.animatesSize = animatesSize
        self.defersRender = defersRender
        self.supportsVFD = supportsVFD
        self.lastContent = lastContent
        self.lastSize = lastSize
        self.resetSeed = resetSeed
        self.contentVersion = contentVersion
    }
    
    typealias Value = DisplayList
    
    mutating func updateValue() {
        // <+248>
        if self.phase.resetSeed != self.resetSeed {
            self.resetSeed = self.phase.resetSeed
            self.lastContent = nil
            self.contentVersion = DisplayList.Version()
            self.group.reset()
        }
        
        // <+388>
        // x19 + 0x60
        let (content, contentChanged) = self.$content.changedValue(options: [])
        // d8, d9
        let size = self.size
        let environment = self.environment
        // x29 - 0xc8
        var transitionState = environment[ContentTransition.State.self]
        
        // <+732>
        let version = DisplayList.Version(forUpdate: ())
        // x19 + 0x48
        let listener: AnimationListener?
        let animation: Animation?
        
        if let lastContent {
            // <+840>
            if (contentChanged && lastContent.requiresTransition(to: content)) || (lastContent.appliesTransitionsForSizeChanges && (self.lastSize.width != size.width || self.lastSize.height != size.height)) {
                // <+1580>
                var transaction: Transaction {
                    // $s7SwiftUI23InterpolatedDisplayList33_7377A3587909D054D379011E12826F37LLV11updateValueyyF11transactionL_AA11TransactionVvg
                    return Graph.withoutUpdate { 
                        // $s7SwiftUI23InterpolatedDisplayList33_7377A3587909D054D379011E12826F37LLV11updateValueyyF11transactionL_AA11TransactionVvgAHyXEfU_
                        return self.transaction
                    }
                }
                
                if transaction.disablesContentTransitions {
                    // <+996>
                    if self.lastContent == nil {
                        self.contentVersion = version
                    }
                    
                    listener = nil
                    animation = nil
                    transitionState.animation = nil
                    // <+1104>
                } else {
                    // <+2440>
                    self.contentVersion = version
                    
                    // <+2472>
                    if case .named(let transition) = transitionState.transition.storage {
                        if case .default = transition.name {
                            // <+2508>
                            transitionState.transition = T.defaultTransition
                            transitionState.transition.isReplaceable = true
                            // <+2592>
                        } else {
                            // <+2612>
                        }
                    } else {
                        // <+2648>
                    }
                    
                    // <+2648>
                    if
                        case .named(let transition) = transitionState.transition.storage,
                        case .identity = transition.name
                    {
                        // <+2692>
                    } else {
                        // <+2648>
                        lastContent.modifyTransition(state: &transitionState, to: content)
                    }
                    
                    if
                        case .named(let transition) = transitionState.transition.storage,
                        case .identity = transition.name
                    {
                        // <+2792>
                        listener = nil
                        transitionState.animation = nil
                    } else {
                        // <+2720>
                        if self.hasValue {
                            // <+2736>
                            if transitionState.animation != nil {
                                // <+2744>
                            } else {
                                // <+2852>
                                if let animation = transaction.animation {
                                    transitionState.animation = animation
                                    // <+2744>
                                } else {
                                    // <+2920>
                                    transitionState.animation = lastContent.defaultAnimation(to: content)
                                }
                            }
                            
                            listener = (transitionState.animation != nil) ? transaction.combinedAnimationListener : nil
                        } else {
                            // <+2792>
                            listener = nil
                            transitionState.animation = nil
                        }
                    }
                    
                    animation = transitionState.animation
                    transitionState.transition.applyEnvironmentValues(
                        style: transitionState.style,
                        layoutDirection: environment.layoutDirection
                    )
                    
                    // <+1104>
                }
            } else {
                // <+996>
                if self.lastContent == nil {
                    self.contentVersion = version
                }
                
                listener = nil
                animation = nil
                transitionState.animation = nil
                // <+1104>
            }
        } else {
            // <+996>
            if self.lastContent == nil {
                self.contentVersion = version
            }
            
            listener = nil
            animation = nil
            transitionState.animation = nil
            // <+1104>
        }
        
        // <+1104>
        self.lastContent = content
        self.lastSize = size
        
        // <+1176>
        // x19 + 0x80
        var options = RasterizationOptions(
            colorMode: .nonLinear,
            allowedDynamicRange: nil,
            flags: .defaultFlags
        )
        
        options.flags.subtract(.requiresLayer)
        
        if transitionState.options.contains(.addsDrawingGroup) {
            options.flags.formUnion(.isAccelerated)
        }
        
        if content.addsDrawingGroup {
            options.flags.formUnion(.isAccelerated)
        }
        
        // <+1284>
        let d14: CGFloat = 1.0
        
        self.group.update(
            contentSeed: DisplayList.Seed(self.contentVersion),
            transition: transitionState.transition,
            animation: animation,
            listener: listener,
            contentsScale: Float(d14 / self.pixelLength),
            rasterizationOptions: options,
            supportsVFD: self.supportsVFD
        )
        
        // <+1412>
        var d8: CGFloat
        var d9: CGFloat
        do {
            let animatedPosition = self.animatedPosition
            let containerPosition = self.containerPosition
            d8 = animatedPosition.x - containerPosition.x
            d9 = animatedPosition.y - containerPosition.y
        }
        
        var d10: CGFloat = 0
        var d11: CGFloat = 0
        var d12 = d8
        var d13 = d9
        
        if self.animatesSize {
            // <+1724>
        } else {
            // <+1500>
            let position = self.position
            d10 = position.x
            d11 = position.y
            
            var d0 = self.pixelLength
            var d1 = d0 * 0.5
            var d2 = d10 + d1
            
            if d0 != d14 {
                // <+1660>
                d2 = d2 / d0
                d2 = floor(d2)
                d10 = d0 * d2
                d1 = d11 + d1
                d1 = d1 / d0
                d1 = floor(d1)
                d11 = d0 * d1
                // <+1688>
            } else {
                d10 = floor(d2)
                d0 = d11 + d1
                d11 = floor(d0)
                // <+1688>
            }
            
            // <+1688>
            let containerPosition = self.containerPosition
            d0 = containerPosition.x
            d1 = containerPosition.y
            d12 = d10 - d0
            d13 = d11 - d1
            d10 = d12 - d8
            d11 = d13 - d9
            // <+1724>
        }
        
        // <+1724>
        var list: DisplayList
        
        if let _list = self.list {
            list = _list
            
            if self.defersRender {
                // <+1884>
                if self.defersRender {
                    list = DisplayList(
                        DisplayList.Item(
                            .effect(
                                .interpolatorRoot(
                                    self.group,
                                    contentOrigin: CGPoint(x: d12, y: d13),
                                    SwiftOffset: CGSize(width: d10, height: d11)
                                ),
                                list
                            ),
                            frame: .zero,
                            identity: .none,
                            version: version
                        )
                    )
                } else {
                    // <+2204>
                }
            } else if list.features.contains(.interpolatorLayers) {
                // <+1780>
                list.transform { item in
                    assertUnimplemented()
                }
                
                // <+2204>
            } else {
                // <+2204>
            }
        } else {
            // <+1848>
            list = DisplayList()
            
            // <+1884>
            if self.defersRender {
                list = DisplayList(
                    DisplayList.Item(
                        .effect(
                            .interpolatorRoot(
                                self.group,
                                contentOrigin: CGPoint(x: d12, y: d13),
                                SwiftOffset: CGSize(width: d10, height: d11)
                            ),
                            list
                        ),
                        frame: .zero,
                        identity: .none,
                        version: version
                    )
                )
            } else {
                // <+2204>
            }
        }
        
        // <+2204>
        list.translate(by: CGSize(width: d8, height: d9), version: version)
        self.value = list
    }
}

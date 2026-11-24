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
        let transitionState = environment[ContentTransition.State.self]
        
        // <+732>
        let version = DisplayList.Version(forUpdate: ())
        
        if let lastContent {
            // <+840>
            if (contentChanged && lastContent.requiresTransition(to: content)) || (lastContent.appliesTransitionsForSizeChanges && (self.lastSize.width != size.width || self.lastSize.height != size.height)) {
                // <+1580>
                var transaction: Transaction {
                    // $s7SwiftUI23InterpolatedDisplayList33_7377A3587909D054D379011E12826F37LLV11updateValueyyF11transactionL_AA11TransactionVvg
                    assertUnimplemented()
                }
                
                if transaction.disablesContentTransitions {
                    // <+996>
                } else {
                    // <+2440>
                    self.contentVersion = version
                    
                    // <+2472>
                    if
                        case .named(let transition) = transitionState.transition.storage,
                        case .numericText(let configuration) = transition.name
                    {
                        assertUnimplemented()
                    }
                    
                    // <+2648>
                    assertUnimplemented()
                }
            } else {
                // <+996>
            }
        } else {
            // <+996>
        }
        
        // <+996>
        assertUnimplemented()
    }
}

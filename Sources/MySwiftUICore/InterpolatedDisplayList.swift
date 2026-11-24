// 7377A3587909D054D379011E12826F37
internal import AttributeGraph
private import CoreGraphics

extension _ViewOutputs {
    @inline(always) // 원래 없음
    mutating func interpolateDisplayList<T>(
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

fileprivate struct InterpolatedDisplayList<T> : AsyncAttribute, StatefulRule {
    private let group: DisplayList.InterpolatorGroup
    @Attribute private var content: T
    @Attribute private var position: CGPoint
    @Attribute private var animatedPosition: CGPoint
    @Attribute private var containerPosition: CGPoint
    @Attribute private var size: CGSize
    @Attribute private var phase: _GraphInputs.Phase
    @Attribute private var time: Time
    @Attribute private var transaction: Transaction
    @Attribute private var environment: EnvironmentValues
    @Attribute private var pixelLength: CGFloat
    @OptionalAttribute private var list: DisplayList?
    private let animatesSize: Bool
    private let defersRender: Bool
    private let supportsVFD: Bool
    private var lastContent: T?
    private var lastSize: CGSize
    private var resetSeed: UInt32
    private var contentVersion: DisplayList.Version
    
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
        assertUnimplemented()
    }
    
    typealias Value = DisplayList
    
    func updateValue() {
        assertUnimplemented()
    }
}

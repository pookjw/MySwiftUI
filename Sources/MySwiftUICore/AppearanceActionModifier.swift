// 3EDE22C3B37C9BBEF12EC9D1A4B340F3
internal import AttributeGraph

@frozen public struct _AppearanceActionModifier : ViewModifier {
    public nonisolated(unsafe) var appear: (() -> Void)?
    public nonisolated(unsafe) var disappear: (() -> Void)?
    
    @inlinable public nonisolated init(appear: (() -> Void)? = nil, disappear: (() -> Void)? = nil) {
        self.appear = appear
        self.disappear = disappear
    }
    
    public static nonisolated func _makeView(modifier: _GraphValue<_AppearanceActionModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         body -> x19/x20
         return register -> x21
         modifier -> w8
         */
        // sp
        let copy_1 = inputs
        // w23
        let phase = inputs.base.phase
        // sp + 0xa0
        let effect = AppearanceEffect(modifier: modifier.value, phase: phase)
        // x22
        let attribute = Attribute(effect)
        attribute.flags = [.unknown0, .unknown1]
        return body(_Graph(), copy_1)
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<_AppearanceActionModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        // x23
        var modifier = modifier.value
        
        if isLinkedOnOrAfter(.v3) {
            // <+180>
            let rule = _AppearanceActionModifier.MergedCallbacks(
                modifier: modifier,
                phase: inputs.base.phase,
                box: nil
            )
            
            // x23
            modifier = Attribute(rule)
        }
        
        // <+256>
        var outputs = body(_Graph(), inputs)
        outputs.multiModifier(_GraphValue(modifier), inputs: inputs)
        
        return outputs
    }
    
    public typealias Body = Never
}

extension _AppearanceActionModifier : Sendable {
}

extension View {
    @inlinable public nonisolated func onAppear(perform action: (() -> Void)? = nil) -> some View {
        return modifier(_AppearanceActionModifier(appear: action, disappear: nil))
    }
    
    @inlinable public nonisolated func onDisappear(perform action: (() -> Void)? = nil) -> some View {
        return modifier(_AppearanceActionModifier(appear: nil, disappear: action))
    }
}

struct AppearanceEffect: StatefulRule, RemovableAttribute {
    @Attribute private var modifier: _AppearanceActionModifier // 0x0
    @Attribute private var phase: _GraphInputs.Phase // 0x4
    private var lastValue: _AppearanceActionModifier? = nil // 0x8
    private var isVisible: Bool = false // 0x28
    private var isRemoved: Bool = false // 0x29
    private var resetSeed: UInt32 = 0 // 0x2c
    private var node = AnyOptionalAttribute(.empty) // 0x30
    
    init(modifier: Attribute<_AppearanceActionModifier>, phase: Attribute<_GraphInputs.Phase>) {
        self._modifier = modifier
        self._phase = phase
    }
    
    typealias Value = Void
    
    mutating func updateValue() {
        if node.attribute == nil {
            node = .current
        }
        
        // w21
        let resetSeed = resetSeed
        // w19
        let phaseAttribute = $phase
        
        if resetSeed != phaseAttribute.value.resetSeed {
            // <+100>
            self.resetSeed = phaseAttribute.value.resetSeed
            disappeared()
        }
        
        // <+136>
        lastValue = modifier
        
        if !isRemoved {
            appeared()
        }
    }
    
    func disappeared() {
        fatalError("TODO")
    }
    
    mutating func appeared() {
        guard !isVisible else {
            return
        }
        
        if let appear = lastValue?.appear {
            // <+40>
            Update.enqueueAction(reason: .onAppear) {
                appear()
            }
        }
        
        // <+172>
        isVisible = true
        
        // w20
        let removedState = GraphHost.currentHost.removedState
        guard removedState.contains(.unattached) else {
            return
        }
        
        // <+224>
        guard isLinkedOnOrAfter(.v6) else {
            return
        }
        
        // <+340>
        let attribute = AnyWeakAttribute(.current!)
        Update.enqueueAction(reason: nil) { 
            let loaded = attribute.attribute
            guard loaded != .empty else {
                return
            }
            AppearanceEffect.willRemove(attribute: loaded)
        }
    }
    
    static func willRemove(attribute: AnyAttribute) {
        let effect = attribute
            ._bodyPointer
            .assumingMemoryBound(to: AppearanceEffect.self)
        let mutable = UnsafeMutablePointer(mutating: effect)
        
        guard let lastValue = mutable.pointee.lastValue else {
            return
        }
        
        if let disappear = lastValue.disappear {
            Update.enqueueAction(reason: .onDisappear) { 
                disappear()
            }
        }
        
        mutable.pointee.isRemoved = false
    }
    
    static func didReinsert(attribute: AnyAttribute) {
        fatalError("TODO")
    }
}

extension _AppearanceActionModifier {
    fileprivate struct MergedCallbacks: StatefulRule {
        @Attribute var modifier: _AppearanceActionModifier
        @Attribute var phase: _GraphInputs.Phase
        var box: _AppearanceActionModifier.MergedBox?
        
        typealias Value = _AppearanceActionModifier
        
        static var initialValue: _AppearanceActionModifier? {
            return nil
        }
        
        func updateValue() {
            fatalError("TODO")
        }
    }
}

extension _AppearanceActionModifier {
    fileprivate class MergedBox {
        let resetSeed: UInt32
        var count: Int32
        var lastCount: Int32
        var base: _AppearanceActionModifier
        var pendingUpdate: Bool
        
        init(resetSeed: UInt32, count: Int32, lastCount: Int32, base: _AppearanceActionModifier, pendingUpdate: Bool) {
            self.resetSeed = resetSeed
            self.count = count
            self.lastCount = lastCount
            self.base = base
            self.pendingUpdate = pendingUpdate
        }
        
        func update() {
            fatalError("TODO")
        }
        
        deinit {
            fatalError("TODO")
        }
    }
}

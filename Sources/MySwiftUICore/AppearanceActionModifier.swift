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
    
    mutating func disappeared() {
        guard isVisible else {
            return
        }
        
        if let disappear = lastValue?.disappear {
            Update.enqueueAction(reason: .onDisappear, disappear)
        }
        
        isVisible = false
    }
    
    mutating func appeared() {
        guard !isVisible else {
            return
        }
        
        if let appear = lastValue?.appear {
            // <+40>
            Update.enqueueAction(reason: .onAppear, appear)
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
        UnsafeMutablePointer(mutating: effect).pointee.disappeared()
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
        
        mutating func updateValue() {
            let box: _AppearanceActionModifier.MergedBox
            if
                let _box = self.box,
                _box.resetSeed == phase.resetSeed
            {
                // <+192>
                box = _box
            } else {
                // <+116>
                let phase = phase
                box = _AppearanceActionModifier.MergedBox(
                    resetSeed: phase.resetSeed,
                    count: 0,
                    lastCount: 0,
                    base: _AppearanceActionModifier(appear: nil, disappear: nil),
                    pendingUpdate: false
                )
            }
            
            // <+192>
            let modifier = modifier
            box.base = modifier
            
            self.value = _AppearanceActionModifier(
                appear: {
                    guard box.count == 0 else {
                        box.count += 1
                        return
                    }
                    
                    guard !box.pendingUpdate else {
                        box.count = 1
                        return
                    }
                    
                    box.update()
                    box.count += 1
                },
                disappear: {
                    box.count -= 1
                    
                    guard box.count == 0 else {
                        return
                    }
                    
                    guard !box.pendingUpdate else {
                        return
                    }
                    
                    box.update()
                }
            )
        }
    }
}

extension _AppearanceActionModifier {
    fileprivate class MergedBox {
        let resetSeed: UInt32 // 0x10
        var count: Int32 // 0x14
        var lastCount: Int32 // 0x18
        var base: _AppearanceActionModifier // 0x20
        var pendingUpdate: Bool
        
        init(resetSeed: UInt32, count: Int32, lastCount: Int32, base: _AppearanceActionModifier, pendingUpdate: Bool) {
            self.resetSeed = resetSeed
            self.count = count
            self.lastCount = lastCount
            self.base = base
            self.pendingUpdate = pendingUpdate
        }
        
        func update() {
            pendingUpdate = true
            
            Update.enqueueAction(reason: nil) {
                // $s7SwiftUI25_AppearanceActionModifierV9MergedBox33_3EDE22C3B37C9BBEF12EC9D1A4B340F3LLC6updateyyFyycfU_
                self.pendingUpdate = false
                
                let w8 = self.count
                let w9 = self.lastCount
                
                self.lastCount = w8
                
                if w9 <= 0 {
                    // <+56>
                    if w8 < 1 {
                        // <+112>
                    } else {
                        self.base.appear?()
                    }
                } else {
                    // <+32>
                    if w8 > 0 {
                        // <+112>
                    } else {
                        self.base.disappear?()
                    }
                }
            }
        }
        
        deinit {
            if
                lastCount >= 1,
                let disappear = base.disappear
            {
                Update.enqueueAction(reason: nil, disappear)
            }
        }
    }
}

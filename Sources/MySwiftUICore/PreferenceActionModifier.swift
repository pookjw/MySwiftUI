// 264234112339315C9A664F0B7F8B50C1
private import AttributeGraph

extension View {
    @inlinable nonisolated public func onPreferenceChange<K>(_ key: K.Type = K.self, perform action: @escaping (K.Value) -> Void) -> some View where K : PreferenceKey, K.Value : Equatable {
        return modifier(_PreferenceActionModifier<K>(action: action))
    }
}

@frozen public struct _PreferenceActionModifier<Key> : ViewModifier where Key : PreferenceKey, Key.Value : Equatable {
    @safe public nonisolated(unsafe) var action: (Key.Value) -> Void
    
    @inlinable public nonisolated init(action: @escaping (Key.Value) -> Swift.Void) {
        self.action = action
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_PreferenceActionModifier<Key>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> x26
         inputs -> x1 -> x20
         body -> x2/x3 -> x28/x22
         */
        // <+248>
        // x19 + 0x90
        var copy = inputs
        copy.preferences.add(Key.self)
        // x19 + 0x38
        let outputs = body(_Graph(), copy)
        
        if let value = outputs[Key.self] {
            let binder = PreferenceBinder(
                modifier: modifier.value,
                keyValue: value,
                phase: copy.base.phase,
                lastResetSeed: 0,
                lastValue: nil
            )
            
            let attribute = Attribute(binder)
            var flags = attribute.flags
            flags = [.unknown0]
            attribute.flags = flags
        }
        
        // <+756>
        return outputs
    }
    
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension _PreferenceActionModifier : Sendable {
}

extension _PreferenceActionModifier : MultiViewModifier, PrimitiveViewModifier {}

fileprivate struct PreferenceBinder<Key : PreferenceKey> : StatefulRule, AsyncAttribute where Key.Value : Equatable {
    @Attribute var modifier: _PreferenceActionModifier<Key> // 0x0
    @Attribute var keyValue: Key.Value // 0x4
    @Attribute var phase: _GraphInputs.Phase // 0x8
    var cycleDetector: UpdateCycleDetector // 0xc
    var lastResetSeed: UInt32 // 0x1c
    var lastValue: Key.Value? // 0x3c (field)
    
    init(
        modifier: Attribute<_PreferenceActionModifier<Key>>,
        keyValue: Attribute<Key.Value>,
        phase: Attribute<_GraphInputs.Phase>,
        cycleDetector: UpdateCycleDetector = UpdateCycleDetector(),
        lastResetSeed: UInt32,
        lastValue: Key.Value?
    ) {
        self._modifier = modifier
        self._keyValue = keyValue
        self._phase = phase
        self.cycleDetector = cycleDetector
        self.lastResetSeed = lastResetSeed
        self.lastValue = lastValue
    }
    
    typealias Value = Void
    
    func updateValue() {
        assertUnimplemented()
    }
}

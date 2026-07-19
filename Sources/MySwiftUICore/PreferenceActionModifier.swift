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
    private var _modifier: Attribute<_PreferenceActionModifier<Key>> // 0x0
    @Attribute private var keyValue: Key.Value // 0x4
    @Attribute private var phase: _GraphInputs.Phase // 0x8
    private var cycleDetector: UpdateCycleDetector // 0xc
    private var lastResetSeed: UInt32 // 0x1c
    private var lastValue: Key.Value? // 0x3c (field)
    
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
    
    mutating func updateValue() {
        /*
         self -> x20 -> x21
         Key -> x0 -> x20
         */
        // <+448>
        if self.phase.resetSeed != self.lastResetSeed {
            // <+488>
            self.lastResetSeed = self.phase.resetSeed
            self.cycleDetector.reset()
            self.lastValue = nil
        }
        
        // <+584>
        // x25 (x29 - 0xa8) / x29 - 0xd8
        let (keyValue, changed) = self.$keyValue.changedValue(options: [])
        // x26
        let empty_1: Key.Value? = nil
        // x23
        let oldLastValue_1 = self.lastValue
        // x23 + x20
        let _ = empty_1
        
        // true -> <+940> / false -> <+1612>
        let flag: Bool
        if let oldLastValue_1 {
            // <+808>
            // x22 (x29 - 0xf0)
            let _ = oldLastValue_1
            // <+852>
            if changed {
                // <+940>
                flag = true
            } else {
                return
            }
        } else {
            // <+744>
            // <+1272>
            if isLinkedOnOrAfter(.v6_1) {
                // <+1612>
                flag = false
            } else {
                if changed {
                    // <+940>
                    flag = true
                } else {
                    return
                }
            }
        }
        
        if flag {
            // <+940>
            // x22
            let copy_1: Key.Value? = keyValue
            // x23
            let oldLastValue_2 = self.lastValue
            // x23 + x20
            let copy_2 = copy_1
            
            if let oldLastValue_2 {
                // <+1372>
                // x26
                let copy_3 = oldLastValue_2
                
                if let copy_2 {
                    // <+1488>
                    // oldLastValue_2 -> x27
                    // x23
                    let copy_4 = copy_2
                    
                    if copy_3 == copy_4 {
                        // <+928>
                        // <+2256>
                        return
                    } else {
                        // <+1612>
                    }
                } else {
                    // <+1412>
                    // <+1612>
                }
            } else {
                // <+1052>
                if copy_2 != nil {
                    // <+1444>
                    // <+1612>
                } else {
                    // <+928>
                    // <+2256>
                    return
                }
            }
        }
        
        // <+1612>
        self.lastValue = keyValue
        
        guard self.cycleDetector.dispatch(label: "Bound preference \(_typeName(Key.self, qualified: false))", isDebug: false) else {
            return
        }
        
        // <+1948>
        // x29 - 0x70
        let resolver: (Key.Value) -> Void = Graph.withoutUpdate {
            // $s7SwiftUI16PreferenceBinder33_264234112339315C9A664F0B7F8B50C1LLV8modifierAA01_C14ActionModifierVyxGvgTf4n_gTm
            let modifier = self.modifier
            
            return { value in
                // $s5Value7SwiftUI13PreferenceKeyPQzIegn_AEytIegnr_AbCRzSQAARpzlTRTA
                modifier.action(value)
            }
        }
        
        Update.enqueueAction(reason: .preferenceChange) { 
            // $s7SwiftUI16PreferenceBinder33_264234112339315C9A664F0B7F8B50C1LLV11updateValueyyFyycfU0_TA
            resolver(keyValue)
        }
    }
    
    var modifier: _PreferenceActionModifier<Key> {
        return self._modifier.value
    }
}

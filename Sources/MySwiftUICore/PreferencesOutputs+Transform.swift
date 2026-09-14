// D3405DB583003A73D556A7797845B7F4
package import AttributeGraph

extension PreferencesOutputs {
    package mutating func makePreferenceTransformer<T: PreferenceKey>(inputs: PreferencesInputs, key: T.Type, transform: @autoclosure () -> Attribute<(inout T.Value) -> Void>) {
        /*
         inputs -> x0 -> x28/w24
         transform -> x2/x3 -> x19/x25
         */
        // w26, x25, w19
        let attribute: Attribute<(inout T.Value) -> Void>?
        if inputs.keys.contains(T.self) {
            let _attribute = transform()
            let rule = PreferenceTransform<T>(transform: _attribute, childValue: OptionalAttribute(self[T.self]))
            self[T.self] = Attribute(rule)
            attribute = _attribute
        } else {
            attribute = nil
        }
        
        // <+144>
        guard
            T._isReadableByHost,
            inputs.keys.contains(HostPreferencesKey.self)
        else {
            return
        }
        
        // <+168>
        let host = self[HostPreferencesKey.self]
        
        let rule = HostPreferencesTransform<T>(
            transform: attribute ?? transform(),
            keys: inputs.hostKeys,
            childValues: OptionalAttribute(host),
            keyRequested: false,
            wasEmpty: false,
            delta: 0,
            nodeId: HostPreferencesKey.makeNoteId()
        )
        
        self[HostPreferencesKey.self] = Attribute(rule)
    }
}

fileprivate struct PreferenceTransform<T: PreferenceKey> : Rule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var transform: (inout T.Value) -> Void
    @OptionalAttribute var childValue: T.Value?
    
    var description: String {
        assertUnimplemented()
    }
    
    static var initialValue: T.Value? {
        return T.defaultValue
    }
    
    var value: T.Value {
        // <+172>
        var value = self.childValue ?? T.defaultValue
        
        $transform.syncMainIfReferences { transform in
            // $s7SwiftUI19PreferenceTransform33_D3405DB583003A73D556A7797845B7F4LLV5value5ValueQzvgyyAGzcXEfU_TA
            ObservationCenter.current._withObservation(attribute: Attribute<T.Value>(identifier: .current!)) { 
                transform(&value)
            }
        }
        
        return value
    }
}

fileprivate struct HostPreferencesTransform<T: PreferenceKey> : StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var transform: (inout T.Value) -> Void // 0x0
    @Attribute private(set) var keys: PreferenceKeys // 0x4
    @OptionalAttribute var childValues: PreferenceValues? // 0x8
    private(set) var keyRequested: Bool // 0xc
    private(set) var wasEmpty: Bool // 0xd
    private(set) var delta: UInt32 // 0x10
    let nodeId: UInt32 // 0x14
    
    typealias Value = PreferenceValues
    
    var description: String {
        assertUnimplemented()
    }
    
    mutating func updateValue() {
        let childValuesAttribute: Attribute<PreferenceValues>
        // w25 (x29 - 0x68)
        var childValuesChanged: Bool
        // x29 - 0x70
        let childValues: PreferenceValues
        if let attribute = self.$childValues {
            childValuesAttribute = attribute
            (childValues, childValuesChanged) = attribute.changedValue(options: [])
            self.wasEmpty = false
        } else {
            childValuesAttribute = Attribute(identifier: .empty)
            childValuesChanged = !self.wasEmpty
            childValues = PreferenceValues()
            self.wasEmpty = true
        }
        
        // <+164>
        let (keys, keysChanged) = self.$keys.changedValue(options: [])
        
        // true -> <+308> / false -> <+200>
        let flag_1: Bool
        
        if keysChanged {
            // <+244>
            let w8 = keys.contains(T.self)
            let w9 = self.keyRequested || !w8
            
            if w9 {
                self.keyRequested = w8
                childValuesChanged = true
                
                if w8 {
                    // <+200>
                    flag_1 = false
                } else {
                    // <+548>
                    flag_1 = true
                }
            } else {
                // <+196>
                if self.keyRequested {
                    // <+200>
                    flag_1 = false
                } else {
                    // <+308>
                    flag_1 = true
                }
            }
        } else {
            // <+196>
            if self.keyRequested {
                // <+200>
                flag_1 = false
            } else {
                // <+308>
                flag_1 = true
            }
        }
        
        // true -> <+368> / false -> <+572>
        let flag_2: Bool
        
        if flag_1 {
            if childValuesChanged {
                // <+548>
                self.value = childValues
            } else {
                // <+532>
                if !self.hasValue {
                    self.value = childValues
                }
            }
            
            flag_2 = false
        } else {
            // <+308>
            let inputsChanged = [self.$keys.identifier, childValuesAttribute.identifier]
                .withUnsafeBufferPointer { pointer in
                    return unsafe AGGraphAnyInputsChanged(pointer.baseAddress.unsafelyUnwrapped, 2)
            }
            
            if inputsChanged {
                // <+220>
                self.delta &+= 1
                childValuesChanged = true
                // <+368>
                flag_2 = true
            } else {
                // <+364>
                if childValuesChanged {
                    // <+368>
                    flag_2 = true
                } else {
                    // <+532>
                    if !self.hasValue {
                        self.value = childValues
                    }
                    flag_2 = false
                }
            }
        }
        
        if flag_2 {
            // <+368>
            self.$transform.syncMainIfReferences { transform in
                // $s7SwiftUI24HostPreferencesTransform33_D3405DB583003A73D556A7797845B7F4LLV11updateValueyyFyy0N0QzzcXEfU0_TA
                let seed = VersionSeed(nodeId: self.nodeId, viewSeed: self.delta)
                let value = PreferenceValues.Value(value: transform, seed: seed)
                childValues.modifyValue(for: T.self, transform: value)
            }
            
            if childValuesChanged {
                // <+548>
                self.value = childValues
            } else {
                if !self.hasValue {
                    self.value = childValues
                }
            }
        }
    }
}

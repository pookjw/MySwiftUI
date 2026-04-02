// 62AFEFEED1A7034F09E120B80AB01BF9
package import AttributeGraph

extension PreferencesOutputs {
    package mutating func makePreferenceWriter<T : PreferenceKey>(inputs: PreferencesInputs, key: T.Type, value: @autoclosure () -> Attribute<T.Value>) {
        /*
         inputs -> x0 -> x29 - 0x70, w25
         value -> x2/x3 -> x23/x24
         */
        // w25, w19
        let attribute: Attribute<T.Value>?
        if inputs.contains(T.self) {
            // <+572>
            let _attribute = value()
            self[T.self] = _attribute
            attribute = _attribute
        } else {
            attribute = nil
        }
        
        if T._isReadableByHost, inputs.contains(HostPreferencesKey.self) {
            // <+168>
            // x29 - 0x70
            let writer = HostPreferencesWriter<T>(
                keyValue: attribute ?? value(),
                keys: inputs.hostKeys,
                childValues: OptionalAttribute(self[HostPreferencesKey.self]),
                keyRequested: false,
                wasEmpty: false,
                delta: 0,
                nodeId: HostPreferencesKey.makeNoteId()
            )
            
            let writerAttribute = Attribute(writer)
            self[HostPreferencesKey.self] = writerAttribute
        }
    }
}

fileprivate struct HostPreferencesWriter<T : PreferenceKey>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var keyValue: T.Value // 0x0
    @Attribute private(set) var keys: PreferenceKeys // 0x4
    @OptionalAttribute var childValues: PreferenceValues? // 0x8
    private(set) var keyRequested: Bool // 0xc
    private(set) var wasEmpty: Bool // 0xd
    private(set) var delta: UInt32 // 0x10
    let nodeId: UInt32 // 0x14
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = PreferenceValues
    
    mutating func updateValue() {
        // self -> x20 -> x26
        // <+260>
        // (x22, w19/w27)
        var values: (PreferenceValues, Bool)
        if let attribute = $childValues {
            // <+312>
            values = attribute.changedValue(options: [])
            self.wasEmpty = false
        } else {
            // <+284>
            values = (PreferenceValues(), !wasEmpty)
            self.wasEmpty = true
        }
        
        // <+352>
        // values -> (x22/w19) -> (x29 - 0x68/x29 - 0x60)
        let w19 = self.keyRequested
        let keys = self.$keys.changedValue(options: [])
        
        /*
         0 -> <+844>
         1 -> <+872>
         2 -> <+400>
         */
        var flag: UInt8!
        
        if !keys.changed {
            if w19 {
                // <+396>
                flag = 2
                // <+400>
            } else {
                // <+616>
                if values.1 {
                    // <+872>
                    flag = 1
                } else {
                    // <+844>
                    flag = 0
                }
            }
        } else {
            // <+560>
            // keys.0 -> x21 -> x29 - 0x70 -> x20
            let contains = keys.0.contains(T.self)
            
            if contains {
                if w19 {
                    // <+400>
                    flag = 2
                } else {
                    keyRequested = true
                    values.1 = true
                    // <+400>
                    flag = 2
                }
            } else {
                if w19 {
                    keyRequested = false
                    values.1 = true
                    // <+872>
                    flag = 1
                } else {
                    // <+392>
                    // <+616>
                    if values.1 {
                        // <+872>
                        flag = 1
                    } else {
                        // <+844>
                        flag = 0
                    }
                }
            }
        }
        
        if flag == 0 {
            // <+844>
            if !hasValue {
                self.value = values.0
            }
        } else if flag == 1 {
            // <+872>
            self.value = values.0
        } else if flag == 2 {
            // <+400>
            var w27 = delta
            // x23 / x23 + (size) -> x28
            let keyValue = self.$keyValue.changedValue(options: [])
            
            if keyValue.changed {
                // <+536>
                w27 &+= 1
                self.delta = w27
                values.1 = true
                // <+692>
            } else {
                // <+680>
                if !values.1 {
                    // <+828>
                    // <+844>
                    if !hasValue {
                        self.value = values.0
                    }
                    return
                }
                
                // <+692>
            }
            
            // <+692>
            let seed = VersionSeed(nodeId: nodeId, viewSeed: w27)
            let value = PreferenceValues.Value(value: keyValue.value, seed: seed)
            values.0[T.self] = value
            // <+872>
            self.value = values.0
        } else {
            abort()
        }
    }
}

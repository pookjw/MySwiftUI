// 62AFEFEED1A7034F09E120B80AB01BF9
package import AttributeGraph

extension PreferencesOutputs {
    package mutating func makePreferenceWriter<T: PreferenceKey>(inputs: PreferencesInputs, key: T.Type, value: @autoclosure () -> Attribute<T.Value>) {
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

fileprivate struct HostPreferencesWriter<T: PreferenceKey>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var keyValue: T.Value
    @Attribute private(set) var keys: PreferenceKeys
    @OptionalAttribute var childValues: PreferenceValues?
    private(set) var keyRequested: Bool
    private(set) var wasEmpty: Bool
    private(set) var delta: UInt32
    let nodeId: UInt32
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = PreferenceValues
    
    mutating func updateValue() {
        // self -> x20 -> x26
        // <+260>
        // (x22, w19/w27)
        let values: (PreferenceValues, Bool)
        if let attribute = $childValues {
            // <+312>
            values = attribute.changedValue(options: [])
            self.keyRequested = true
        } else {
            // <+284>
            values = (PreferenceValues(), !keyRequested)
            self.keyRequested = false
        }
        
        // <+352>
        // values -> (x22/w19) -> (x29 - 0x68/x29 - 0x60)
        
        let keys = self.$keys.changedValue(options: [])
        if !keys.changed {
            if values.1 {
                // <+396>
                fatalError("TODO")
            } else {
                // <+616>
                fatalError("TODO")
            }
        } else {
            // <+560>
            // keys.0 -> x21 -> x29 - 0x70 -> x20
            keys.0.contains(T.self)
            fatalError("TODO")
        }
        fatalError("TODO")
    }
}

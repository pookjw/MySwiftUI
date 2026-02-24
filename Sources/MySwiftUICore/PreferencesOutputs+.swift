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
    
    func updateValue() {
        fatalError("TODO")
    }
}

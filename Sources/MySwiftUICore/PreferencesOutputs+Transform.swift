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
    private(set) var wasEmpty: Bool // 0x10
    private(set) var delta: UInt32 // 0x14
    let nodeId: UInt32 // 0x18
    
    typealias Value = PreferenceValues
    
    var description: String {
        assertUnimplemented()
    }
    
    func updateValue() {
        assertUnimplemented()
    }
}

internal import AttributeGraph

struct PairwisePreferenceCombinerVisitor {
    let outputs: (PreferencesOutputs, PreferencesOutputs)
    var result: PreferencesOutputs
    
    // TODO
}

struct MultiPreferenceCombinerVisitor: PreferenceKeyVisitor {
    let outputs: [PreferencesOutputs]
    var result: PreferencesOutputs
    
    init(outputs: [PreferencesOutputs], result: PreferencesOutputs) {
        self.outputs = outputs
        self.result = result
    }
    
    mutating func visit<Key>(key: Key.Type) where Key : PreferenceKey {
        // self -> x23
        // outputs -> x26 -> sp + 0x18
        // x20
        let values: [Attribute<Key.Value>] = outputs.compactMap { output in
            // $s7SwiftUI30MultiPreferenceCombinerVisitorV5visit3keyyxm_tAA0D3KeyRzlF14AttributeGraph0J0Vy5ValueQzGSgAA18PreferencesOutputsVXEfU_TA
            return output[key]
        }
        
        // <+188>
        let count = values.count
        let value: Attribute<Key.Value>
        if count == 1 {
            // <+244>
            value = values[0]
            // <+648>
        } else if count == 2 {
            // <+284>
            // w26
            let value_0 = values[0]
            let value_1 = values[1]
            // values_0, values_1 -> sp + 0x88
            value = Attribute(PairPreferenceCombiner<Key>(attributes: (value_0, value_1)))
            // <+640>
        } else if count != 0 {
            // <+480>
            value = Attribute(PreferenceCombiner<Key>.init(attributes: values))
            // <+640>
        } else {
            return
        }
        
        // <+640>
        result[key] = value
    }
}

struct PreferenceCombiner<T: PreferenceKey>: Rule, AsyncAttribute, CustomStringConvertible {
    var attributes: [WeakAttribute<T.Value>]
    
    init() {
        attributes = Array()
    }
    
    init(attributes: [Attribute<T.Value>]) {
        self.attributes = attributes.map { WeakAttribute($0) }
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    static var initialValue: T.Value? {
        return T.defaultValue
    }
    
    var value: T.Value {
        // self -> x23
        // sp + 0x58
        var result = T.defaultValue
        var w24 = true
        
        for attribute in attributes {
            if !w24 {
                // <+280>
                T.reduce(value: &result) { 
                    return attribute.wrappedValue ?? T.defaultValue
                }
            } else {
                result = attribute.wrappedValue ?? T.defaultValue
            }
            
            w24 = false
        }
        
        return result
    }
}

fileprivate struct PairPreferenceCombiner<T: PreferenceKey>: Rule, AsyncAttribute {
    var attributes: (Attribute<T.Value>, Attribute<T.Value>)
    
    static var initialValue: T.Value? {
        return T.defaultValue
    }
    
    var value: T.Value {
        // x22
        var result = attributes.0.value
        let next = attributes.1
        
        T.reduce(value: &result) { 
            return next.value
        }
        
        return result
    }
}

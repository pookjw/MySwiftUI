internal import AttributeGraph

struct HostPreferencesCombiner: Rule, AsyncAttribute {
    @Attribute private(set) var keys: PreferenceKeys
    @OptionalAttribute var values: PreferenceValues?
    private(set) var children: [HostPreferencesCombiner.Child]
    
    mutating func addChild(keys: Attribute<PreferenceKeys>, values: WeakAttribute<PreferenceValues>) {
        /*
         self -> x20
         keys -> w0 -> w23
         values -> w1 -> w19
         */
        // w21
        let weakKeys = WeakAttribute(keys)
        for index in children.indices {
            if children[index]._keys.base.attribute == keys.identifier {
                children[index] = HostPreferencesCombiner.Child(_keys: weakKeys, _values: values)
                return
            }
        }
        
        children.append(
            HostPreferencesCombiner.Child(_keys: weakKeys, _values: values)
        )
    }
    
    var value: PreferenceValues {
        /*
         keys/values -> x0 -> x22
         children -> x1 -> x19
         return pointer -> x8 -> x20
         */
        // <+112>
        var values = self.values ?? PreferenceValues()
        
        let count = children.count
        if count != 0 {
            PreferenceValues.combineHostKeyValues(into: &values, keys: self.keys, childIndices: 0..<count) { index in
                let child = children[index]
                return (child._keys.wrappedValue ?? PreferenceKeys(), child._values.wrappedValue ?? PreferenceValues())
            }
        }
        
        return values
    }
}

extension HostPreferencesCombiner {
    struct Child {
        var _keys: WeakAttribute<PreferenceKeys>
        fileprivate var _values: WeakAttribute<PreferenceValues>
    }
}

internal import AttributeGraph

struct HostPreferencesCombiner: Rule, AsyncAttribute {
    @Attribute private(set) var keys: PreferenceKeys
    @OptionalAttribute var values: PreferenceValues?
    private(set) var children: [HostPreferencesCombiner.Child]
    
    func addChild(keys: Attribute<PreferenceKeys>, values: WeakAttribute<PreferenceValues>) {
        fatalError("TODO")
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
                return (child.keys ?? PreferenceKeys(), child.values ?? PreferenceValues())
            }
        }
        
        return values
    }
}

extension HostPreferencesCombiner {
    struct Child {
        @WeakAttribute fileprivate var keys: PreferenceKeys?
        @WeakAttribute fileprivate var values: PreferenceValues?
    }
}

internal import AttributeGraph

struct HostPreferencesCombiner: Rule, AsyncAttribute {
    @Attribute private(set) var keys: PreferenceKeys
    @OptionalAttribute var values: PreferenceValues?
    private(set) var children: [HostPreferencesCombiner.Child]
    
    func addChild(keys: Attribute<PreferenceKeys>, values: WeakAttribute<PreferenceValues>) {
        fatalError("TODO")
    }
    
    var value: PreferenceValues {
        fatalError("TODO")
    }
}

extension HostPreferencesCombiner {
    struct Child {
        @WeakAttribute private var keys: PreferenceKeys?
        @WeakAttribute private var values: PreferenceValues?
    }
}

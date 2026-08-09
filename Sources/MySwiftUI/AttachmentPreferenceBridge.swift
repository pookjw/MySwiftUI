internal import AttributeGraph
@_spi(Internal) internal import MySwiftUICore

final class AttachmentPreferenceBridge {
    var displayListCombiner: OptionalAttribute<DisplayList>
    var hostPreferencesCombiner: OptionalAttribute<PreferenceValues>
    var respondersCombiner: OptionalAttribute<[ViewResponder]>
    
    func wrapOutputs(_ outputs: inout PreferencesOutputs, inputs: _ViewInputs) {
        if let displayListAttribute = outputs[DisplayList.Key.self] {
            // <+340>
            let combiner = PreferenceCombiner<DisplayList.Key>(attributes: [displayListAttribute])
            let attribute = Attribute(combiner)
            outputs[DisplayList.Key.self] = attribute
        }
        
        // <+572>
        if let respondersAttribute = outputs[ViewRespondersKey.self] {
            let combiner = PreferenceCombiner<ViewRespondersKey>(attributes: [respondersAttribute])
            let attribute = Attribute(combiner)
            outputs[ViewRespondersKey.self] = attribute
        }
        
        // <+848>
        if let hostAttribute = outputs[HostPreferencesKey.self] {
            let combiner = PreferenceCombiner<HostPreferencesKey>(attributes: [hostAttribute])
            let attribute = Attribute(combiner)
            outputs[HostPreferencesKey.self] = attribute
        }
        
        // <+1128>
    }
    
    func mutate<T : PreferenceKey>(type: T.Type, combiner: Attribute<T.Value>, src: AnyAttribute, add: Bool) {
        assertUnimplemented()
    }
    
    func mutateHostValues(_: AnyAttribute, add: Bool) {
        assertUnimplemented()
    }
    
    func mutateDisplayList(_: AnyAttribute, add: Bool) {
        assertUnimplemented()
    }
    
    func mutateResponders(_: AnyAttribute, add: Bool) {
        assertUnimplemented()
    }
    
    init() {
        self.displayListCombiner = OptionalAttribute()
        self.hostPreferencesCombiner = OptionalAttribute()
        self.respondersCombiner = OptionalAttribute()
    }
}

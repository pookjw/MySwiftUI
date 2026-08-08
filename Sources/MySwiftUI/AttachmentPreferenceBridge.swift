internal import AttributeGraph
@_spi(Internal) internal import MySwiftUICore

final class AttachmentPreferenceBridge {
    var displayListCombiner: OptionalAttribute<DisplayList>
    var hostPreferencesCombiner: OptionalAttribute<PreferenceValues>
    var respondersCombiner: OptionalAttribute<[ViewResponder]>
    
    func wrapOutputs(_ outputs: inout PreferencesOutputs, inputs: _ViewInputs) {
        assertUnimplemented()
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

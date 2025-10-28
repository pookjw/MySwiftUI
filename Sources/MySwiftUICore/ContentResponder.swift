#warning("TODO")
internal import AttributeGraph

protocol ContentResponder {}

extension _ViewOutputs {
    func makeContentPathPreferenceWriter<T: ContentResponder>(
        inputs: _ViewInputs,
        contentResponder: @autoclosure () -> Attribute<T>,
        kinds: OptionalAttribute<ContentShapeKinds> = OptionalAttribute()
    ) {
        fatalError("TODO")
    }
}

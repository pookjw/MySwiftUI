internal import MySwiftUICore

struct TransformScrollStorageModifier<T : ScrollEnvironmentTransform> : _GraphInputsModifier, PrimitiveViewModifier {
    private(set) var transform: T
    
    static func _makeInputs(modifier: _GraphValue<TransformScrollStorageModifier<T>>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
}

protocol ScrollEnvironmentTransform {
    func update(properties: inout ScrollEnvironmentProperties)
}

struct ScrollEnvironmentProperties {
    // TODO
}

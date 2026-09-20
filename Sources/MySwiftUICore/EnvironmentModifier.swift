package import AttributeGraph

package protocol EnvironmentModifier : _GraphInputsModifier {
    static func makeEnvironment(modifier: Attribute<Self>, environment: inout EnvironmentValues)
}

extension EnvironmentModifier {
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
}

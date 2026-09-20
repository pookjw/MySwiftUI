// E370275CDB55AC7AD9ACF0420859A9E8
package import AttributeGraph

package protocol EnvironmentModifier : _GraphInputsModifier {
    static func makeEnvironment(modifier: Attribute<Self>, environment: inout EnvironmentValues)
}

extension EnvironmentModifier {
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> w23
         inputs -> x1 -> x19
         */
        inputs.environment = Attribute(
            UpdateEnvironment(
                modifier: modifier.value,
                environment: inputs.environment
            )
        )
    }
}

fileprivate struct UpdateEnvironment<T : EnvironmentModifier> : AsyncAttribute, Rule {
    @Attribute private(set) var modifier: T
    @Attribute private(set) var environment: EnvironmentValues
    
    var value: EnvironmentValues {
        assertUnimplemented()
    }
}

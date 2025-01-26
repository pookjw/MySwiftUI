import AttributeGraph

package protocol GraphInput: PropertyKey {
    static var isTriviallyReusable: Bool { get }
    static func makeReusable(indirectMap: IndirectAttributeMap, value: inout Value)
    static func tryToReuse(_ value: Value, by otherValue: Value, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool
}

package struct _GraphInputs {
    package var envrionment: AttributeGraph.Attribute<EnvironmentValues>
    package var scrollable: AttributeGraph.OptionalAttribute<Scrollable>
    package var updateScrollStateRequest: AttributeGraph.OptionalAttribute<ScrollStateRequest?>
    package var scrollPhaseState: AttributeGraph.OptionalAttribute<ScrollPhaseState>
    
    package init(
        time: AttributeGraph.Attribute<Time>,
        phase: AttributeGraph.Attribute<Phase>,
        environment: AttributeGraph.Attribute<EnvironmentValues>,
        transaction: AttributeGraph.Attribute<Transaction>
    ) {
        fatalError("TODO")
    }
}

extension _GraphInputs {
    package struct Phase {}
}

extension _GraphInputs {
//    private struct ScrollableKey: GraphInput {}
    // ScrollStateRequestKey
}

@_spi(Internal) internal import MySwiftUICore

struct PPTFeature : ViewGraphFeature {
    @safe nonisolated(unsafe) static var isEnabled: Bool = isAppleInternalBuild()
    
    // TODO

    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        assertUnimplemented()
    }

    mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        assertUnimplemented()
    }

    mutating func uninstantiate(graph: ViewGraph) {
        assertUnimplemented()
    }
}

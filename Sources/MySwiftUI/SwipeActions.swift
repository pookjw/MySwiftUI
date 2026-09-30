@_spi(Internal) internal import MySwiftUICore

enum SwipeActions {
    struct Feature : ViewGraphFeature {
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            assertUnimplemented()
        }
        
        func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            assertUnimplemented()
        }
    }
}

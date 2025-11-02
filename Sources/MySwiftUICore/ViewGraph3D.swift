#warning("TODO")

private import AttributeGraph

package struct ViewGraph3D {
    @Attribute private var depthTransform: ViewTransform
    private var volumeThatFitsObservers = ViewGraphGeometryObservers<VolumeThatFitsMeasurer>()
    
    package init(graph: ViewGraph) {
        let oldCurrent = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        self._depthTransform = Attribute(graph.rootDepthTransform)
        Subgraph.current = oldCurrent
    }
}

extension ViewGraph3D: ViewGraphFeature {
    package func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        inputs.transform = _depthTransform
        inputs.base.changedDebugProperties.insert(.transform)
    }
    
    package func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        /*
         outputs = x19
         */
        // sp + 0x50
        let inputsCopy = inputs
        // w20
        let depthTransform = $depthTransform
        depthTransform.mutateBody(as: RootDepthTransform.self, invalidating: true) { [inputsCopy, outputs] transform in
            // $s7SwiftUI11ViewGraph3DV06modifyC7Outputs7outputs6inputs5graphyAA01_cF0Vz_AA01_C6InputsVAA0C5GraphCtFyAA18RootDepthTransformVzXEfU_
            // sp + 0x50
            let layoutDirection = inputsCopy.base.cachedEnvironment.value.attribute(id: .layoutDirection) { environmentValues in
                // $s7SwiftUI12_GraphInputsVAAE15layoutDirection09AttributeC00G0VyAA06LayoutF0OGvgAiA17EnvironmentValuesVcfU_
                return environmentValues.layoutDirection
            }
            
            transform.$layoutDirection = layoutDirection
            transform.$childLayoutComputer = outputs.layoutComputer
        }
        
        // <+132>
        guard inputsCopy.customInputs[EnableLayoutDepthStashing.self] else {
            return
        }
        
        // w21
        var layoutComputer = outputs.layoutComputer
        if let _layoutComputer = layoutComputer {
            let viewDepth = depthTransform[keyPath: \.depth]
            
            /*
             layoutComputer -> sp
             viewSize = sp + 0x4
             */
            let depthStashingLayoutComputer = DepthStashingLayoutComputer(
                layoutComputer: _layoutComputer,
                depth: viewDepth
            )
            layoutComputer = Attribute(depthStashingLayoutComputer)
        }
        outputs.layoutComputer = layoutComputer
        
        // <+256>
        if !outputs.preferences.debugProperties.contains(.layoutComputer) {
            outputs.preferences.debugProperties.insert(.layoutComputer)
        }
    }
    
    package func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    package func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    package mutating func needsUpdate(graph: ViewGraph) -> Bool {
        return volumeThatFitsObservers.needsUpdate(graph: graph)
    }
    
    package func update(graph: ViewGraph) {
        volumeThatFitsObservers.notify()
    }
}

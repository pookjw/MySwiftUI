// 5F20844779CE3886FD4DAA7CB43969A0
private import AttributeGraph

extension ViewGraph {
    package var currentSceneResizeDelegate: (any ContentSizedSceneDelegate)? {
        let features = features
        
        if let value = unsafe features[ContentSizedSceneFeature<SizeThatFitsMeasurer>.self] {
            return unsafe value.pointee.dispatcher.delegate
        }
        
        if let value = unsafe features[ContentSizedSceneFeature<VolumeThatFitsMeasurer>.self] {
            return unsafe value.pointee.dispatcher.delegate
        }
        
        return nil
    }
}

package struct ContentSizedSceneFeature<GeometryMeasurer: ViewGraphGeometryMeasurer>: ViewGraphFeature {
    @Attribute private var sizesForProposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]
    fileprivate let dispatcher: SizingPreferencesChangeDispatcher
    private var sizeRestrictionsCallback: ([GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    
    @_specialize(exported: true, where GeometryMeasurer == SizeThatFitsMeasurer)
    @_specialize(exported: true, where GeometryMeasurer == VolumeThatFitsMeasurer)
    init(
        graph: ViewGraph,
        delegate: (any ContentSizedSceneDelegate)?,
        callback: @escaping (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    ) {
        self.dispatcher = SizingPreferencesChangeDispatcher(delegate: nil, pendingChanges: [])
        
        let oldSubgraph = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        
//        WeakAttribute(graph.$safeAreaInsets)
        assertUnimplemented()
        
        Subgraph.current = oldSubgraph
    }
    
    package func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        assertUnimplemented()
    }
    
    package func uninstantiate(graph: ViewGraph) {
        assertUnimplemented()
    }
    
    package func needsUpdate(graph: ViewGraph) -> Bool {
        assertUnimplemented()
    }
    
    package func update(graph: ViewGraph) {
        assertUnimplemented()
    }
}

extension ContentSizedSceneFeature where GeometryMeasurer == SizeThatFitsMeasurer {
    package static func window(graph: ViewGraph) -> ContentSizedSceneFeature<SizeThatFitsMeasurer> {
        return ContentSizedSceneFeature<SizeThatFitsMeasurer>(graph: graph, delegate: nil) { proposals in
            // $s7SwiftUI24ContentSizedSceneFeatureVA2A20SizeThatFitsMeasurerVRszrlE6window5graphACyAEGAA9ViewGraphC_tFZAA17SizingPreferencesVSDyAA09_ProposedG0VSo6CGSizeVGcfU_
            assertUnimplemented()
        }
    }
}

extension ContentSizedSceneFeature where GeometryMeasurer == VolumeThatFitsMeasurer {
    package static func volume(graph: ViewGraph) -> ContentSizedSceneFeature<VolumeThatFitsMeasurer> {
        assertUnimplemented()
    }
}

fileprivate final class SizingPreferencesChangeDispatcher {
    fileprivate private(set) weak var delegate: ContentSizedSceneDelegate?
    private var pendingChanges: [(SizingPreferences, Transaction?)]
    
    init(delegate: ContentSizedSceneDelegate? = nil, pendingChanges: [(SizingPreferences, Transaction?)]) {
        self.delegate = delegate
        self.pendingChanges = pendingChanges
    }
    
    func contentSizeDidChange(sizingPreferences: SizingPreferences, transaction: Transaction?) {
        assertUnimplemented()
    }
    
    func update() {
        assertUnimplemented()
    }
}

struct SizeThatFitsRule<GeometryMeasurer: ViewGraphGeometryMeasurer> {
    @WeakAttribute private var layoutComputer: LayoutComputer?
    @WeakAttribute private var safeAreaInsets: _SafeAreaInsetsModifier?
    @WeakAttribute private var layoutDirection: LayoutDirection?
    @WeakAttribute private var transaction: Transaction?
    private weak var dispatcher: SizingPreferencesChangeDispatcher?
    private var sizeRestrictionsCallback: (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    private var proposals: Set<GeometryMeasurer.Proposal>
    
    fileprivate init(
        layoutComputer: WeakAttribute<LayoutComputer>,
        safeAreaInsets: WeakAttribute<_SafeAreaInsetsModifier>,
        layoutDirection: WeakAttribute<LayoutDirection>,
        transaction: WeakAttribute<Transaction>,
        dispatcher: SizingPreferencesChangeDispatcher?,
        sizeRestrictionsCallback: (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences,
        proposals: Set<GeometryMeasurer.Proposal>
    ) {
        assertUnimplemented()
    }
}

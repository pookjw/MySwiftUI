// 5F20844779CE3886FD4DAA7CB43969A0
private import AttributeGraph

extension ViewGraph {
    package var currentSceneResizeDelegate: (any ContentSizedSceneDelegate)? {
        let features = features
        
        if let value = features[ContentSizedSceneFeature<SizeThatFitsMeasurer>.self] {
            return value.pointee.dispatcher.delegate
        }
        
        if let value = features[ContentSizedSceneFeature<VolumeThatFitsMeasurer>.self] {
            return value.pointee.dispatcher.delegate
        }
        
        return nil
    }
}

struct ContentSizedSceneFeature<GeometryMeasurer: ViewGraphGeometryMeasurer>: ViewGraphFeature {
    @Attribute private var sizesForProposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]
    fileprivate let dispatcher: SizingPreferencesChangeDispatcher
    private var sizeRestrictionsCallback: ([GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    
    init(graph: ViewGraph, delegate: (any ContentSizedSceneDelegate)?, callback: (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> Void) {
        fatalError("TODO")
    }
    
    func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    func update(graph: ViewGraph) {
        fatalError("TODO")
    }
}

fileprivate final class SizingPreferencesChangeDispatcher {
    fileprivate private(set) var delegate: ContentSizedSceneDelegate?
    private var pendingChanges: [(SizingPreferences, Transaction?)]
    
    init(delegate: ContentSizedSceneDelegate? = nil, pendingChanges: [(SizingPreferences, Transaction?)]) {
        self.delegate = delegate
        self.pendingChanges = pendingChanges
    }
    
    func contentSizeDidChange(sizingPreferences: SizingPreferences, transaction: Transaction?) {
        fatalError("TODO")
    }
    
    func update() {
        fatalError("TODO")
    }
}

// 5F20844779CE3886FD4DAA7CB43969A0
internal import AttributeGraph
internal import CoreGraphics
private import os.log

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
    @Attribute private(set) var sizesForProposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]
    fileprivate let dispatcher: SizingPreferencesChangeDispatcher
    private var sizeRestrictionsCallback: ([GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    
    @_specialize(exported: true, where GeometryMeasurer == SizeThatFitsMeasurer)
    @_specialize(exported: true, where GeometryMeasurer == VolumeThatFitsMeasurer)
    init(
        graph: ViewGraph,
        delegate: (any ContentSizedSceneDelegate)?,
        callback: @escaping (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    ) {
        let dispatcher = SizingPreferencesChangeDispatcher(delegate: nil, pendingChanges: [])
        self.dispatcher = dispatcher
        
        let oldSubgraph = Subgraph.current
        Subgraph.current = graph.globalSubgraph
        
        self.sizeRestrictionsCallback = callback
        
        let rule = SizeThatFitsRule<GeometryMeasurer>(
            layoutComputer: WeakAttribute(),
            safeAreaInsets: WeakAttribute(graph.$safeAreaInsets),
            layoutDirection: WeakAttribute(),
            transaction: WeakAttribute(),
            dispatcher: dispatcher,
            sizeRestrictionsCallback: callback
        )
        
        let attribute = Attribute(rule)
        self._sizesForProposals = attribute
        attribute.flags = [.unknown0]
        
        self.dispatcher.delegate = delegate
        
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
    fileprivate weak var delegate: ContentSizedSceneDelegate?
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

struct SizeThatFitsRule<GeometryMeasurer: ViewGraphGeometryMeasurer>: StatefulRule, AsyncAttribute {
    private var _layoutComputer: WeakAttribute<LayoutComputer>
    private var _safeAreaInsets: WeakAttribute<_SafeAreaInsetsModifier>
    @WeakAttribute private var layoutDirection: LayoutDirection?
    private var _transaction: WeakAttribute<Transaction>
    private weak var dispatcher: SizingPreferencesChangeDispatcher?
    private var sizeRestrictionsCallback: (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    var proposals: Set<GeometryMeasurer.Proposal>
    
    var layoutComputer: LayoutComputer? {
        return _layoutComputer.wrappedValue
    }
    
    var safeAreaInsets: _SafeAreaInsetsModifier? {
        return _safeAreaInsets.wrappedValue
    }
    
    var transaction: Transaction? {
        return _transaction.wrappedValue
    }
    
    fileprivate init(
        layoutComputer: WeakAttribute<LayoutComputer>,
        safeAreaInsets: WeakAttribute<_SafeAreaInsetsModifier>,
        layoutDirection: WeakAttribute<LayoutDirection>,
        transaction: WeakAttribute<Transaction>,
        dispatcher: SizingPreferencesChangeDispatcher?,
        sizeRestrictionsCallback: @escaping (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences,
        proposals: Set<GeometryMeasurer.Proposal> = Set()
    ) {
        self._layoutComputer = layoutComputer
        self._safeAreaInsets = safeAreaInsets
        self._layoutDirection = layoutDirection
        self._transaction = transaction
        self.dispatcher = dispatcher
        self.sizeRestrictionsCallback = sizeRestrictionsCallback
        self.proposals = proposals
    }
    
    typealias Value = [GeometryMeasurer.Proposal: GeometryMeasurer.Size]
    
    @_specialize(exported: true, where GeometryMeasurer == SizeThatFitsMeasurer)
    @_specialize(exported: true, where GeometryMeasurer == VolumeThatFitsMeasurer)
    func updateValue() {
        assertUnimplemented()
    }
}

extension ViewGraph {
    package func setWindowResizeDelegate(_ delegate: ContentSizedSceneDelegate) {
        if let feature = self.features[ContentSizedSceneFeature<SizeThatFitsMeasurer>.self] {
            // <+192>
            if let resize = Log.resize {
                resize.log(level: .debug, "Adding 2D ContentSizedSceneDelegate")
            }
            
            // <+576>
            feature.pointee.dispatcher.delegate = delegate
        } else {
            // <+324>
            if let resize = Log.resize {
                resize.log(level: .error, "Missing ContentSizedWindowFeature")
            }
        }
    } 
    
    package func setVolumeResizeDelegate(_ delegate: ContentSizedSceneDelegate) {
        if let feature = self.features[ContentSizedSceneFeature<VolumeThatFitsMeasurer>.self] {
            // <+192>
            if let resize = Log.resize {
                resize.log(level: .debug, "Adding 3D ContentSizedSceneDelegate")
            }
            
            // <+576>
            feature.pointee.dispatcher.delegate = delegate
        } else {
            // <+324>
            if let resize = Log.resize {
                resize.log(level: .error, "Missing ContentSizedVolumeFeature")
            }
        }
    }
}

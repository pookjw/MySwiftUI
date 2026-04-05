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

package struct ContentSizedSceneFeature<GeometryMeasurer : ViewGraphGeometryMeasurer>: ViewGraphFeature {
    @Attribute private(set) var sizesForProposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]
    fileprivate let dispatcher: SizingPreferencesChangeDispatcher
    private var sizeRestrictionsCallback: ([GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences
    
    @specialized(where GeometryMeasurer == SizeThatFitsMeasurer)
    @specialized(where GeometryMeasurer == VolumeThatFitsMeasurer)
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
        $sizesForProposals.mutateBody(as: SizeThatFitsRule<GeometryMeasurer>.self, invalidating: true) { rule in
            // $sSo11AGAttributea14AttributeGraphE10mutateBody2as12invalidating_yxm_SbyxzXEtlFySvXEfU_TA.1
            let layoutDirection = inputs.base.cachedEnvironment.value.attribute(id: .layoutDirection) { environment in
                return environment.layoutDirection
            }
            
            rule.$layoutDirection = layoutDirection
            rule._layoutComputer = WeakAttribute(outputs.layoutComputer)
            rule._transaction = WeakAttribute(inputs.transaction)
        }
    }
    
    package func uninstantiate(graph: ViewGraph) {
        assertUnimplemented()
    }
    
    package func needsUpdate(graph: ViewGraph) -> Bool {
        return !self.dispatcher.pendingChanges.isEmpty
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
        return ContentSizedSceneFeature(graph: graph, delegate: nil) { proposals in
            // $s7SwiftUI24ContentSizedSceneFeatureVA2A22VolumeThatFitsMeasurerVRszrlE6volume5graphACyAEGAA9ViewGraphC_tFZAA17SizingPreferencesVSDyAA15_ProposedSize3DVSo8SPSize3DaGcfU_
            assertUnimplemented()
        }
    }
}

fileprivate final class SizingPreferencesChangeDispatcher {
    fileprivate weak var delegate: ContentSizedSceneDelegate?
    private(set) var pendingChanges: [(SizingPreferences, Transaction?)]
    
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

struct SizeThatFitsRule<GeometryMeasurer : ViewGraphGeometryMeasurer>: StatefulRule, AsyncAttribute {
    fileprivate var _layoutComputer: WeakAttribute<LayoutComputer> // 0x0
    private var _safeAreaInsets: WeakAttribute<_SafeAreaInsetsModifier> // 0x8
    @WeakAttribute fileprivate var layoutDirection: LayoutDirection? // 0x10
    fileprivate var _transaction: WeakAttribute<Transaction> // 0x18
    private weak var dispatcher: SizingPreferencesChangeDispatcher? // 0x20
    private var sizeRestrictionsCallback: (_ proposals: [GeometryMeasurer.Proposal: GeometryMeasurer.Size]) -> SizingPreferences // 0x28
    var proposals: Set<GeometryMeasurer.Proposal> // 0x38
    
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
    
    @specialized(where GeometryMeasurer == SizeThatFitsMeasurer)
    @specialized(where GeometryMeasurer == VolumeThatFitsMeasurer)
    func updateValue() {
        // self -> x20 -> x26
        // proposals -> x21
        
        if proposals.isEmpty {
            // <+176>
            if hasValue, self.value.isEmpty {
                // <+768>
            } else {
                // <+288>
                self.value = Dictionary()
                // <+716>
                // <+768>
            }
            // <+768>
            return
        } else {
            // <+436>
            if
                let _ = layoutComputer, // x29 - 0xf8
                let _ = layoutDirection, // w25
                let _ = safeAreaInsets // x29 - 0xf8 -> x19 + 0x38
            {
                // <+848>
                // x29 - 0xf8
                let _ = Graph.withoutUpdate {
                    // $s7SwiftUI16SizeThatFitsRuleV11updateValueyyFAA11TransactionVSgyXEfU_
                    return self.transaction
                }
                
                // <+1056>
                assertUnimplemented()
            } else {
                // <+508>
                if !hasValue {
                    self.value = Dictionary()
                    // <+768>
                } else {
                    // <+768>
                }
                
                // <+768>
                return
            }
        }
    }
}

extension ViewGraph {
    package func setWindowResizeDelegate(_ delegate: ContentSizedSceneDelegate) {
        if let feature = unsafe self.features[ContentSizedSceneFeature<SizeThatFitsMeasurer>.self] {
            // <+192>
            if let resize = Log.resize {
                resize.log(level: .debug, "Adding 2D ContentSizedSceneDelegate")
            }
            
            // <+576>
            unsafe feature.pointee.dispatcher.delegate = delegate
        } else {
            // <+324>
            if let resize = Log.resize {
                resize.log(level: .error, "Missing ContentSizedWindowFeature")
            }
        }
    } 
    
    package func setVolumeResizeDelegate(_ delegate: ContentSizedSceneDelegate) {
        if let feature = unsafe self.features[ContentSizedSceneFeature<VolumeThatFitsMeasurer>.self] {
            // <+192>
            if let resize = Log.resize {
                resize.log(level: .debug, "Adding 3D ContentSizedSceneDelegate")
            }
            
            // <+576>
            unsafe feature.pointee.dispatcher.delegate = delegate
        } else {
            // <+324>
            if let resize = Log.resize {
                resize.log(level: .error, "Missing ContentSizedVolumeFeature")
            }
        }
    }
}

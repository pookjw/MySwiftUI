#warning("TODO")
private import Foundation
private import AttributeGraph

package class ViewGraphHost {
    package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    package static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    package weak var updateDelegate: ViewGraphRootValueUpdater? = nil
    package weak var renderDelegate: ViewGraphRenderDelegate? = nil
    package weak var delegate: ViewGraphHostDelegate? = nil
    private var idiom: ViewGraphHost.Idiom? = nil
    package var initialInheritedEnvironment: EnvironmentValues? = nil
    package let viewGraph: ViewGraph
    package let renderer: DisplayList.ViewRenderer
    package var currentTimestamp: Time = .zero
    package var valuesNeedingUpdate: ViewGraphRootValues = .all
    package var renderingPhase: ViewRenderingPhase = .none
    package var externalUpdateCount: Int = 0
    private var parentPhase: _GraphInputs.Phase? = nil
    private var displayLink: ViewGraphDisplayLink? = nil
    private var nextTimerTime: Time? = nil
    private var updateTimer: Timer? = nil
    
    package init<T: View>(
        rootViewType: T.Type,
        outputs: ViewGraph.Outputs,
        viewDefinition: PlatformViewDefinition.Type
    ) {
        self.viewGraph = ViewGraph(rootViewType: rootViewType, requestedOutputs: outputs)
        self.renderer = DisplayList.ViewRenderer(platform: DisplayList.ViewUpdater.Platform(definition: viewDefinition))
    }
    
    package func `as`<T>(_ type: T.Type) -> T? {
        if let result = _specialize(self as (any ViewGraphOwner), for: T.self) {
            return result
        } else if let result = _specialize(renderer, for: T.self) {
            return result
        } else if let result = _specialize(renderDelegate, for: T.self) {
            return result
        } else if let result = _specialize(viewGraph as (any ViewGraphRenderHost), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    package func setUp() {
        let viewGraph = viewGraph
        viewGraph.append(feature: ViewGraphHost.GraphFeature(host: self))
        viewGraph.append(feature: HitTestBindingFeature())
        updateDelegate?.initializeViewGraph()
        setupInitialInheritedEnvironment()
    }
    
    private func setupInitialInheritedEnvironment() {
        guard let current = RepresentableContextValues.current else {
            return
        }
        
        initialInheritedEnvironment = current.environment
    }
    
    package func clearDisplayLink() {
        fatalError("TODO")
    }
    
    package func clearUpdateTimer() {
        fatalError("TODO")
    }
    
    package func cancelAsyncRendering() {
        fatalError("TODO")
    }
    
    package func updateRemovedState(isUnattached: Bool, isHiddenForReuse: Bool) {
        Update.lock()
        viewGraph.updateRemovedState()
        Update.unlock()
    }
}

extension ViewGraphHost {
    struct Idiom: Hashable {
        static var phone: Idiom { return Idiom(.phone) }
        static var pad: Idiom { return Idiom(.pad) }
        static var tv: Idiom { return Idiom(.tv) }
        static var watch: Idiom { return Idiom(.watch) }
        static var carPlay: Idiom { return Idiom(.carPlay) }
        static var mac: Idiom { return Idiom(.mac) }
        static var macCatalyst: Idiom { return Idiom(.macCatalyst) }
        static var vision: Idiom { return Idiom(.vision) }
        
        var base: InterfaceIdiom
        
        init(_ idiom: InterfaceIdiom) {
            self.base = idiom
        }
    }
}

extension ViewGraphHost {
    struct GraphFeature: ViewGraphFeature {
        private weak var host: ViewGraphHost?
        
        init(host: ViewGraphHost) {
            self.host = host
        }
    }
}

extension ViewGraphHost: ViewGraphOwner {}

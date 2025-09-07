#warning("TODO")
private import Foundation
private import AttributeGraph

package class ViewGraphHost {
    package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    package static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    private weak var updateDelegate: ViewGraphRootValueUpdater? = nil
    package weak var renderDelegate: ViewGraphRenderDelegate? = nil
    package weak var delegate: ViewGraphHostDelegate? = nil
    private var idiom: ViewGraphHost.Idiom? = nil
    private var initialInheritedEnvironment: EnvironmentValues? = nil
    package let viewGraph: ViewGraph
    private let renderer: DisplayList.ViewRenderer
    private var currentTimestamp: Time = .zero
    private var valuesNeedingUpdate: ViewGraphRootValues = .all
    private var renderingPhase: ViewRenderingPhase = .none
    private var externalUpdateCount: Int = 0
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

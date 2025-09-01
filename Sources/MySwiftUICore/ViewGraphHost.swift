#warning("TODO")
private import Foundation

package class ViewGraphHost {
    package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    package static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    private weak var updateDelegate: ViewGraphRootValueUpdater? = nil
    private weak var renderDelegate: ViewGraphRenderDelegate? = nil
    private weak var delegate: ViewGraphHostDelegate? = nil
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

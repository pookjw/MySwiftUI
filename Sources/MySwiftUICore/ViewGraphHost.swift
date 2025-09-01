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
        fatalError("TODO")
    }
}

extension ViewGraphHost {
    struct Idiom: Hashable {
        static var phone: Idiom { return .phone }
        static var pad: Idiom { return .pad }
        static var tv: Idiom { return .tv }
        static var watch: Idiom { return .watch }
        static var carPlay: Idiom { return .carPlay }
        static var mac: Idiom { return .mac }
        static var macCatalyst: Idiom { return .macCatalyst }
        static var vision: Idiom { return .vision }
        
        var base: InterfaceIdiom
        
        init(_ idiom: InterfaceIdiom) {
            self.base = idiom
        }
    }
}

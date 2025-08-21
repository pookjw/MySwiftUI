#warning("TODO")
private import Foundation

package class ViewGraphHost {
    package static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    package static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    private weak var updateDelegate: ViewGraphRootValueUpdater?
    private weak var renderDelegate: ViewGraphRenderDelegate?
    private weak var delegate: ViewGraphHostDelegate?
    private var idiom: ViewGraphHost.Idiom?
    private var initialInheritedEnvironment: EnvironmentValues?
    package let viewGraph: ViewGraph
    private let renderer: DisplayList.ViewRenderer
    private var currentTimestamp: Time
    private var valuesNeedingUpdate: ViewGraphRootValues
    private var renderingPhase: ViewRenderingPhase
    private var externalUpdateCount: Int
    private var parentPhase: _GraphInputs.Phase?
    private var displayLink: ViewGraphDisplayLink?
    private var nextTimerTime: Time?
    private var updateTimer: Timer?
    
    package init<T: View>(rootViewType: T.Type, outputs: ViewGraph.Outputs, viewDefinition: PlatformViewDefinition.Type) {
        self.viewGraph = ViewGraph(rootViewType: rootViewType, requestedOutputs: outputs)
        fatalError("TODO")
    }
}

extension ViewGraphHost {
    struct Idiom {
        private var base: InterfaceIdiom
    }
}

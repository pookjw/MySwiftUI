private import Foundation

struct ViewGraphHost {
    static nonisolated(unsafe) var isDefaultEnvironmentConfigured: Bool = true
    static nonisolated(unsafe) var defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    
    private weak var updateDelegate: ViewGraphRootValueUpdater?
    private weak var renderDelegate: ViewGraphRenderDelegate?
    private weak var delegate: ViewGraphHostDelegate?
    private var idiom: ViewGraphHost.Idiom?
    private var initialInheritedEnvironment: EnvironmentValues?
    private let viewGraph: ViewGraph
    private let renderer: DisplayList.ViewRenderer
    private var currentTimestamp: Time
    private var valuesNeedingUpdate: ViewGraphRootValues
    private var renderingPhase: ViewRenderingPhase
    private var externalUpdateCount: Int
    private var parentPhase: _GraphInputs.Phase?
    private var displayLink: ViewGraphDisplayLink?
    private var nextTimerTime: Time?
    private var updateTimer: Timer?
}

extension ViewGraphHost {
    struct Idiom {
        private var base: InterfaceIdiom
    }
}

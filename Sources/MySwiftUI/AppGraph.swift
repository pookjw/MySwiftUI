// A363922CEBDF47986D9772B903C8737A
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph
private import _DarwinFoundation3._stdlib

final class AppGraph: GraphHost {
    @safe static nonisolated(unsafe) var shared: AppGraph? = nil {
        willSet {
            guard let newValue else {
                return
            }
            
            if !newValue.didCollectLaunchProfile {
                if newValue.traceLaunch {
                    // <+92>
                    Graph.startTracing(options: [.unknown32])
                    // <+136>
                } else {
                    // <+116>
                    if newValue.launchProfileOptions.contains(.unknown1) {
                        AGGraphStartProfiling(nil)
                    }
                }
            }
            
            // <+136>
            precondition(AppGraph.shared == nil, "AppGraph.shared may only be set once!")
        }
    }
    
    @safe static nonisolated(unsafe) var delegateBox: AnyFallbackDelegateBox?
    
    private var makeRootScene: (_SceneInputs) -> _SceneOutputs
    private var observers: Set<HashableWeakBox<AnyObject>> = []
    @Attribute private var rootScenePhase: ScenePhase
    private var rootSceneLists: IndirectAttribute<[SceneList.Namespace: SceneList]>? = nil
    @Attribute private var primarySceneSummaries: [SceneList.Item.Summary]
    @Attribute private(set) var focusedValues: FocusedValues
    @Attribute private(set) var focusStore: FocusStore
    @Attribute private var sceneKeyboardShortcuts: [SceneID: KeyboardShortcut]
    @Attribute private var activeWindows: [WindowProxy]
    private lazy var launchProfileOptions: AppGraph.LaunchProfileOptions = {
        guard let value = unsafe getenv("SWIFTUI_PROFILE_LAUNCH") else {
            return []
        }
        
        let rawValue = unsafe atoi(value)
        return AppGraph.LaunchProfileOptions(rawValue: rawValue)
    }()
    private lazy var traceLaunch = ProcessEnvironment.bool(forKey: "SWIFTUI_TRACE_LAUNCH")
    private var didCollectLaunchProfile = false
    @OptionalAttribute private var rootCommandsList: CommandsList?
    
    convenience init<T: App>(app: T) {
        self.init { inputs in
            // $s7SwiftUI8AppGraphC3appACx_tcAA0C0RzlufcAA13_SceneOutputsVAA01_F6InputsVcfU_TA
            fatalError("TODO")
        }
    }
    
    init<T: Scene>(content: T, namespace: SceneList.Namespace) {
        fatalError("TODO")
    }
    
    fileprivate init(makeRootScene: @escaping (_SceneInputs) -> _SceneOutputs) {
        /*
         self -> x20 -> x19
         makeRootScene -> x0/x1 -> x21/x20
         */
        // <+376>
        self.makeRootScene = makeRootScene
        
        // x22
        let data = GraphHost.Data()
        // x29 - 0x80
        let oldCurrent = Subgraph.current
        Subgraph.current = data.globalSubgraph
        CustomEventTrace.instantiateBegin(data.globalSubgraph)
        self._rootScenePhase = Attribute(value: .background)
        self._primarySceneSummaries = Attribute(value: [])
        self._focusedValues = Attribute(value: FocusedValues())
        self._focusStore = Attribute(value: FocusStore())
        self._sceneKeyboardShortcuts = Attribute(value: [:])
        self._activeWindows = Attribute(value: [])
        
        super.init(data: data)
        
        CustomEventTrace.instantiateEnd(data.globalSubgraph)
    }
    
    deinit {
        fatalError("TODO")
    }
    
    final func graphDidChange() {
        fatalError("TODO")
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    final func updateFocusedValues(_ value: FocusedValues) -> Bool {
        return self._focusedValues.setValue(value)
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    final func updateFocusStore(_ store: FocusStore) -> Bool {
        return self._focusStore.setValue(store)
    }
}

extension AppGraph {
    struct LaunchProfileOptions: OptionSet {
        static var unknown1: AppGraph.LaunchProfileOptions {
            return AppGraph.LaunchProfileOptions(rawValue: 1 << 1)
        }
        
        var rawValue: Int32
    }
}

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
            newValue.instantiate()
            precondition(AppGraph.shared == nil, "AppGraph.shared may only be set once!")
        }
    }
    
    @safe static nonisolated(unsafe) var delegateBox: AnyFallbackDelegateBox?
    
    private var makeRootScene: (_SceneInputs) -> _SceneOutputs // 0xb0
    private var observers: Set<HashableWeakBox<AnyObject>> = [] // 0xc0
    @Attribute var rootScenePhase: ScenePhase // 0xc8
    private var rootSceneLists: IndirectAttribute<[SceneList.Namespace: SceneList]>? = nil // 0xcc
    @Attribute private var primarySceneSummaries: [SceneList.Item.Summary] // 0xd4
    @Attribute private(set) var focusedValues: FocusedValues // 0xd8
    @Attribute private(set) var focusStore: FocusStore // 0xdc
    @Attribute private var sceneKeyboardShortcuts: [SceneID: KeyboardShortcut] // 0xe0
    @Attribute var activeWindows: [WindowProxy] // 0xe4
    private lazy var launchProfileOptions: AppGraph.LaunchProfileOptions = { // 0xe8
        guard let value = unsafe getenv("SWIFTUI_PROFILE_LAUNCH") else {
            return []
        }
        
        let rawValue = unsafe atoi(value)
        return AppGraph.LaunchProfileOptions(rawValue: rawValue)
    }()
    private lazy var traceLaunch = ProcessEnvironment.bool(forKey: "SWIFTUI_TRACE_LAUNCH") // 0xed
    private var didCollectLaunchProfile = false // 0xee
    @OptionalAttribute var rootCommandsList: CommandsList? // 0xf0
    
    convenience init<T: App>(app: T) {
        self.init { inputs in
            // $s7SwiftUI8AppGraphC3appACx_tcAA0C0RzlufcAA13_SceneOutputsVAA01_F6InputsVcfU_TA
            // <+384>
            // x27
            let fields = unsafe DynamicPropertyCache.fields(of: T.self)
            var inputs = inputs
            let graphValue = _GraphValue(Attribute(value: app))
            
            let body = unsafe AppBodyAccessor<T>().makeBody(
                container: graphValue,
                inputs: &inputs.base,
                fields: fields
            )
            
            let outputs = T.Body._makeScene(scene: body.0, inputs: inputs)
            return outputs
        }
    }
    
    init<T: Scene>(content: T, namespace: SceneList.Namespace) {
        assertUnimplemented()
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
        
        Subgraph.current = oldCurrent
        CustomEventTrace.instantiateEnd(data.globalSubgraph)
    }
    
    deinit {
        assertUnimplemented()
    }
    
    func graphDidChange() {
        // self -> x20 -> x24
        // <+208>
        self.data.updateSeed &+= 1
        self.runTransaction()
        
        // x29 - 0xa8
        let rootScenePhaseChanged = self._rootScenePhase.changedValue(options: []).changed
        // x29 - 0x9c
        var rootCommandsListChanged = false
        if let attribute = self._rootCommandsList.attribute {
            rootCommandsListChanged = attribute.changedValue(options: []).changed
        }
        
        // <+392>
        for observer in self.observers {
            guard
                let base = observer.base,
                let casted = base as? AppGraphObserver
            else {
                continue
            }
            
            casted.scenesDidChange(phaseChanged: rootScenePhaseChanged)
            
            if rootCommandsListChanged {
                casted.commandsDidChange()
            }
        }
    }
    
    override func instantiateOutputs() {
        /*
         self -> x20 -> x21
         */
        // <+140>
        self.data.updateSeed &+= 1
        
        // x19
        let outputs: _SceneOutputs = self.rootSubgraph.apply { 
            // $s7SwiftUI8AppGraphC18instantiateOutputsyyFAA06_SceneF0VyXEfU_
            // self -> x0 -> x21
            // <+224>
            // x23
            var graphInputs = self.graphInputs
            // x23 + x26
            var preferencesInputs = PreferencesInputs(hostKeys: data.$hostPreferenceKeys)
            
            let environment = RootEnvironment(
                environment: self.graphInputs.environment,
                phase: self._rootScenePhase,
                sceneKeyboardShortcuts: self._sceneKeyboardShortcuts,
                activeWindows: self._activeWindows
            )
            let environmentAttribute = Attribute(environment)
            graphInputs.environment = environmentAttribute
            
            preferencesInputs.add(HostPreferencesKey.self)
            preferencesInputs.add(SceneList.Key.self)
            preferencesInputs.add(CommandsList.Key.self)
            graphInputs[FocusedValuesInputKey.self] = OptionalAttribute($focusedValues)
            graphInputs[FocusStoreInputKey.self] = OptionalAttribute($focusStore)
            
            let inputs = _SceneInputs(base: graphInputs, preferences: preferencesInputs)
            let outputs = self.makeRootScene(inputs)
            return outputs
        }
        
        // <+284>
        self.rootSubgraph.apply { 
            if let attribute = outputs.preferences[SceneList.Key.self] {
                let indirect = attribute.identifier.createIndirectAttribute2(8)
                self.rootSceneLists = IndirectAttribute(source: Attribute(identifier: indirect))
            }
        }
        
        // <+448>
        let commandsList = outputs.preferences[CommandsList.Key.self]
        self._rootCommandsList = OptionalAttribute(commandsList)
        
        self.hostPreferenceValues = WeakAttribute(outputs.preferences[HostPreferencesKey.self])
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    func updateFocusedValues(_ value: FocusedValues) -> Bool {
        return self._focusedValues.setValue(value)
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    func updateFocusStore(_ store: FocusStore) -> Bool {
        return self._focusStore.setValue(store)
    }
    
    func addObserver(_ observer: AppGraphObserver) {
        self.observers = self.observers.filter { $0.base != nil }
        self.observers.insert(HashableWeakBox(observer))
    }
    
    func supports(_ command: CommandFlag) -> Bool {
        return Update.ensure { 
            // $s7SwiftUI8AppGraphC8supportsySbAA11CommandFlagVFSbyXEfU_TA
            let rootCommandsList = rootCommandsList ?? CommandsList()
            
            guard !rootCommandsList.items.isEmpty else {
                return false
            }
            
            assertUnimplemented()
        }
    }
    
    func sceneList(namespace: SceneList.Namespace) -> SceneList {
        if
            let rootSceneLists,
            let existing = rootSceneLists.value[namespace]
        {
            return existing
        } else {
            return SceneList()
        }
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

protocol AppGraphObserver: AnyObject {
    func scenesDidChange(phaseChanged: Bool)
    func commandsDidChange()
}

fileprivate struct RootEnvironment: @preconcurrency Rule {
    @Attribute var environment: EnvironmentValues
    @Attribute var phase: ScenePhase
    @Attribute var sceneKeyboardShortcuts: [SceneID: KeyboardShortcut]
    @Attribute var activeWindows: [WindowProxy]
    
    @MainActor
    var value: EnvironmentValues {
        var result = self.environment
        result.configuredForRoot()
        result[ScenePhaseKey.self] = self.phase
        result.configureForPlatform(traitCollection: nil)
        result.sceneKeyboardShortcuts = self.sceneKeyboardShortcuts
        result.activeWindows = self.activeWindows
        return result
    }
}

fileprivate struct AppBodyAccessor<T: App>: BodyAccessor {
    typealias Container = T
    typealias Body = T.Body
    
    func updateBody(of container: T, changed: Bool) {
        self.setBody {
            // $s7SwiftUI35TableRowContentModifierBodyAccessor33_3FCAC41ECA223CCA916A97D58BF9A4E6LLV06updateG02of7changedyx_SbtF0G0QzyXEfU_TA
            return container.body
        }
    }
}

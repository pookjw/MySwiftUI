// 84047D77B835AF60A341F749BE017BAD
public import MySwiftUICore
private import AttributeGraph

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated func immersiveSpaceTransition<T: Equatable>(trigger: T) -> some Scene {
        return self.modifier(ImmersiveSpaceTransitionTriggerModifier(value: trigger))
    }
}

fileprivate struct ImmersiveSpaceTransitionTriggerModifier<T: Equatable> : PrimitiveSceneModifier {
    fileprivate private(set) var value: T
    
    static func _makeScene(modifier: _GraphValue<ImmersiveSpaceTransitionTriggerModifier<T>>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        // <+368>
        let outputs = body(_Graph(), inputs)
        
        if inputs.preferences.contains(SceneList.Key.self) {
            // <+452>
            let dispatcher = ImmersiveSpaceTransitionDispatcher(
                modifier: modifier.value,
                sceneLists: WeakAttribute(outputs.preferences[SceneList.Key.self]),
                namespace: inputs.sceneNamespace,
                oldValue: nil,
                phase: inputs.base.phase,
                lastResetSeed: 0,
                cycleDetector: UpdateCycleDetector()
            )
            
            let dispatcherAttribute = Attribute(dispatcher)
            dispatcherAttribute.flags = .transactional
        }
        
        // <+872>
        return outputs
    }
}

fileprivate struct ImmersiveSpaceTransitionDispatcher<T: Equatable> : StatefulRule, AsyncAttribute {
    @Attribute private var modifier: ImmersiveSpaceTransitionTriggerModifier<T> // 0x0
    @WeakAttribute private var sceneLists: [SceneList.Namespace : SceneList]? // 0x4
    private var namespace: SceneList.Namespace // 0x10
    private var oldValue: T?
    @Attribute private var phase: _GraphInputs.Phase // 0x58
    private var lastResetSeed: UInt32 // 0x5c
    private var cycleDetector: UpdateCycleDetector // 0x60
    
    init(
        modifier: Attribute<ImmersiveSpaceTransitionTriggerModifier<T>>, // x0
        sceneLists: WeakAttribute<[SceneList.Namespace : SceneList]>, // x1
        namespace: SceneList.Namespace, // x2/x2/w4
        oldValue: T?, // x5
        phase: Attribute<_GraphInputs.Phase>, // x6
        lastResetSeed: UInt32, // x7
        cycleDetector: UpdateCycleDetector
    ) {
        self._modifier = modifier
        self._sceneLists = sceneLists
        self.namespace = namespace
        self.oldValue = oldValue
        self._phase = phase
        self.lastResetSeed = lastResetSeed
        self.cycleDetector = cycleDetector
    }
    
    typealias Value = Void
    
    func updateValue() {
        assertUnimplemented()
    }
}

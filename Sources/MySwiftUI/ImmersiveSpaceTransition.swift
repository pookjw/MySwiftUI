// 84047D77B835AF60A341F749BE017BAD
public import MySwiftUICore
private import AttributeGraph
private import os.log

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
    private var _modifier: Attribute<ImmersiveSpaceTransitionTriggerModifier<T>> // 0x0
    private var _sceneLists: WeakAttribute<[SceneList.Namespace : SceneList]> // 0x4
    private var namespace: SceneList.Namespace // 0x10
    private var oldValue: T? // 0x28
    private var _phase: Attribute<_GraphInputs.Phase> // 0x58
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
    
    var modifier: ImmersiveSpaceTransitionTriggerModifier<T> {
        return self._modifier.value
    }
    
    var sceneLists: [SceneList.Namespace : SceneList]? {
        return self._sceneLists.wrappedValue
    }
    
    var phase: _GraphInputs.Phase {
        return self._phase.value
    }
    
    typealias Value = Void
    
    mutating func updateValue() {
        // self -> x20 -> x24
        // <+752>
        if self.phase.resetSeed != self.lastResetSeed {
            // <+820>
            self.lastResetSeed = self.phase.resetSeed
            self.oldValue = nil
            self.cycleDetector.reset()
        }
        
        // <+932>
        // x25 (x29 - 0x88) -> x29 - 0x68
        let newValue = self.modifier.value
        // x26 (x29 - 0xa0)
        let emptyValue: T? = nil
        // x22(x23) (x29 - 0x98)
        let _oldValue = self.oldValue
        // emptyValue -> x26 -> x22(x23) + x20
        
        // 0 -> <+1284> / 1 -> <+1464> / 2 -> <+1788>
        let flag_1: UInt8
        if _oldValue != nil {
            // <+1172>
            // _oldValue -> x23 -> x25
            if emptyValue != nil {
                // <+1788>
                flag_1 = 2
            } else {
                // <+1232>
                // <+1284>
                flag_1 = 0
            }
        } else {
            // <+1112>
            if emptyValue != nil {
                // <+1284>
                flag_1 = 0
            } else {
                // <+1464>
                flag_1 = 1
            }
        }
        
        let flag_2: Bool // true -> <+1584> / false -> <+2084>
        if flag_1 == 0 {
            // <+1284>
            // x19 -> x23 (x29 - 0xc8)
            let _newValue: T? = newValue
            // emptyValue -> x23 + x20
            
            if let _newValue {
                // <+1484>
                // _newValue -> x23 -> x19
                if let emptyValue {
                    // <+1956>
                    // emptyValue -> x26 (x29 - 0xe8)
                    if _newValue == emptyValue {
                        // <+2084>
                        flag_2 = false
                    } else {
                        // <+1584>
                        flag_2 = true
                    }
                } else {
                    // <+1528>
                    // <+1560>
                    flag_2 = true
                }
            } else {
                // <+1424>
                if emptyValue != nil {
                    // <+1560>
                    flag_2 = true
                } else {
                    // <+1464>
                    // <+2084>
                    flag_2 = false
                }
            }
        } else if flag_1 == 1 {
            // <+1464>
            // <+2084>
            flag_2 = false
        } else {
            // <+1788>
            // emptyValue -> x26 (x29 - 0xe8)
            if newValue == emptyValue {
                // <+2084>
                flag_2 = false
            } else {
                // <+1308>
                // x19 -> x23 (x29 - 0xc8)
                let _newValue: T? = newValue
                // emptyValue (x23 + x20)
                if _newValue != nil {
                    // <+1484>
                    // _newValue -> x23 -> x19
                    if emptyValue != nil {
                        // <+1956>
                        // emptyValue -> x26 (x29 - 0xe8)
                        if _newValue == emptyValue {
                            // <+2084>
                            flag_2 = false
                        } else {
                            // <+1584>
                            flag_2 = true
                        }
                    } else {
                        // <+1528>
                        // <+1560>
                        flag_2 = true
                    }
                } else {
                    // <+1424>
                    // <+1424>
                    if emptyValue != nil {
                        // <+1560>
                        flag_2 = true
                    } else {
                        // <+1464>
                        // <+2084>
                        flag_2 = false
                    }
                }
            }
        }
        
        if flag_2 {
            // <+1584>
            let result = self.cycleDetector.dispatch(label: "TransitionImmersiveSpaceOnChange")
            if result {
                // <+1628>
                let ids: [SceneID]? = Graph.withoutUpdate { 
                    // $s7SwiftUI34ImmersiveSpaceTransitionDispatcher33_84047D77B835AF60A341F749BE017BADLLV11updateValueyyFSayAA7SceneIDOGSgyXEfU_
                    assertUnimplemented()
                }
                
                if let ids {
                    // <+1672>
                    Update.enqueueAction(reason: nil) { 
                        // $s7SwiftUI34ImmersiveSpaceTransitionDispatcher33_84047D77B835AF60A341F749BE017BADLLV11updateValueyyFyycfU0_TA
                        assertUnimplemented()
                    }
                    // <+2084>
                } else {
                    // <+2180>
                    Log.immersiveSpace.log(level: .error, "Couldn't find the scene items. Skipping immersive space transition for the change from \(String(describing: _oldValue!)) to \(String(describing: newValue)).")
                    // <+2084>
                }
            } else {
                // <+2084>
            }
        } else {
            // <+2084>
        }
        
        // <+2084>
        self.oldValue = newValue
    }
}

// 3C80F7DE1FFF0C22DF7A3A1B806A69D8
internal import MySwiftUICore
private import AttributeGraph

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@usableFromInline
@MainActor @preconcurrency internal struct _TupleScene<T> : Scene {
    @usableFromInline
    @MainActor @preconcurrency internal var value: T
    @usableFromInline
    
    @MainActor @preconcurrency internal var body: Never {
        assertUnimplemented()
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal init(_ value: T) {
        assertUnimplemented()
    }
    
    @usableFromInline
    nonisolated internal static func _makeScene(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        /*
         scene -> x0 -> x29 - 0x98
         inputs -> x1/x2 -> x29 - 0xb8 / x28
         */
        // <+832>
        // x28
        let tupleType = TupleType(T.self)
        // x27
        let description = SceneDescriptor.tupleDescription(tupleType)
        // x24
        var makeList = _TupleScene.MakeList.init(scene: scene, inputs: inputs, offset: 0, outputs: [])
        // tupleType -> x28 -> x29 - 0x98
        
        for contentType in description.contentTypes {
            makeList.offset = tupleType.offset(at: contentType.0)
            unsafe contentType.1.visitType(visitor: &makeList)
        }
        
        // <+1160>
        // x29 - 0x80
        var preferencesOutputsArray: [PreferencesOutputs] = []
        for outputs in makeList.outputs {
            preferencesOutputsArray.append(outputs.preferences)
        }
        
        // <+1452>
        // x28
        var multiVisitor = MultiPreferenceCombinerVisitor(
            outputs: preferencesOutputsArray,
            result: PreferencesOutputs()
        )
        
        for key in inputs.preferences.keys {
            key.visitKey(&multiVisitor)
        }
        
        return _SceneOutputs(preferences: multiVisitor.result)
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    @usableFromInline
    internal typealias Body = Never
}

@available(*, unavailable)
extension _TupleScene : Sendable {
}

extension _TupleScene {
    fileprivate struct MakeList: SceneTypeVisitor {
        private var scene: _GraphValue<_TupleScene<T>>
        private var inputs: _SceneInputs
        var offset: Int
        private(set) var outputs: [_SceneOutputs]
        
        init(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs, offset: Int, outputs: [_SceneOutputs]) {
            self.scene = scene
            self.inputs = inputs
            self.offset = offset
            self.outputs = outputs
        }
        
        func visit<U>(type: U.Type) where U : Scene {
            assertUnimplemented()
        }
    }
}

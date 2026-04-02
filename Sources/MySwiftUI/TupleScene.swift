// 3C80F7DE1FFF0C22DF7A3A1B806A69D8
internal import MySwiftUICore
private import _MySwiftUIShims
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
        let tupleType = TupleType(T.self)
        // x27
        let description = SceneDescriptor.tupleDescription(tupleType)
        _TupleScene.MakeList
        assertUnimplemented()
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    @usableFromInline
    internal typealias Body = Never
}

@available(*, unavailable)
extension _TupleScene : Sendable {
}

package struct SceneDescriptor: TupleDescriptor {
    package static nonisolated(unsafe) var typeCache: [ObjectIdentifier : TupleTypeDescription<SceneDescriptor>] = [:]
    
    package static var descriptor: UnsafeRawPointer {
        return _sceneProtocolDescriptor()
    }
}

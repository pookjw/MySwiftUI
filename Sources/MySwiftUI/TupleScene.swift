internal import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@usableFromInline
@MainActor @preconcurrency internal struct _TupleScene<T> : Scene {
    @usableFromInline
    @MainActor @preconcurrency internal var value: T
    @usableFromInline
    
    @MainActor @preconcurrency internal var body: Never {
        fatalError("TODO")
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal init(_ value: T) {
        fatalError("TODO")
    }
    
    @usableFromInline
    nonisolated internal static func _makeScene(scene: _GraphValue<_TupleScene<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    @usableFromInline
    internal typealias Body = Never
}
@available(*, unavailable)
extension _TupleScene : Sendable {
}

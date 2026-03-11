public import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct _EmptyScene: Scene {
    @inlinable public init() {}
    
    nonisolated public static func _makeScene(scene: _GraphValue<_EmptyScene>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _EmptyScene : Sendable {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _EmptyScene : BitwiseCopyable {}

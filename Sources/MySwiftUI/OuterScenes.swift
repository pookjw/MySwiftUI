internal import MySwiftUICore

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Scene {
    nonisolated public func _orderOutScenes(_ sceneIdentifierProvider: @escaping () -> Set<String>) -> some Scene {
        assertUnimplemented()
    }
}

struct _OrderOutScenesModifier {
    private var sceneIdentifiersProviderStorage: _OrderOutScenesModifier.Storage
}

extension _OrderOutScenesModifier {
    struct Storage {
        private let sceneIdentifiersProvider: () -> Set<String>
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _OrderOutScenesModifier : _SceneModifier, PrimitiveSceneModifier, _GraphInputsModifier {
    static func _makeInputs(modifier: _GraphValue<_OrderOutScenesModifier>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
}

struct OrderOutSceneSessionIdentifiersProviderInput : SceneInput {
    static var defaultValue: () -> Set<String> {
        return { return [] }
    }
}

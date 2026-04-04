public import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol _SceneModifier {
    associatedtype Body : Scene

    @SceneBuilder func body(content: SceneContent) -> Body

    typealias SceneContent = _SceneModifier_Content<Self>

    static func _makeScene(
        modifier: _GraphValue<Self>,
        inputs: _SceneInputs,
        body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs
    ) -> _SceneOutputs
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SceneModifier where Body == Never {
    public func body(content: SceneContent) -> Body {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SceneModifier where Self : _GraphInputsModifier, Body == Never {
    public static func _makeScene(
        modifier: _GraphValue<Self>,
        inputs: _SceneInputs,
        body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs
    ) -> _SceneOutputs {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension EmptyModifier : _SceneModifier {
    public static func _makeScene(
        modifier: _GraphValue<EmptyModifier>,
        inputs: _SceneInputs,
        body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs
    ) -> _SceneOutputs {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {
    @inlinable
    nonisolated internal func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent : Scene where Content : Scene, Modifier : _SceneModifier {
    nonisolated public static func _makeScene(
        scene: _GraphValue<ModifiedContent<Content, Modifier>>,
        inputs: _SceneInputs
    ) -> _SceneOutputs {
        let modifier = scene[{ .of(&$0.modifier)}]
        
        let outputs = Modifier._makeScene(modifier: modifier, inputs: inputs) { graph, inputs in
            // $s7SwiftUI15ModifiedContentVA2A19WidgetConfigurationRzAA0eF8ModifierR_rlE05_makeeF06widget6inputsAA01_E7OutputsVAA11_GraphValueVyACyxq_GG_AA01_E6InputsVtFZAjA01_L0V_APtcfU0_TA
            let content = scene[{ .of(&$0.content)}]
            return Content._makeScene(scene: content, inputs: inputs)
        }
        
        return outputs
    }

    @MainActor @preconcurrency public var body: ModifiedContent<Content, Modifier>.Body {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ModifiedContent : _SceneModifier where Content : _SceneModifier, Modifier : _SceneModifier {
    public static func _makeScene(
        modifier: _GraphValue<ModifiedContent<Content, Modifier>>,
        inputs: _SceneInputs,
        body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs
    ) -> _SceneOutputs {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SceneModifier {
    @inlinable
    internal func concat<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _SceneModifier_Content<Modifier> : Scene where Modifier : _SceneModifier {
    nonisolated public static func _makeScene(
        scene: _GraphValue<_SceneModifier_Content<Modifier>>,
        inputs: _SceneInputs
    ) -> _SceneOutputs {
        assertUnimplemented()
    }

    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias Body = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SceneModifier_Content : PrimitiveScene where Modifier : _SceneModifier {
}

@available(*, unavailable)
extension _SceneModifier_Content : Sendable {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension _SceneModifier {
    public static func _makeScene(
        modifier: _GraphValue<Self>,
        inputs: _SceneInputs,
        body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs
    ) -> _SceneOutputs {
        assertUnimplemented()
    }
}

protocol PrimitiveSceneModifier : _SceneModifier where Body == Never {
}

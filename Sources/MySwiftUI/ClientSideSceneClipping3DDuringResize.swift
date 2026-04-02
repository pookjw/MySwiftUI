// 2757C8CEAD462372B32B033D63FAF712
internal import MySwiftUICore
private import FeatureFlags
private import Spatial

struct ClientSideSceneClipping3DDuringResize : Feature {
    @usableFromInline
    @safe nonisolated(unsafe) static var isEnabledForTesting: Bool = false
    
    @inlinable
    static var isEnabled: Bool {
        let result: Bool
        if ClientSideSceneClipping3DDuringResize.isEnabledForTesting {
            result = true
        } else {
            result = isFeatureEnabled(ClientSideSceneClipping3DDuringResize.Key())
        }
        
        if result {
            return isLinkedOnOrAfter(.v6)
        } else {
            return false
        }
    }
    
    init() {}
}

extension ClientSideSceneClipping3DDuringResize {
    fileprivate struct Key : FeatureFlagsKey {
        var domain: StaticString {
            return "SwiftUI"
        }
        
        var feature: StaticString {
            return "clientSideSceneClipping3DDuringResize"
        }
    }
}

struct Clipped3DDuringSceneResizeModifier : ViewModifier {
    @Environment(\.isAnimatingSceneResize) private var isAnimatingSceneResize
    @Environment(\.effectiveWindowMargins) private var effectiveWindowMargins
    
    func body(content: Content) -> some View {
        content
            .modifier(ConditionalClipping3DEffect(clips: isAnimatingSceneResize, effectiveMargins: effectiveWindowMargins))
    }
}

fileprivate struct ConditionalClipping3DEffect : ViewModifier, PrimitiveViewModifier, MultiViewModifier, @preconcurrency Animatable, @preconcurrency RendererEffect3D {
    private(set) var clips: Bool
    private(set) var effectiveMargins: EdgeOutsets3D
    
    var animatableData: EmptyAnimatableData {
        get {
            return EmptyAnimatableData()
        }
        set {}
    }
    
    func effectValue(size: Size3D) -> DisplayList.Effect {
        /*
         self -> x20 -> x27
         */
        guard clips else {
            return .identity
        }
        
        assertUnimplemented()
    }
    
    nonisolated static func _makeView(modifier: _GraphValue<ConditionalClipping3DEffect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> x29 - 0x80
         inputs -> x1 -> x22
         body -> x2/x3 -> x29 - 0x60 / x29 - 0x58
         */
        // <+276>
        if inputs.needsGeometry || inputs.preferences.contains(DisplayList.Key.self) {
            // <+352>
            // x24
            var modifier = modifier
            let _ = Self._makeAnimatable(value: &modifier, inputs: inputs.base)
            let outputs = Self._makeRendererEffect3D(effect: modifier, inputs: inputs, body: body)
            return outputs
        } else {
            // return body(_Graph(), inputs)
            return body(_Graph(), inputs)
        }
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<ConditionalClipping3DEffect>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
}

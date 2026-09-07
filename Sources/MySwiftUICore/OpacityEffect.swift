// 34FFA2034B9AD53E0463E3971529C5A1
internal import CoreGraphics
internal import AttributeGraph

extension View {
    @inlinable nonisolated public func opacity(_ opacity: Double) -> some View {
        return modifier(_OpacityEffect(opacity: opacity))
    }
}

@frozen public struct _OpacityEffect : Equatable {
    public var opacity: Double
    
    @inlinable nonisolated public init(opacity: Double) {
        self.opacity = opacity
    }
    
    public var animatableData: Double {
        get {
            return self.opacity
        }
        set {
            self.opacity = newValue
        }
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OpacityEffect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w23
         inputs -> x1 -> x21
         body -> x2/x3 -> x24/x19
         */
        // x29 - 0xb0 (x27)
        let copy_1 = inputs
        
        if copy_1.preferences.contains(DisplayList.Key.self) {
            // <+128>
            // x29 - 0x128
            var copy_2 = modifier
            // x29 - 0x110
            let copy_3 = inputs.base
            Self._makeAnimatable(value: &copy_2, inputs: copy_3)
            
            return Self._makeRendererEffect(effect: copy_2, inputs: copy_1) { graph, incoming in
                // $s7SwiftUI14_OpacityEffectV9_makeView8modifier6inputs4bodyAA01_F7OutputsVAA11_GraphValueVyACG_AA01_F6InputsVAiA01_K0V_ANtctFZAiP_ANtcfU_
                /*
                 incoming -> x1 -> x21
                 body -> x2/x3
                 modifier -> w4 -> w22
                 */
                // x29 - 0xb0 (x25)
                let copy_4 = incoming
                // x29 - 0x110
                let copy_5 = incoming
                var outputs = body(graph, copy_5)
                
                if copy_4.preferences.contains(ViewRespondersKey.self) {
                    // <+324>
                    let effect = outputs.preferences[ViewRespondersKey.self]
                    // inlined
                    let responder = OpacityViewResponder(inputs: incoming)
                    let filter = OpacityResponderFilter(
                        effect: modifier.value,
                        children: OptionalAttribute(effect),
                        responder: responder
                    )
                    outputs.preferences[ViewRespondersKey.self] = Attribute(filter)
                    // <+648>
                } else {
                    // <+648>
                }
                
                // <+648>
                copy_4.opacityAccessibilityProvider.makeOpacity(
                    effect: modifier.value, // $s7SwiftUI14_OpacityEffectV9_makeView8modifier6inputs4bodyAA01_F7OutputsVAA11_GraphValueVyACG_AA01_F6InputsVAiA01_K0V_ANtctFZAiP_ANtcfU_09AttributeK00N0VyACGyXEfu_TA.16
                    inputs: copy_5,
                    outputs: &outputs
                )
                
                return outputs
            }
        } else {
            // <+240>
            // x29 - 0x110
            let copy_2 = inputs
            var outputs = body(_Graph(), copy_2)
            
            if copy_1.preferences.contains(ViewRespondersKey.self) {
                // <+324>
                let effect = outputs.preferences[ViewRespondersKey.self]
                // inlined
                let responder = OpacityViewResponder(inputs: inputs)
                let filter = OpacityResponderFilter(
                    effect: modifier.value,
                    children: OptionalAttribute(effect),
                    responder: responder
                )
                outputs.preferences[ViewRespondersKey.self] = Attribute(filter)
                // <+804>
            } else {
                // <+804>
            }
            
            // <+804>
            copy_1.opacityAccessibilityProvider.makeOpacity(
                effect: modifier.value, // $s7SwiftUI9Map2Phase33_BE6C3883808EC258A2B6649DC967D317LLVyxq_q0_GAA21ResettableGestureRuleA2aFP13lastResetSeeds6UInt32VvgTW
                inputs: copy_1,
                outputs: &outputs
            )
            
            return outputs
        }
    }
    
    public static func == (a: _OpacityEffect, b: _OpacityEffect) -> Bool {
        return a.opacity == b.opacity
    }
    
    public typealias AnimatableData = Double
    public typealias Body = Never
}

extension _OpacityEffect : Animatable {}
extension _OpacityEffect : ViewModifier {}
extension _OpacityEffect : Sendable {}
extension _OpacityEffect : BitwiseCopyable {}

extension _OpacityEffect : RendererEffect {
    func effectValue(size: CGSize) -> DisplayList.Effect {
        return .opacity(Float(self.opacity))
    }
    
    nonisolated static var isScrapeable: Bool {
        return true
    }
}

extension _OpacityEffect : ProtobufEncodableMessage {}
extension _OpacityEffect : ProtobufDecodableMessage {}

extension Color {
    public func opacity(_ opacity: Double) -> Color {
        assertUnimplemented()
    }
    
    public func mix(with rhs: Color, by fraction: Double, in colorSpace: Gradient.ColorSpace = .perceptual) -> Color {
        assertUnimplemented()
    }
}

fileprivate final class OpacityViewResponder : DefaultLayoutViewResponder {
    private var _opacity: Double
    
    var opacity: Double {
        return self._opacity
    }
    
    override init(inputs: _ViewInputs) {
        self._opacity = 1
        super.init(inputs: inputs)
    }
    
    override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        assertUnimplemented()
    }
    
    override func extendPrintTree(string: inout String) {
        assertUnimplemented()
    }
}

struct OpacityResponderFilter : StatefulRule {
    @Attribute private var effect: _OpacityEffect
    @OptionalAttribute private var children: [ViewResponder]?
    private let responder: OpacityViewResponder
    
    @inline(always)
    fileprivate init(effect: Attribute<_OpacityEffect>, children: OptionalAttribute<[ViewResponder]>, responder: OpacityViewResponder) {
        self._effect = effect
        self._children = children
        self.responder = responder
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        assertUnimplemented()
    }
}

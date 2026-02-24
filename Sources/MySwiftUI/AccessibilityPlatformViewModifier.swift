// 4EFBB0540F336979925886EE21020A43
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

struct AccessibilityPlatformViewModifier: AccessibilityViewModifier {
    private(set) var platformView: UIView
    private(set) var properties: AccessibilityProperties
    
    typealias Body = Never
    
    static nonisolated func makeAccessibilityPlatformTransform<T: CoreViewRepresentable>(inputs: _ViewInputs, representable: Attribute<ViewLeafView<T>>, outputs: inout _ViewOutputs) {
        /*
         inputs -> x0 -> x24
         representable -> x1 -> x21
         outputs -> x2 -> x19
         */
        // <+124>
        if inputs.preferences.contains(AccessibilityNodesKey.self) {
            // <+188>
            Self.makeResolvableTransform(context: representable, inputs: inputs, outputs: outputs, includeGeometry: <#T##Bool#>, for: AccessibilityBridgedPlatformView.self)
//            let view = AccessibilityBridgedPlatformView.init(context: <#T##Attribute<ViewLeafView<Representable>>#>)
            
//            Self.makeResolvableTransform(inputs: <#T##_ViewInputs#>, outputs: <#T##_ViewOutputs#>, includeGeometry: <#T##Bool#>, for: <#T##AnyResolvableAccessibilityViewModifier.Type#>)
            fatalError("TODO")
        } else {
            // <+344>
            fatalError("TODO")
        }
        
        // <+868>
        fatalError("TODO")
    }
    
    static nonisolated func makeAccessibilityViewModifier(modifier: _GraphValue<AccessibilityPlatformViewModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

extension AccessibilityPlatformViewModifier {
    fileprivate struct PlatformViewAttachment: Rule {
        @Attribute private(set) var properties: AccessibilityProperties
        @Attribute private(set) var view: UIView
        
        var value: Never {
            fatalError("TODO")
        }
    }
}

struct AccessibilityBridgedPlatformView<Representable: CoreViewRepresentable>: ResolvableAccessibilityModifierStatefulRule {
    typealias Context = ViewLeafView<Representable>
    
    @Attribute fileprivate private(set) var context: ViewLeafView<Representable>
    
    typealias Value = AccessibilityPlatformViewModifier
    
    func updateValue() {
        fatalError("TODO")
    }
}

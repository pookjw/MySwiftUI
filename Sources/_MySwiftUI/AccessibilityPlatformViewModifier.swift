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
        let attribute: Attribute<AccessibilityNodeList>?
        if inputs.preferences.contains(AccessibilityNodesKey.self) {
            // <+188>
            attribute = Self.makeResolvableTransform(context: representable, inputs: inputs, outputs: outputs, includeGeometry: options.contains(.unknown0), for: AccessibilityBridgedPlatformView<T>.self)
            // <+868>
            outputs[AccessibilityNodesKey.self] = attribute
        } else {
            // <+344>
            fatalError("TODO")
        }
    }
    
    static nonisolated func makeAccessibilityViewModifier(modifier: _GraphValue<AccessibilityPlatformViewModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static var options: AccessibilityModifierOptions {
        return [.unknown0]
    }
    
    func willCreateNode(for nodes: [AccessibilityNode]) -> Bool {
        fatalError("TODO")
    }
    
    func initialAttachment(for node: AccessibilityNode) -> MySwiftUICore.AccessibilityAttachment {
        fatalError("TODO")
    }
    
    func createOrUpdateNode(viewRendererHost: (any MySwiftUICore.ViewRendererHost)?, existingNode: AccessibilityNode?) -> AccessibilityNode {
        fatalError("TODO")
    }
    
    func scrapeableContent(environment: MySwiftUICore.EnvironmentValues, idiom: MySwiftUICore.AnyInterfaceIdiom) -> MySwiftUICore.ScrapeableContent.Content? {
        fatalError("TODO")
    }
    
    var supportsPlaceholders: Bool {
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
    static func makeAnyAccessibilityModifier(context: AnyAttribute) -> AnyAttribute {
        fatalError("TODO")
    }
    
    typealias Context = ViewLeafView<Representable>
    
    @Attribute fileprivate private(set) var context: ViewLeafView<Representable>
    
    typealias Value = AccessibilityPlatformViewModifier
    
    init(context: Attribute<ViewLeafView<Representable>>) {
        self._context = context
    }
    
    func updateValue() {
        fatalError("TODO")
    }
}

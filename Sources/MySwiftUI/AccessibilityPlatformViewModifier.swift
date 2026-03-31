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
        if unsafe inputs.preferences.contains(AccessibilityNodesKey.self) {
            // <+188>
            attribute = Self.makeResolvableTransform(context: representable, inputs: inputs, outputs: outputs, includeGeometry: options.contains(.unknown0), for: AccessibilityBridgedPlatformView<T>.self)
            // <+868>
            unsafe outputs[AccessibilityNodesKey.self] = attribute
        } else {
            // <+344>
            assertUnimplemented()
        }
    }
    
    static nonisolated func makeAccessibilityViewModifier(modifier: _GraphValue<AccessibilityPlatformViewModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static var options: AccessibilityModifierOptions {
        return [.unknown0]
    }
    
    func willCreateNode(for nodes: [AccessibilityNode]) -> Bool {
        assertUnimplemented()
    }
    
    func initialAttachment(for node: AccessibilityNode) -> MySwiftUICore::AccessibilityAttachment {
        assertUnimplemented()
    }
    
    func createOrUpdateNode(viewRendererHost: (any MySwiftUICore::ViewRendererHost)?, existingNode: AccessibilityNode?) -> AccessibilityNode {
        assertUnimplemented()
    }
    
    func scrapeableContent(environment: MySwiftUICore::EnvironmentValues, idiom: MySwiftUICore::AnyInterfaceIdiom) -> MySwiftUICore::ScrapeableContent.Content? {
        assertUnimplemented()
    }
    
    var supportsPlaceholders: Bool {
        assertUnimplemented()
    }
}

extension AccessibilityPlatformViewModifier {
    fileprivate struct PlatformViewAttachment: Rule {
        @Attribute private(set) var properties: AccessibilityProperties
        @Attribute private(set) var view: UIView
        
        var value: Never {
            assertUnimplemented()
        }
    }
}

struct AccessibilityBridgedPlatformView<Representable: CoreViewRepresentable>: ResolvableAccessibilityModifierStatefulRule {
    static func makeAnyAccessibilityModifier(context: AnyAttribute) -> AnyAttribute {
        assertUnimplemented()
    }
    
    typealias Context = ViewLeafView<Representable>
    
    @Attribute fileprivate private(set) var context: ViewLeafView<Representable>
    
    typealias Value = AccessibilityPlatformViewModifier
    
    init(context: Attribute<ViewLeafView<Representable>>) {
        self._context = context
    }
    
    func updateValue() {
        assertUnimplemented()
    }
}

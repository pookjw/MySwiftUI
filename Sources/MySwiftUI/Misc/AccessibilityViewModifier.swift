// 71F62EDC1DAE3BBC7A74521E45BA5A66

#warning("TODO")
internal import AttributeGraph
internal import MySwiftUICore

protocol AccessibilityViewModifier: PrimitiveViewModifier, MultiViewModifier {}

extension AccessibilityViewModifier {
    static func makeResolvableTransform<T: AnyResolvableAccessibilityViewModifier>(inputs: _ViewInputs, outputs: _ViewOutputs, includeGeometry: Bool, for: T.Type) -> Attribute<AccessibilityNodeList>? {
        // $s7SwiftUI25AccessibilityViewModifierPAAE23makeResolvableTransform6inputs7outputs15includeGeometry3for14AttributeGraph0N0VyAA0C8NodeListVGSgAA01_D6InputsV_AA01_D7OutputsVSbqd__mtAA03AnygcdE0Rd__lFZAA0c9ContainerE0V_AA0cU8ResolverVyAA0C13ChildBehaviorV4HostVGTt2t3g5
        /*
         inputs = x22
         outputs = x21
         includeGeometry = x23
         */
        
        guard inputs.preferences.contains(AccessibilityNodesKey.self) else {
            return nil
        }
        
        let resolvableModifier = ResolvableModifier(subgraph: .current!, context: .empty, base: T.self)
        return Self.makePropertiesTransform(modifier: .empty, inputs: inputs, outputs: outputs, includeGeometry: includeGeometry, resolvableModifier: resolvableModifier, scrapeableID: .none)
    }
    
    fileprivate static func makePropertiesTransform(modifier: AnyAttribute, inputs: _ViewInputs, outputs: _ViewOutputs, includeGeometry: Bool, resolvableModifier: ResolvableModifier?, scrapeableID: ScrapeableID) -> Attribute<AccessibilityNodeList> {
        // $s7SwiftUI25AccessibilityViewModifierPAAE23makePropertiesTransform33_71F62EDC1DAE3BBC7A74521E45BA5A66LL8modifier6inputs7outputs15includeGeometry010resolvableE012scrapeableID14AttributeGraph0Y0VyAA0C8NodeListVGSo11AGAttributea_AA01_D6InputsVAA01_D7OutputsVSbAA010ResolvableE0AELLVSgAA010ScrapeableX0VtFZAA0c9ContainerE0V_Tt5g5
        fatalError("TODO")
    }
}

protocol AnyResolvableAccessibilityViewModifier {}

protocol ResolvableAccessibilityModifierRule: Rule, AnyResolvableAccessibilityViewModifier {}
protocol ResolvableAccessibilityModifierStatefulRule: StatefulRule, AnyResolvableAccessibilityViewModifier {}

struct AccessibilityContainerModifier: AccessibilityViewModifier {
    func body(content: Content) -> Never {
        fatalError("TODO") // TODO
    }
    
    private let behavior: AccessibilityChildBehavior
}

struct AccessibilityContainerResolver<T>: AnyResolvableAccessibilityViewModifier {
    
}

fileprivate struct ResolvableModifier {
    var subgraph: Subgraph
    var context: AnyAttribute
    var base: (any AnyResolvableAccessibilityViewModifier.Type)
}

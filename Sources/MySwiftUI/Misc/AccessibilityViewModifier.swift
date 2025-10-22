// 71F62EDC1DAE3BBC7A74521E45BA5A66

#warning("TODO")
internal import AttributeGraph
@_spi(Internal) internal import MySwiftUICore

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
    
    fileprivate static func makePropertiesTransform(
        modifier: AnyAttribute,
        inputs: _ViewInputs,
        outputs: _ViewOutputs,
        includeGeometry: Bool,
        resolvableModifier: ResolvableModifier?,
        scrapeableID: ScrapeableID
    ) -> Attribute<AccessibilityNodeList> {
        // $s7SwiftUI25AccessibilityViewModifierPAAE23makePropertiesTransform33_71F62EDC1DAE3BBC7A74521E45BA5A66LL8modifier6inputs7outputs15includeGeometry010resolvableE012scrapeableID14AttributeGraph0Y0VyAA0C8NodeListVGSo11AGAttributea_AA01_D6InputsVAA01_D7OutputsVSbAA010ResolvableE0AELLVSgAA010ScrapeableX0VtFZAA0c9ContainerE0V_Tt5g5
        // x29 = sp + 0x440
        // x28 = sp + 0x50
        /*
         modifier = sp + 0x344
         inputs = sp + 0x3b8
         outputs = x22
         includeGeometry = sp + 0x390
         resolvableModifier = sp + 0x378
         scrapeableID = sp + 0x360
         */
        // <+828>
        // sp + 0x3a4
        let empty = AnyAttribute.empty
        // sp + 0x31c
        let treeAttribute: AnyAttribute
        if inputs.preferences.contains(AccessibilityAttachment.Key.self) {
            // <+884>
            let tree: Attribute<AccessibilityAttachment.Tree>? = outputs[AccessibilityAttachment.Key.self]
            treeAttribute = tree?.identifier ?? .empty
        } else {
            // <+940>
            treeAttribute = .empty
        }
        
        // <+964>
        /*
         inputs = x21
         outputs = x27
         */
        let size = inputs.size // x22
        let position = inputs.position // sp + 0x3a0
        let transform = inputs.transform // sp + 0x39c
        
        // <+1000>
        // outputs -> sp + 0x338
        // size -> sp + 0x318
        // sp + 0xd0
        let geometryUpdater: AccessibilityGeometryUpdater?
        if includeGeometry && inputs.needsGeometry {
            // sp + 0x50
            let responderUpdater: AccessibilityViewResponderUpdater?
            // <+1044>
            if inputs.base.accessibilityCapturesViewResponders {
                // <+1116>
                // x19
                let viewResponders: Attribute<[ViewResponder]>? = outputs[ViewRespondersKey.self]
                
                responderUpdater = AccessibilityViewResponderUpdater(
                    viewResponders: OptionalAttribute(base: AnyOptionalAttribute(viewResponders?.identifier ?? .empty)),
                    kind: OptionalAttribute(base: AnyOptionalAttribute(.empty)),
                    token: nil,
                    idHash: 0,
                    attachment: nil,
                    subgraph: .current!
                )
                // <+1432>
            } else {
                // <+1400>
                responderUpdater = nil
                // <+1432>
            }
            
            // <+1432>
            if inputs.needsAccessibilityGeometry {
                // <+1476>
                geometryUpdater = AccessibilityGeometryUpdater(
                    size: size,
                    position: position,
                    transform: transform,
                    kind: OptionalAttribute(base: AnyOptionalAttribute(empty)),
                    token: nil,
                    id: UniqueID(),
                    attachment: nil,
                    subgraph: .current!
                )
                // <+1740>
            } else {
                // <+1700>
                geometryUpdater = nil
                // <+1740>
            }
            // <+1740>
            // <+1772>
        } else {
            // <+1320>
            geometryUpdater = nil
            // <+1772>
        }
        
        // <+1772>
        // sp + 0xb0
        let scrapeableParentID = inputs.scrapeableParentID
        // sp + 0x2d0
        let interfaceIdiom = inputs.base.interfaceIdiom
        // sp + 0x3b0
        let environment = inputs.environment
        // sp + 0x3a8
        let viewPhase = inputs.viewPhase
        // sp + 0x438
        let nodes = outputs[AccessibilityNodesKey.self]
        // <+1944>
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

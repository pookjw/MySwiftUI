// 489B6F9C813C627F5CFD569A9BFD092F
internal import MySwiftUICore
private import AttributeGraph
private import RealityKit

struct AccessibilityPlatformEntityModifier : PrimitiveViewModifier, MultiViewModifier {
    private let entity: RealityKit::Entity?
    
    nonisolated static func _makeView(modifier: _GraphValue<AccessibilityPlatformEntityModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> x20
         inputs -> x1 -> x29 - 0x78
         body -> x2/x3 -> x29 - 0x70
         */
        // <+220>
        // w19
        let properties = Attribute<AccessibilityProperties?>(value: nil)
        let entityAttribute = modifier.value.entity
        let attachment = EntityAccessibilityAttachment(entity: entityAttribute, externalProperties: properties)
        let attachmentAttribute = Attribute(attachment)
        let attachmentValue = _GraphValue(attachmentAttribute)
        
        return AccessibilityAttachmentModifier.makeDebuggableView(modifier: attachmentValue, inputs: inputs, body: body)
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<AccessibilityPlatformEntityModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

fileprivate struct EntityAccessibilityAttachment : Rule {
    @Attribute private(set) var entity: Entity?
    @Attribute private(set) var externalProperties: AccessibilityProperties?
    
    var value: AccessibilityAttachmentModifier {
        assertUnimplemented()
    }
}

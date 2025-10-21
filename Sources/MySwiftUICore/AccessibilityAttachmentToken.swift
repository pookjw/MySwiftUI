package import AttributeGraph

package enum AccessibilityAttachmentToken: Hashable, Codable {
    package static func == (lhs: AccessibilityAttachmentToken, rhs: AccessibilityAttachmentToken) -> Bool {
        fatalError("TODO")
    }
    
    case attribute(AnyWeakAttribute)
    case identifier(UInt32)
    
    init(_ attribute: AnyAttribute) {
        self = .attribute(AnyWeakAttribute(attribute: attribute, id: 0))
    }
    
    init<T>(_ attribute: Attribute<T>) {
        self = .attribute(WeakAttribute(attribute).base)
    }
    
    init(_ identifier: UInt32) {
        self = .identifier(identifier)
    }
    
    package init(from decoder: any Decoder) throws {
        fatalError("TODO")
    }
    
    package func encode(to encoder: any Encoder) throws {
        fatalError("TODO")
    }
    
    package func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
}

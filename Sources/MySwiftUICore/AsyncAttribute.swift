internal import AttributeGraph

protocol AsyncAttribute: _AttributeBody {
}

extension AsyncAttribute {
    static var flags: AnyAttribute.TypeFlags {
        return []
    }
}

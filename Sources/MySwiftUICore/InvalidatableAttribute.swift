internal import AttributeGraph

protocol InvalidatableAttribute: _AttributeBody {
    static func willInvalidate(attribute: AnyAttribute)
}

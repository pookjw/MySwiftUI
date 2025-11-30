package import AttributeGraph

package protocol RemovableAttribute: _AttributeBody {
    static func willRemove(attribute: AnyAttribute)
    static func didReinsert(attribute: AnyAttribute)
}

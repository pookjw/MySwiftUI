package import AttributeGraph

extension TypeID {
    package var isValueType: Bool {
        let kind = MetadataKind(self)
        switch kind {
        case .struct, .enum, .optional, .tuple:
            return true
        default:
            return false
        }
    }
}

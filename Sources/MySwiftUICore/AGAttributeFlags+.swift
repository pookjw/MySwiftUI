package import AttributeGraph

extension AnyAttribute.Flags {
    package static var transactional: AnyAttribute.Flags {
        return AnyAttribute.Flags(rawValue: 1 << 0)
    }
    
    package static var removable: AnyAttribute.Flags {
        return AnyAttribute.Flags(rawValue: 1 << 1)
    }
    
    package static var invalidatable: AnyAttribute.Flags {
        return AnyAttribute.Flags(rawValue: 1 << 2)
    }
    
    package static var scrapeable: AnyAttribute.Flags {
        return AnyAttribute.Flags(rawValue: 1 << 3)
    }
}

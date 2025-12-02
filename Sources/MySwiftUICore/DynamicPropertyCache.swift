// A4C1D658B3717A3062FEFC91A812D6EB
#warning("TODO")
private import AttributeGraph

struct DynamicPropertyCache {
    static func fields(of type: any Any.Type) -> DynamicPropertyCache.Fields {
        // type -> x27
        let fields: DynamicPropertyCache.Fields
        if let cached = DynamicPropertyCache.Fields.cache.value[ObjectIdentifier(type)] {
            // <+108>
            fields = cached
            // <+828>
        } else {
            // <+172>
            let metadataKind = MetadataKind(TypeID(type))
            assert(metadataKind == .struct)
            fatalError("TODO")
        }
        
        // <+828>
        fatalError("TODO")
    }
}

extension DynamicPropertyCache {
    struct Fields {
        fileprivate static nonisolated(unsafe) let cache = MutableBox<[ObjectIdentifier: DynamicPropertyCache.Fields]>([:])
        private var layout: DynamicPropertyCache.Fields.Layout
        private var behaviors: DynamicPropertyBehaviors
    }
    
    struct Field {
        private var type: DynamicProperty.Type
        private var offset: Int
        private var name: UnsafePointer<Int8>?
    }
}

extension DynamicPropertyCache.Fields {
    enum Layout {
        case product([DynamicPropertyCache.Field])
        case sum(any Any.Type, [DynamicPropertyCache.TaggedFields])
    }
}

extension DynamicPropertyCache {
    struct TaggedFields {
        private var tag: Int
        private var fields: [DynamicPropertyCache.Field]
    }
}

struct DSLDynamicPropertyCache {
    
}

extension DSLDynamicPropertyCache {
    struct Fields {
        private let base: DynamicPropertyCache.Fields
    }
}

struct DynamicPropertyBehaviors {
    private let rawValue: UInt32
}

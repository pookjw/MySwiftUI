#warning("TODO")

struct DynamicPropertyCache {
    static func fields(of type: any Any.Type) -> DynamicPropertyCache.Fields {
        fatalError("TODO")
    }
}

extension DynamicPropertyCache {
    struct Fields {
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

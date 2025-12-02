// A4C1D658B3717A3062FEFC91A812D6EB
#warning("TODO")
private import AttributeGraph
private import os.log

struct DynamicPropertyCache {
    fileprivate static nonisolated(unsafe) let cache = MutableBox<[ObjectIdentifier: DynamicPropertyCache.Fields]>([:])
    
    static func fields(of type: any Any.Type) -> DynamicPropertyCache.Fields {
        // x29 = sp + 0x80
        // type -> x27
        if let cached = DynamicPropertyCache.cache.value[ObjectIdentifier(type)] {
            // <+108>
            return cached
        } else {
            // <+172>
            let metadataKind = MetadataKind(TypeID(type))
            
            let checkIssue: Bool // true = <+496> / false = <+684>
            // x24(associated value), w23(case), w21(behaviors)
            var result: DynamicPropertyCache.Fields
            
            switch metadataKind {
            case .enum, .optional:
                // <+364>
                var taggedFields: [DynamicPropertyCache.TaggedFields] = []
                TypeID(type).forEachField(options: [.unknown1, .unknown2]) { name, offset, type in
                    // $s7SwiftUI20DynamicPropertyCacheV6fields2ofAC6FieldsVypXp_tFZSbSPys4Int8VG_SiypXptXEfU0_TA
                    var fields: [DynamicPropertyCache.Field] = []
                    let tupleType = TupleType(type)
                    for index in tupleType.indices {
                        guard let casted = tupleType.type(at: index) as? any DynamicProperty.Type else {
                            continue
                        }
                        
                        let offset = tupleType.offset(at: index, as: casted)
                        let field = DynamicPropertyCache.Field(type: casted, offset: offset, name: name)
                        fields.append(field)
                    }
                    
                    if !fields.isEmpty {
                        let value = DynamicPropertyCache.TaggedFields(tag: offset, fields: fields)
                        taggedFields.append(value)
                    }
                    
                    return true
                }
                
                result = DynamicPropertyCache.Fields(.sum(type, taggedFields))
                // <+496>
                checkIssue = true
            case .tuple, .struct:
                // <+224>
                // x22
                var fields: [DynamicPropertyCache.Field] = []
                TypeID(type).forEachField(options: .unknown1) { name, offset, type in
                    // $s7SwiftUI20DynamicPropertyCacheV6fields2ofAC6FieldsVypXp_tFZSbSPys4Int8VG_SiypXptXEfU_TA
                    guard let casted = type as? any DynamicProperty.Type else {
                        return true
                    }
                    
                    fields.append(DynamicPropertyCache.Field(type: casted, offset: offset, name: name))
                    return true
                }
                
                result = DynamicPropertyCache.Fields(.product(fields))
                
                for field in fields {
                    // <+304>
                    result.behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                }
                
                // <+488>
                checkIssue = true
            default:
                // <+468>
                result = DynamicPropertyCache.Fields(.product([]))
                // <+684>
                checkIssue = false
            }
            
            if checkIssue {
                // <+496>
                if result.behaviors.contains([.allowsAsync, .requiresMainThread]) {
                    os_log(.fault, log: Log.runtimeIssuesLog, "%s is marked async, but contains properties that require the main thread.", _typeName(type, qualified: true))
                }
            }
            
            // <+684>
            DynamicPropertyCache.cache.value[ObjectIdentifier(type)] = result
            return result
        }
    }
}

extension DynamicPropertyCache {
    struct Fields {
        private(set) var layout: DynamicPropertyCache.Fields.Layout
        var behaviors: DynamicPropertyBehaviors
        
        init(_ layout: DynamicPropertyCache.Fields.Layout) {
            var behaviors: DynamicPropertyBehaviors = []
            switch layout {
            case .product(let array):
                for field in array {
                    behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                }
            case .sum(_, let taggedFields):
                for taggedField in taggedFields {
                    for field in taggedField.fields {
                        behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                    }
                }
            }
            
            self.layout = layout
            self.behaviors = behaviors
        }
        
        func name(at index: Int) -> String? {
            fatalError("TODO")
        }
        
        func _name(at index: Int) -> UnsafePointer<UInt8>? {
            fatalError("TODO")
        }
    }
    
    struct Field {
        private(set) var type: DynamicProperty.Type
        private(set) var offset: Int
        private var name: UnsafePointer<Int8>?
        
        // 원래 없음
        @inline(__always)
        fileprivate init(type: any DynamicProperty.Type, offset: Int, name: UnsafePointer<Int8>?) {
            self.type = type
            self.offset = offset
            self.name = name
        }
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
        private(set) var tag: Int
        private(set) var fields: [DynamicPropertyCache.Field]
        
        // 원래 없음
        @inline(__always)
        fileprivate init(tag: Int, fields: [DynamicPropertyCache.Field]) {
            self.tag = tag
            self.fields = fields
        }
    }
}

struct DSLDynamicPropertyCache {
    
}

extension DSLDynamicPropertyCache {
    struct Fields {
        private let base: DynamicPropertyCache.Fields
    }
}

struct DynamicPropertyBehaviors: OptionSet {
    static var allowsAsync: DynamicPropertyBehaviors {
        return DynamicPropertyBehaviors(rawValue: 1 << 0)
    }
    
    static var requiresMainThread: DynamicPropertyBehaviors {
        return DynamicPropertyBehaviors(rawValue: 1 << 1)
    }
    
    let rawValue: UInt32
}

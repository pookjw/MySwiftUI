// A4C1D658B3717A3062FEFC91A812D6EB
private import AttributeGraph
private import os.log

struct DynamicPropertyCache {
    @safe fileprivate static nonisolated(unsafe) let cache = unsafe MutableBox<[ObjectIdentifier: DynamicPropertyCache.Fields]>([:])
    
    static func fields(of type: any Any.Type) -> DynamicPropertyCache.Fields {
        // x29 = sp + 0x80
        // type -> x27
        if let cached = unsafe DynamicPropertyCache.cache.value[ObjectIdentifier(type)] {
            // <+108>
            return unsafe cached
        } else {
            // <+172>
            let metadataKind = MetadataKind(TypeID(type))
            
            let checkIssue: Bool // true = <+496> / false = <+684>
            // x24(associated value), w23(case), w21(behaviors)
            var result: DynamicPropertyCache.Fields
            
            switch metadataKind {
            case .enum, .optional:
                // <+364>
                var taggedFields: [DynamicPropertyCache.TaggedFields] = unsafe []
                _ = unsafe TypeID(type).forEachField(options: [.unknown1, .unknown2]) { name, offset, type in
                    // $s7SwiftUI20DynamicPropertyCacheV6fields2ofAC6FieldsVypXp_tFZSbSPys4Int8VG_SiypXptXEfU0_TA
                    var fields: [DynamicPropertyCache.Field] = unsafe []
                    let tupleType = TupleType(type)
                    for index in tupleType.indices {
                        guard let casted = tupleType.type(at: index) as? any DynamicProperty.Type else {
                            continue
                        }
                        
                        let offset = tupleType.offset(at: index, as: casted)
                        let field = unsafe DynamicPropertyCache.Field(type: casted, offset: offset, name: name)
                        unsafe fields.append(field)
                    }
                    
                    if unsafe !fields.isEmpty {
                        let value = unsafe DynamicPropertyCache.TaggedFields(tag: offset, fields: fields)
                        unsafe taggedFields.append(value)
                    }
                    
                    return true
                }
                
                unsafe result = unsafe DynamicPropertyCache.Fields(.sum(type, taggedFields))
                // <+496>
                checkIssue = true
            case .tuple, .struct:
                // <+224>
                // x22
                var fields: [DynamicPropertyCache.Field] = unsafe []
                _ = unsafe TypeID(type).forEachField(options: .unknown1) { name, offset, type in
                    // $s7SwiftUI20DynamicPropertyCacheV6fields2ofAC6FieldsVypXp_tFZSbSPys4Int8VG_SiypXptXEfU_TA
                    guard let casted = type as? any DynamicProperty.Type else {
                        return true
                    }
                    
                    unsafe fields.append(DynamicPropertyCache.Field(type: casted, offset: offset, name: name))
                    return true
                }
                
                unsafe result = unsafe DynamicPropertyCache.Fields(.product(fields))
                
                for unsafe field in unsafe fields {
                    // <+304>
                    unsafe result.behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                }
                
                // <+488>
                checkIssue = true
            default:
                // <+468>
                unsafe result = unsafe DynamicPropertyCache.Fields(.product([]))
                // <+684>
                checkIssue = false
            }
            
            if checkIssue {
                // <+496>
                if unsafe result.behaviors.contains([.allowsAsync, .requiresMainThread]) {
                    unsafe os_log(.fault, log: Log.runtimeIssuesLog, "%s is marked async, but contains properties that require the main thread.", _typeName(type, qualified: true))
                }
            }
            
            // <+684>
            unsafe DynamicPropertyCache.cache.value[ObjectIdentifier(type)] = result
            return unsafe result
        }
    }
}

extension DynamicPropertyCache {
    @unsafe struct Fields {
        private(set) var layout: DynamicPropertyCache.Fields.Layout
        var behaviors: DynamicPropertyBehaviors
        
        init(_ layout: DynamicPropertyCache.Fields.Layout) {
            var behaviors: DynamicPropertyBehaviors = []
            switch unsafe layout {
            case .product(let array):
                for unsafe field in unsafe array {
                    unsafe behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                }
            case .sum(_, let taggedFields):
                for unsafe taggedField in unsafe taggedFields {
                    for unsafe field in unsafe taggedField.fields {
                        unsafe behaviors.insert(DynamicPropertyBehaviors(rawValue: field.type._propertyBehaviors))
                    }
                }
            }
            
            unsafe self.layout = unsafe layout
            unsafe self.behaviors = behaviors
        }
        
        func name(at offset: Int) -> String? {
            guard let buffer = unsafe _name(at: offset) else {
                return nil
            }
            
            return unsafe String(cString: buffer, encoding: .utf8)
        }
        
        func _name(at offset: Int) -> UnsafePointer<Int8>? {
            switch unsafe layout {
            case .product(let fields):
                for unsafe field in unsafe fields {
                    if unsafe field.offset == offset {
                        return unsafe field.name
                    }
                }
                return nil
            case .sum(_, _):
                return nil
            }
        }
    }
    
    @unsafe struct Field {
        private(set) var type: DynamicProperty.Type
        private(set) var offset: Int
        fileprivate private(set) var name: UnsafePointer<Int8>?
        
        // 원래 없음
        @inline(__always)
        fileprivate init(type: any DynamicProperty.Type, offset: Int, name: UnsafePointer<Int8>?) {
            unsafe self.type = type
            unsafe self.offset = offset
            unsafe self.name = unsafe name
        }
    }
}

extension DynamicPropertyCache.Fields {
    @unsafe enum Layout {
        case product([DynamicPropertyCache.Field])
        case sum(any Any.Type, [DynamicPropertyCache.TaggedFields])
    }
}

extension DynamicPropertyCache {
    @unsafe struct TaggedFields {
        private(set) var tag: Int
        private(set) var fields: [DynamicPropertyCache.Field]
        
        // 원래 없음
        @inline(__always)
        fileprivate init(tag: Int, fields: [DynamicPropertyCache.Field]) {
            unsafe self.tag = tag
            unsafe self.fields = fields
        }
    }
}

struct DSLDynamicPropertyCache {
    
}

extension DSLDynamicPropertyCache {
    @safe struct Fields {
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

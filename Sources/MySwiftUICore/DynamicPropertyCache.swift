// A4C1D658B3717A3062FEFC91A812D6EB
#warning("TODO")
private import AttributeGraph
private import os.log

struct DynamicPropertyCache {
    static func fields(of type: any Any.Type) -> DynamicPropertyCache.Fields {
        // x29 = sp + 0x80
        // type -> x27
        if let cached = DynamicPropertyCache.Fields.cache.value[ObjectIdentifier(type)] {
            // <+108>
            return cached
        } else {
            // <+172>
            let metadataKind = MetadataKind(TypeID(type))
            
            // emptyArray -> x22
            var fields: [DynamicPropertyCache.TaggedFields] = []
            
            var w21: UInt8
            var w23: UInt8
            var x24: UInt
            let checkIssue: Bool // true = <+496> / false = <+684>
            let result: DynamicPropertyCache.Fields
            
            switch metadataKind {
            case .enum, .optional:
                // <+364>
                fatalError("TODO")
                // <+496>
                checkIssue = true
            case .tuple, .struct:
                // <+224>
                AGTypeApplyFields2(type: type, options: .unknown1) { _, _, _ in
                    // $s7SwiftUI20DynamicPropertyCacheV6fields2ofAC6FieldsVypXp_tFZSbSPys4Int8VG_SiypXptXEfU_TA
                    fatalError("TODO")
                }
                
                w21 = 0
                
                for field in fields {
                    // <+304>
                    // w21 바꾸는 것 같음
                    fatalError("TODO")
                }
                
                // <+488>
                w23 = 0
                x24 = 0
                checkIssue = true
                fatalError("TODO")
            default:
                // <+468>
                w23 = 0
                x24 = 0
                w21 = 0
                // <+684>
                checkIssue = false
                fatalError("TODO")
            }
            
            if checkIssue {
                // <+496>
                if (3 & ~w21) != 0 {
                    os_log(.fault, log: Log.runtimeIssuesLog, "%s is marked async, but contains properties that require the main thread.", _typeName(type, qualified: true))
                }
            }
            
            // <+684>
            DynamicPropertyCache.Fields.cache.value[ObjectIdentifier(type)] = result
            return result
        }
    }
}

extension DynamicPropertyCache {
    struct Fields {
        fileprivate static nonisolated(unsafe) let cache = MutableBox<[ObjectIdentifier: DynamicPropertyCache.Fields]>([:]) // 위치가 여기가 아닐 수도
        private var layout: DynamicPropertyCache.Fields.Layout
        private var behaviors: DynamicPropertyBehaviors
        
        init(_ layout: DynamicPropertyCache.Fields.Layout) {
            fatalError("TODO")
        }
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

struct DynamicPropertyBehaviors: OptionSet {
    static var allowsAsync: DynamicPropertyBehaviors {
        return DynamicPropertyBehaviors(rawValue: 1 << 0)
    }
    
    static var requiresMainThread: DynamicPropertyBehaviors {
        return DynamicPropertyBehaviors(rawValue: 1 << 1)
    }
    
    let rawValue: UInt32
}

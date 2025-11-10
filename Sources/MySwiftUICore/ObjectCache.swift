// FCB2944DC319042A861E82C8B244E212

#warning("TODO")

final class ObjectCache<Key: Hashable, Value>: @unchecked Sendable {
    private let constructor: (Key) -> Value
    @AtomicBox private var data: ObjectCache<Key, Value>.Data
    
    init(constructor: @escaping (Key) -> Value) {
        self.constructor = constructor
        self._data = AtomicBox(wrappedValue: ObjectCache<Key, Value>.Data())
    }
    
    subscript(_ key: Key) -> Value {
        /*
         self = x24
         key = x21
         */
        let hash = key.hashValue
        
        let existing = $data.access { data -> Value? in
            // x29 + sp + 0x1a0
            // $s7SwiftUI11ObjectCacheCyq_xcigq_SgAC4Data33_FCB2944DC319042A861E82C8B244E212LLVyxq__GzXEfU_
            // data pointer = x23 / sp + 0x108
            
            fatalError("TODO")
        }
        
        fatalError("TODO")
    }
}

extension ObjectCache {
    fileprivate struct Data {
        fileprivate var table: [ObjectCache<Key, Value>.Item]
        private var clock: UInt32
        
        init() {
            let item = ObjectCache<Key, Value>.Item(data: nil, used: 0)
            self.table = Array(repeating: item, count: 32)
            self.clock = 0
        }
    }
    
    fileprivate struct Item {
        fileprivate var data: (key: Key, hash: Int, value: Value)?
        private var used: UInt32
        
        init(data: (key: Key, hash: Int, value: Value)?, used: UInt32) {
            self.data = data
            self.used = used
        }
    }
}

// FCB2944DC319042A861E82C8B244E212

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
        // sp + 0x48
        let shift = ((hash & 0b111) << 2)
        // sp + 0xa8
        var num1 = 0
        // sp + 0xa4
        var num2 = Int32.min
        // key = sp + 0x50
        // hash = sp + 0x58
        
        let existing = $data.access { data -> Value? in
            // x29 + sp + 0x1a0
            // $s7SwiftUI11ObjectCacheCyq_xcigq_SgAC4Data33_FCB2944DC319042A861E82C8B244E212LLVyxq__GzXEfU_
            /*
             shift = sp + 0x138
             hash = sp + 0xf8
             key = sp + 0xc0
             num2 = sp + 0xd8
             num1 = sp + 0xe8
             */
            // data pointer = x23 / sp + 0x108
            for x28 in 0..<4 {
                let x23 = x28 + shift
                let item = data.table[x23]
                
                if let loaded = item.data {
                    // <+568>
                    if (loaded.hash == hash), (loaded.key == key) {
                        // <+780>
                        data.clock &+= 1
                        data.table[x23].used = data.clock
                        return loaded.value
                    } else {
                        // <+640>
                        let x8 = Int32(data.clock &- data.table[x23].used)
                        if num2 < x8 {
                            // <+396>
                            num1 = x28
                            num2 = x8
                        }
                        // <+408>
                        continue
                    }
                } else {
                    // <+524>
                    if num2 != .max {
                        // <+396>
                        num1 = x28
                        num2 = .max
                    }
                    // <+408>
                    continue
                }
            }
            
            return nil
        }
        
        if let existing {
            return existing
        } else {
            let value = constructor(key)
            $data.access { data in
                // $s7SwiftUI11ObjectCacheCyq_xcigyAC4Data33_FCB2944DC319042A861E82C8B244E212LLVyxq__GzXEfU0_
                // x29 = sp + 0xc0
                /*
                 data = x0 = x20
                 shift = x1 = sp + 0x78
                 num1 = x2 = sp + 0x68
                 key = x3 = sp + 0x58
                 hash = x4 = sp + 0x60
                 value = x5 = x25
                 */
                num1 += shift
                data.clock &+= 1
                let item = ObjectCache.Item(data: (key: key, hash: hash, value: value), used: data.clock)
                data.table[num1] = item
            }
            
            return value
        }
    }
}

extension ObjectCache {
    fileprivate struct Data {
        fileprivate var table: [ObjectCache<Key, Value>.Item]
        fileprivate var clock: UInt32
        
        init() {
            let item = ObjectCache<Key, Value>.Item(data: nil, used: 0)
            self.table = Array(repeating: item, count: 32)
            self.clock = 0
        }
    }
    
    fileprivate struct Item {
        fileprivate var data: (key: Key, hash: Int, value: Value)?
        fileprivate var used: UInt32
        
        init(data: (key: Key, hash: Int, value: Value)?, used: UInt32) {
            self.data = data
            self.used = used
        }
    }
}

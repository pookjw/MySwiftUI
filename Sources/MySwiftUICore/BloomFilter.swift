struct BloomFilter: Equatable {
    @usableFromInline var value: UInt
    
    init() {
        value = 0
    }
    
    init(hashValue: Int) {
        value = (1 &<< ((hashValue &>> 4))) | (1 &<< ((hashValue &>> 10))) | (1 &<< ((hashValue >> 16)))
    }
    
    init<T: Hashable>(value: T) {
        self.init(hashValue: value.hashValue)
    }
    
    @inlinable
    init(type: Any.Type) {
        self.init(hashValue: Int(bitPattern: ObjectIdentifier(type)))
    }
    
    func mayContain(_ other: BloomFilter) -> Bool {
        return ((other.value & ~value) == 0)
    }
    
    mutating func formUnion(_ other: BloomFilter) {
        value |= other.value
    }
    
    func union(_ other: BloomFilter) -> BloomFilter {
        var copy = self
        copy.value |= other.value
        return copy
    }
    
    var isEmpty: Bool {
        return value == 0
    }
}

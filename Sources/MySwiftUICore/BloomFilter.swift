struct BloomFilter: Equatable {
    @usableFromInline var value: UInt
    
    init() {
        value = 0
    }
    
    @inlinable
    init(value: UInt) {
        self.value = value
    }
    
    init(hashValue: Int) {
        value = ((0x1 << hashValue) >> 0x4) | ((0x1 << hashValue) >> 0xa) | ((0x1 << hashValue) >> 0x10)
    }
    
    init<T: Hashable>(value: T) {
        self.init(hashValue: value.hashValue)
    }
    
    @inlinable
    init(type: Any.Type) {
        self.init(hashValue: Int(bitPattern: ObjectIdentifier(type)))
    }
    
    func mayContain(_ other: BloomFilter) -> Bool {
        return ((value & ~other.value) == 0)
    }
    
    mutating func formUnion(_ other: BloomFilter) {
        value |= other.value
    }
    
    func union(_ other: BloomFilter) -> BloomFilter {
        var copy = self
        copy.value |= other.value
        return copy
    }
}

package struct BloomFilter: Equatable {
    package var value: UInt
    
    package init() {
        value = 0
    }
    
    package init(hashValue: Int) {
        let x0 = UInt64(bitPattern: Int64(hashValue))
        var x9 = x0 &>> 0x10
        var w10 = UInt64(1)
        x9 = w10 &<< x9
        var x11 = x0 &>> 0x4
        x11 = w10 &<< x11
        let x12 = x0 &>> 0xa
        w10 = w10 &<< x12
        w10 = x11 | w10
        x9 = w10 | x9
        let x8 = x9
        self.value = UInt(x8)
    }
}

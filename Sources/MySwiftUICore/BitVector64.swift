public struct BitVector64: OptionSet {
    public var rawValue: UInt64
    
    public init() {
        self.rawValue = 0
    }
    
    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }
    
    subscript(bit: Int) -> Bool {
        get {
            let bit = UInt64(bit)
            var x9 = (1 &<< bit)
            x9 = (bit < 0x40) ? x9 : 0
            return (rawValue & x9) != 0
        }
        mutating set {
            let bit = UInt64(bit)
            
            let x8: UInt64
            if bit < 0x40 {
                x8 = (1 &<< bit)
            } else {
                x8 = 0
            }
            
            if newValue {
                self.rawValue = rawValue | x8
            } else {
                self.rawValue = rawValue & ~x8
            }
        }
    }
}

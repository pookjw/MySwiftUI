// F99DF4753FB5F5765C388695646E450B

package struct VersionSeed : CustomStringConvertible {
    private(set) var value: UInt32
    
    init(nodeId: UInt32, viewSeed: UInt32) {
        self.value = merge32(nodeId, viewSeed)
    }
    
    package static var invalid: VersionSeed {
        return VersionSeed(value: .max)
    }
    
    package static var empty: VersionSeed {
        return VersionSeed(value: 0)
    }
    
    package func matches(_ other: VersionSeed) -> Bool {
        if self.value != .max {
            return self.value == other.value
        } else {
            return false
        }
    }
    
    package mutating func merge(_ other: VersionSeed) {
        if self.isInvalid || other.isEmpty {
            return
        }
        
        if self.isEmpty || other.isInvalid {
            self = other
            return
        }
        
        self.value = merge32(self.value, other.value)
    }
    
    package var isEmpty: Bool {
        return self.value == VersionSeed.empty.value
    }
    
    package init(value: UInt32) {
        self.value = value
    }
    
    var isInvalid: Bool {
        return self.value == VersionSeed.invalid.value
    }
    
    mutating func mergeValue(_ value: UInt32) {
        guard !isInvalid else {
            return
        }
        
        guard !isEmpty else {
            self.value = value
            return
        }
        
        self.value = merge32(self.value, value)
    }
    
    package var description: String {
        if self.value == VersionSeed.empty.value {
            return "empty"
        } else if self.value == VersionSeed.invalid.value {
            return "invalid"
        } else {
            return "\(value)"
        }
    }
}

extension VersionSeed : BitwiseCopyable {}

fileprivate func merge32(_ first: UInt32, _ second: UInt32) -> UInt32 {
    var x8 = UInt(second)
    var x9 = (x8 | (UInt(first) &<< 32))
    let x10 = UInt.max
    x8 = (x10 ^ (x8 &<< 32))
    x8 = x9 &+ x8
    x8 = (x8 ^ (x8 &>> 22))
    x9 = (x10 ^ (x8 &<< 13))
    x8 = x8 &+ x9
    x8 = (x8 ^ (x8 &>> 8))
    x8 = (x8 &+ (x8 &<< 3))
    x8 = (x8 ^ (x8 &>> 15))
    x9 = (x10 ^ (x8 &<< 27))
    x8 = x8 &+ x9
    x9 = x8 &>> 31
    
    return UInt32(truncatingIfNeeded: x9) ^ UInt32(truncatingIfNeeded: x8)
}

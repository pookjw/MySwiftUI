
package struct VersionSeed: CustomStringConvertible {
    private(set) var value: UInt32
    
    package init(value: UInt32) {
        self.value = value
    }
    
    package static var invalid: VersionSeed {
        return VersionSeed(value: .max)
    }
    
    package static var empty: VersionSeed {
        return VersionSeed(value: 0)
    }
    
    package mutating func merge(_ other: VersionSeed) {
        fatalError("TODO")
    }
    
    @inlinable
    package func matches(_ other: VersionSeed) -> Bool {
        if self.value != .max {
            return self.value == other.value
        } else {
            return false
        }
    }
    
    package var description: String {
        fatalError("TODO")
    }
}

extension VersionSeed: BitwiseCopyable {}

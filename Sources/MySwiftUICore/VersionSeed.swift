#warning("TODO")

package struct VersionSeed {
    private var value: UInt32
    
    package init(value: UInt32) {
        self.value = value
    }
    
    package static var invalid: VersionSeed {
        return VersionSeed(value: .max)
    }
    
    package static var empty: VersionSeed {
        return VersionSeed(value: 0)
    }
}

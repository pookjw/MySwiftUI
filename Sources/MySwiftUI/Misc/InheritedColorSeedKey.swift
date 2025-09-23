internal import MySwiftUICore

struct InheritedColorSeedKey: EnvironmentKey {
    static var defaultValue: UInt32 { return 0 }
    
    static func _valuesEqual(_ lhs: VersionSeed, _ rhs: VersionSeed) -> Bool {
        fatalError("TODO")
    }
}

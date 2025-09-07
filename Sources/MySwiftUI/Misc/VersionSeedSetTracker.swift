#warning("TODO")
internal import MySwiftUICore

struct VersionSeedSetTracker {
    fileprivate var values: [Value] = []
    
    mutating func addPreference<T: HostPreferenceKey>(_ key: T.Type) {
        values.append(VersionSeedSetTracker.Value(key: key, seed: .invalid))
    }
    
    func hasChanges(in values: PreferenceValues) -> Bool {
        fatalError("TODO")
    }
    
    func updateSeedsToEmpty() {
        fatalError("TODO")
    }
    
    func updateSeeds(to values: PreferenceValues) {
        fatalError("TODO")
    }
}

extension VersionSeedSetTracker {
    fileprivate struct Value {
        var key: any PreferenceKey.Type
        var seed: VersionSeed
    }
}

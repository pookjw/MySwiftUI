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
    
    mutating func updateSeedsToEmpty() {
        var copy = values
        for index in copy.indices {
            copy[index].seed = .empty
        }
        self.values = copy
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

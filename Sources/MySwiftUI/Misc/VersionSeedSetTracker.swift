#warning("TODO")
internal import MySwiftUICore

struct VersionSeedSetTracker {
    fileprivate var values: [Value] = []
    
    mutating func addPreference<T: HostPreferenceKey>(_ key: T.Type) {
        values.append(VersionSeedSetTracker.Value(key: key, seed: .invalid))
    }
    
    func hasChanges(in preferenceValues: PreferenceValues) -> Bool {
        for value in values {
            if !value.seed.matches(preferenceValues.seed(for: value.key)) {
                return true
            }
        }
        
        return false
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

extension PreferenceValues {
    fileprivate func seed<T: PreferenceKey>(for type: T.Type) -> VersionSeed {
        return self[type].seed
    }
}

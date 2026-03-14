// 3F0A9C8FE1DF482BB97A7ECFF3793F1B
internal import MySwiftUICore

struct VersionSeedSetTracker {
    fileprivate var values: [VersionSeedSetTracker.Value] = []
    
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
    
    mutating func updateSeeds(to preferences: PreferenceValues) {
        /*
         self -> x20 -> x19
         preferences -> x0 -> x20 -> sp + 0x68
         */
        // self.values -> x27
        // index -> x24
        for (index, value) in values.enumerated() {
            let newSeed = preferences.seed(for: value.key)
            values[index].seed = newSeed
        }
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

internal import MySwiftUICore

struct VersionSeedTracker<T: HostPreferenceKey> {
    var seed: VersionSeed
    
    mutating func didChange(_ preferences: PreferenceValues, action: (T.Value) -> Void) -> Bool {
        /*
         self -> x20 -> x22
         preferences -> x0 -> x20
         action -> x29 - 0xf0 / x21
         */
        // x25
        let newValue = preferences[T.self]
        // x27
        let matches = self.seed.matches(newValue.seed)
        
        if !matches {
            self.seed = newValue.seed
            let value = newValue.value
            action(value)
        }
        
        return !matches
    }
}

#warning("TODO")

package struct PreferenceValues {
    var seed: VersionSeed {
        fatalError("TODO")
    }
    
    package subscript<T: PreferenceKey>(_ key: T.Type) -> Value<T.Value> {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
}

extension PreferenceValues {
    package struct Value<T> {
        // TODO
        package var value: T
        package var seed: VersionSeed
    }
}

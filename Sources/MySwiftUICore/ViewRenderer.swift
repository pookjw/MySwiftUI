#warning("TODO")

package protocol ViewRendererHost: ViewGraphOwner, ViewGraphRootValueUpdater {
    
}

extension ViewRendererHost {
    package func preferenceValue<T: HostPreferenceKey>(_ type: T.Type) -> T.Value {
        fatalError("TODO")
    }
}

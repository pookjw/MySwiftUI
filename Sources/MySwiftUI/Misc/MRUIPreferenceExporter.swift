#warning("TODO")
internal import MRUIKit
private import MySwiftUICore

class MRUIPreferenceExporter {
    var host: MRUIPreferenceHost?
    private var exportedPreferences: [any AnyExportedPreference]
    
    init() {
        fatalError("TODO")
    }
}

fileprivate protocol AnyExportedPreference {
    func addPreference(to graph: ViewGraph)
    func apply(to host: MRUIPreferenceHost)
    func preferencesDidChange(_ values: PreferenceValues)
}

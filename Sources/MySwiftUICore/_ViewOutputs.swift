#warning("TODO")
internal import AttributeGraph

public struct _ViewOutputs {
    var preferences = PreferencesOutputs()
    @OptionalAttribute var layoutComputer: LayoutComputer?
    
    init() {
        self._layoutComputer = OptionalAttribute()
    }
}

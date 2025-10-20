#warning("TODO")
internal import AttributeGraph

public struct _ViewOutputs {
    private(set) var preferences = PreferencesOutputs()
    @OptionalAttribute var layoutComputer: LayoutComputer?
    
    init() {
        self._layoutComputer = OptionalAttribute()
    }
}

@available(*, unavailable)
extension _ViewOutputs: Sendable {}

internal import AttributeGraph

@_spi(Internal) public struct _GestureOutputs<T> {
    var phase: Attribute<GesturePhase<T>>
    @OptionalAttribute var _debugData: GestureDebug.Data?
    var preferences: PreferencesOutputs
}

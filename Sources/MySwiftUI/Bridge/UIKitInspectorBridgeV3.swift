internal import ObjectiveC
internal import MySwiftUICore

class UIKitInspectorBridgeV3: NSObject {
    final func updateInspectorIfNeeded(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    }
    
    final func updatePopoverIfNeeded(
        _: PreferenceValues.Value<[PopoverPresentation]>,
        presentationOptionsPreference: PreferenceValues.Value<PresentationOptionsPreference>,
        backgroundPreference: PreferenceValues.Value<ContainerBackgroundKeys.Transparency>
    ) {
        fatalError("TODO")
    }
}

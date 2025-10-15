#warning("TODO")
internal import MySwiftUICore

struct PresentationOptionsPreference {
//    private var detents: Set<PresentationDetent>
//    private var selection: Binding<PresentationDetent>?
//    private var horizontalAdaptation: PresentationAdaptation?
//    private var verticalAdaptation: PresentationAdaptation?
//    private var dimmingBehavior: PresentationDimmingBehavior?
//    private var passthroughBehavior: PresentationPassthroughBehavior?
//    private var swipeUpBehavior: PresentationContentInteraction
//    private var dragIndicatorVisibility: Visibility
//    private var cornerRadius: CGFloat?
//    private var dragIndicatorOffset: CGFloat?
//    private var sizing: PresentationSizing?
//    private var breakthroughEffect: BreakthroughEffect?
//    private var useFormSheetSPISizing: Bool
//    private var popoverEdgeAppearance: PopoverEdgeAppearance?
}

struct PresentationOptionsPreferenceKey: HostPreferenceKey {
    static let defaultValue = PresentationOptionsPreference()
    
    static func reduce(value: inout PresentationOptionsPreference, nextValue: () -> PresentationOptionsPreference) {
        fatalError("TODO")
    }
}

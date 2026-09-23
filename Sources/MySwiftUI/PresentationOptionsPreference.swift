internal import MySwiftUICore
private import CoreGraphics

struct PresentationOptionsPreference : CustomStringConvertible { // 0x8c
    private(set) var detents: Set<PresentationDetent> = [] // 0x0
    private(set) var selection: Binding<PresentationDetent>? = nil // 0x8
    private var horizontalAdaptation: PresentationAdaptation? = nil // 0x28
    private var verticalAdaptation: PresentationAdaptation? = nil // 0x29
    private(set) var dimmingBehavior: PresentationDimmingBehavior? = nil // 0x30
    private var passthroughBehavior: PresentationPassthroughBehavior? = nil // 0x38
    private var swipeUpBehavior: PresentationContentInteraction = .automatic // 0x39
    private var dragIndicatorVisibility: Visibility = .automatic // 0x3a
    private var cornerRadius: CGFloat? = nil // 0x40
    private var dragIndicatorOffset: CGFloat? = nil // 0x50
    private(set) var sizing: (any PresentationSizing)? = nil // 0x60
    private var breakthroughEffect: BreakthroughEffect? = .automatic // 0x88
    private(set) var useFormSheetSPISizing: Bool = false // 0x8a
    private(set) var popoverEdgeAppearance: PopoverEdgeAppearance? = nil // 0x8b
    
    func sheetConfigurationChanged(from other: PresentationOptionsPreference?) -> Bool {
        assertUnimplemented()
    }
    
    func differenceMessage(from other: PresentationOptionsPreference) -> String {
        assertUnimplemented()
    }
    
    func merge(_ other: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}

struct PresentationOptionsPreferenceKey : HostPreferenceKey {
    @safe static nonisolated(unsafe) let defaultValue = PresentationOptionsPreference()
    
    static func reduce(value: inout PresentationOptionsPreference, nextValue: () -> PresentationOptionsPreference) {
        assertUnimplemented()
    }
}

// 5DC34A041A6C09E9E4C9CD56F2FF7361
@_spi(Internal) internal import MySwiftUICore
internal import UIKit

class ListCollectionViewCellBase<T : View>: AnyListCollectionViewCell, UIHostingViewDelegate {
    var lastConfiguration: UIListContentConfiguration? = nil
    var popUpButtonSeed: VersionSeedTracker<BridgedPopUpButtonPreferenceKey>
    var selectionBehavior: PlatformItemList.Item.SelectionBehavior? = nil
    var shouldHugContent: Bool = false
    var uniformHeight: CGFloat? = nil
    var viewListID: _ViewList_ID? = nil
    var _secondaryNavigationBehavior: PlatformItemList.Item.SecondaryNavigationBehavior? = nil
    
    private var cellHostWidth: CGFloat? = nil
    private var hoverEffectConfiguration: ListRowHoverEffectConfiguration
    private var wasEditing: Bool = false
    private var wasSwiped: Bool = false
    
    var hostParentView: UIView {
        assertUnimplemented()
    }
    
    var isSupplementary: Bool {
        assertUnimplemented()
    }
    
    private var avoidOffScreenRendering: Bool {
        assertUnimplemented()
    }
    
    private var canUpdateSwipeActionPresentationBinding: Bool {
        assertUnimplemented()
    }
    
    func prominentConfigForContent(state: UICellConfigurationState, contentViewMargins: NSDirectionalEdgeInsets) -> UIListContentConfiguration {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, willUpdate environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, didUpdate environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, willUpdate properties: inout ViewGraphBridgeProperties) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, didChangePreferences preferences: PreferenceValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList list: PlatformItemList) {
        assertUnimplemented()
    }
    
    func hostingView<Content : View>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout _ViewInputs) {
        assertUnimplemented()
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration, suggestedActions: [UIMenuElement]) -> UIMenu? {
        assertUnimplemented()
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, targetRectFor configuration: UIEditMenuConfiguration) -> CGRect {
        assertUnimplemented()
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, willDismissMenuFor configuration: UIEditMenuConfiguration, animator: any UIEditMenuInteractionAnimating) {
        assertUnimplemented()
    }
    
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, willPresentMenuFor configuration: UIEditMenuConfiguration, animator: any UIEditMenuInteractionAnimating) {
        assertUnimplemented()
    }
    
    override var dragBridge: AnyDragAndDropBridge? {
        assertUnimplemented()
    }

    override var responderNode: ResponderNode? {
        assertUnimplemented()
    }

    override var identifiedViews: _IdentifiedViewTree {
        assertUnimplemented()
    }

    override var swipeActions: SwipeActions.Value? {
        assertUnimplemented()
    }

    override var secondaryNavigationBehavior: PlatformItemList.Item.SecondaryNavigationBehavior? {
        assertUnimplemented()
    }

    override func explicitAlignment(of alignment: HorizontalAlignment, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }

    override func outermostContextMenuConfiguration() -> UIContextMenuConfiguration? {
        assertUnimplemented()
    }

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override var focusEffect: UIFocusEffect? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override var canBecomeFocused: Bool {
        assertUnimplemented()
    }

    override var isAccessibilityElement: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override func removeFromSuperview() {
        assertUnimplemented()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        assertUnimplemented()
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        assertUnimplemented()
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        assertUnimplemented()
    }

    override func layoutSubviews() {
        assertUnimplemented()
    }
}

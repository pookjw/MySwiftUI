// 6ABC303D5DCFFEFD4C711D02B9F178CC
public import UIKit
@_spi(Internal) internal import MySwiftUICore
private import _UIKitPrivate

open class UIHostingController<Content: View>: UIViewController {
    final var allowedBehaviors: HostingControllerAllowedBehaviors = [] // 0xa78
    
    final var requiredBridges: HostingControllerBridges = [] {
        didSet {
            fatalError("TODO")
        }
    } // 0xa80
    
    final var host: _UIHostingView<Content>
    
    final var overrides = HostingControllerOverrides(
        pushTarget: PushTarget(
            navController: nil,
            shouldReplaceRoot: false,
            column: nil
        ),
        navigation: nil,
        split: nil,
        hasBackItem: nil
    ) // 0xa88
    
    final var customTabItem: UIKitTabBarItem? = nil // 0xa90
    final weak var lastZoomPresentationSource: UIView? = nil // 0xa98
    final var toolbarBridge: ToolbarBridge<UIKitToolbarStrategy>? = nil // 0xaa0
    final var inspectorBridgeV5: UIKitInspectorBridgeV5<Content>? = nil // 0xaa8
    final var barAppearanceBridge: BarAppearanceBridge? = nil // 0xab0
    final let dialogBridge = UIKitDialogBridge() // 0xab8
    final var testBridge: PPTTestBridge? = nil // 0xac0
    final var contentScrollViewBridge: UIKitContentScrollViewBridge? = nil // 0xac8
    final let modernNavigationBridge = ModernNavigationBridge(seedTracker: VersionSeedTracker(seed: .invalid)) // 0xad0
    final let fileImportExportBridge = FileImportExportBridge() // 0xad8
    final var deferredEdges: Edge.Set? = nil // 0xae0
    final var screenEdgesSystemGestureSeedTracker = VersionSeedSetTracker() // 0xae8
    final var shouldDeferScreenEdgesSystemGestureToChildViewController: Bool = false // 0xaf0
    final var persistentSystemOverlays: (preferences: PersistentSystemOverlaysKey.Overlays?, environment: Visibility?) = (nil, nil) // 0xaf8
    final var persistentSystemOverlaysSeedTracker = VersionSeedSetTracker() // 0xb00
    final var shouldDeferPersistentSystemOverlaysToChildViewController: Bool = false // 0xb08
    final private(set) var navigationBridge: NavigationBridge_PhoneTV? = nil // 0xb10
    final var keyboardShortcutBridge: KeyboardShortcutBridge? = nil // 0xb28
    final var ornamentBridge: OrnamentBridge<Content>? = nil // 0xb20
    final var overridePreferredContainerBackgroundStyle: UIContainerBackgroundStyle = .automatic // 0xb28
    @preconcurrency public var sizingOptions: UIHostingControllerSizingOptions = [] {
        didSet {
            fatalError("TODO")
        }
    }
    
    @preconcurrency public var rootView: Content {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    deinit {
        fatalError("TODO")
    }
    
    public dynamic required init?(coder: NSCoder) {
        fatalError("TODO")
    }
    
    open override dynamic func loadView() {
        view = host
    }
    
    open override dynamic func viewWillAppear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override dynamic func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        _willMove(toParent: parent)
    }
    
    open override dynamic func addChild(_ childController: UIViewController) {
        fatalError("TODO")
    }
    
    open override dynamic var childForHomeIndicatorAutoHidden: UIViewController? {
        fatalError("TODO")
    }
    
    open override dynamic var msui_childViewControllerForInterfaceOrientationLock: UIViewController? {
        fatalError("TODO")
    }
    
#if os(visionOS)
    open override dynamic var childViewControllerForPreferredContainerBackgroundStyle: UIViewController? {
        fatalError("TODO")
    }
#endif
    
    open override dynamic var childForScreenEdgesDeferringSystemGestures: UIViewController? {
        fatalError("TODO")
    }
    
    open override dynamic var childForStatusBarHidden: UIViewController? {
        fatalError("TODO")
    }
    
    open override dynamic var childForStatusBarStyle: UIViewController? {
        fatalError("TODO")
    }
    
    open override dynamic func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        _didMove(toParent: parent)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("TODO")
    }
    
    open override dynamic var isModalInPresentation: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    open override dynamic var keyCommands: [UIKeyCommand]? {
        fatalError("TODO")
    }
    
#if os(visionOS)
    open override dynamic var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        fatalError("TODO")
    }
#endif
    
    open override dynamic func preferredContentSizeDidChange(forChildContentContainer container: any UIContentContainer) {
        fatalError("TODO")
    }
    
    open override dynamic var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        fatalError("TODO")
    }
    
    open override dynamic var preferredStatusBarStyle: UIStatusBarStyle {
        fatalError("TODO")
    }
    
    open override dynamic var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        fatalError("TODO")
    }
    
    open override dynamic var prefersHomeIndicatorAutoHidden: Bool {
        fatalError("TODO")
    }
    
    open override dynamic var prefersStatusBarHidden: Bool {
        fatalError("TODO")
    }
    
    open override dynamic func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        fatalError("TODO")
    }
    
    open override dynamic var undoManager: UndoManager? {
        fatalError("TODO")
    }
    
    open override dynamic func viewDidAppear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override dynamic func viewDidDisappear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override dynamic func viewWillLayoutSubviews() {
        fatalError("TODO")
    }
    
    open override dynamic func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        fatalError("TODO")
    }
    
    open override dynamic func _wantsTransparentBackground() -> Bool {
        fatalError("TODO")
    }
    
    @preconcurrency public init(rootView: Content) {
        host = _UIHostingView(rootView: rootView)
        super.init(nibName: nil, bundle: nil)
        _commonInit()
    }
    
    @preconcurrency public init?(coder aDecoder: NSCoder, rootView: Content) {
        fatalError("TODO")
    }
    
    public func sizeThatFits(in size: CGSize) -> CGSize {
        fatalError("TODO")
    }
    
    @preconcurrency public func _render(seconds: Double) {
        fatalError("TODO")
    }
    
    @preconcurrency public func _forEachIdentifiedView(body: (_IdentifiedViewProxy) -> Void) {
        fatalError("TODO")
    }
    
    @available(iOS, introduced: 13.0, deprecated: 16.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 16.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @available(watchOS, introduced: 6.0, deprecated: 9.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @preconcurrency public var _disableSafeArea: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    @preconcurrency public final var _rendererConfiguration: _RendererConfiguration {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    @preconcurrency public final var _rendererObject: AnyObject? {
        fatalError("TODO")
    }
    
    package final func _as<T>(_ type: T.Type) -> T? {
        fatalError("TODO")
    }
    
    final func _viewDidMoveToWindow() {
        fatalError("TODO")
    }
    
    final func preferencesDidChange(_: PreferenceValues) {
        fatalError("TODO")
    }
    
    final func update(_: inout EnvironmentValues) {
        fatalError("TODO")
    }
    
    final func updateViewGraphBridges(_: inout ViewGraphBridgeProperties) {
        fatalError("TODO")
    }
    
    final func didRender() {
        fatalError("TODO")
    }
    
    final func _viewSafeAreaDidChange() {
        fatalError("TODO")
    }
    
    private final var _preferredStatusBarStyle: UIStatusBarStyle {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _prefersStatusBarHidden: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _childForStatusBarStyle: UIViewController? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _childForStatusBarHidden: UIViewController? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _childForInterfaceOrientationLock: UIViewController? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _persistentSystemOverlays: Visibility {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var secondaryRootSystemOverlaysValue: Visibility? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _prefersHomeIndicatorAutoHidden: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _childForHomeIndicatorAutoHidden: UIViewController? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var persistentSystemOverlaysFromPreferences: Visibility? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var disallowAnimations: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var centersRootView: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var isHiddenForReuse: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var _keyCommands: [UIKeyCommand]? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var rendererObject: AnyObject? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var rendererConfiguration: _RendererConfiguration {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final var coalescesChanges: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private final func _commonInit() {
        /*
         self -> x19
         */
        host.viewController = self
        
        Update.ensure {
            host.viewGraph.append(feature: EditModeScopeFeature())
            
            // <+144>
            dialogBridge.hostingController = self
            dialogBridge.host = host
            
            do {
                let viewGraph = host.viewGraph
                viewGraph.addPreference(ConfirmationDialog.PreferenceKey.self)
                viewGraph.addPreference(AlertStorage.PreferenceKey.self)
                viewGraph.addPreference(AllowsSecureDrawingKey.self)
            }
            
            // <+364>
            host.viewGraph.addPreference(UpdateViewDestinationRequest.UpdateViewDestinationRequestKey.self)
            fileImportExportBridge.host = host
            
            do {
                let viewGraph = host.viewGraph
                viewGraph.addPreference(FileImportOperation.Key.self)
                viewGraph.addPreference(FileExportOperation.Key.self)
            }
            
            if !type(of: host).ignoresPresentations {
                // <+600>
                // x25
                let popoverBridge = UIKitPopoverBridge()
                popoverBridge.host = host
                
                let viewGraph = host.viewGraph
                viewGraph.addPreference(InspectorStorage.PreferenceKey.self)
                viewGraph.addPreference(InspectorAnchorPreferenceKey.self)
                viewGraph.addPreference(PopoverPresentation.Key.self)
                viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
                viewGraph.addPreference(PresentationOptionsPreferenceKey.self)
                
                host.popoverBridge = popoverBridge
            }
            
            // <+864>
            addScreenEdgesSystemGesturePreferences(to: host.viewGraph)
            addPersistentSystemOverlaysPreferences(to: host.viewGraph)
            
            // <+964>
            if PPTFeature.isEnabled {
                testBridge = PPTTestBridge(host: nil, shouldUpdateEnvironment: false, testCase: nil)
                testBridge?.host = host
            }
            
            // <+1104>
            let sharingActivityPickerBridge = SharingActivityPickerBridge()
            sharingActivityPickerBridge.host = host
            sharingActivityPickerBridge.addPreferences(to: host.viewGraph)
            host.sharingActivityPickerBridge = sharingActivityPickerBridge
            
            let shareConfigurationBridge = ShareConfigurationBridge()
            shareConfigurationBridge.host = host
            host.viewGraph.addPreference(AnyShareConfiguration.Key.self)
            host.shareConfigurationBridge = shareConfigurationBridge
            
            host.viewGraph.addPreference(HostingGestureOverlayAuthorityKey.self)
            
            if traitCollection.userInterfaceIdiom == .vision {
                let ornamentBridge = OrnamentBridge<Content>()
                ornamentBridge.hostingController = self
                ornamentBridge.addPreferences(to: host.viewGraph)
                self.ornamentBridge = ornamentBridge
            }
            
            // <+1688>
        }
    }
    
    final func addScreenEdgesSystemGesturePreferences(to viewGraph: ViewGraph) {
        func add<T: HostPreferenceKey>(preference: T.Type) {
            viewGraph.addPreference(preference)
            screenEdgesSystemGestureSeedTracker.addPreference(preference)
        }
        
        add(preference: ScreenEdgesSystemGestureKey.self)
    }
    
    final func addPersistentSystemOverlaysPreferences(to viewGraph: ViewGraph) {
        func add<T: HostPreferenceKey>(preference: T.Type) {
            viewGraph.addPreference(preference)
            persistentSystemOverlaysSeedTracker.addPreference(preference)
        }
        
        add(preference: PersistentSystemOverlaysKey.self)
    }
    
    final func _willMove(toParent parent: UIViewController?) {
        let overrides: HostingControllerOverrides
        if let parent {
            overrides = HostingControllerOverrides(
                pushTarget: nil,
                navigation: nil,
                split: nil,
                hasBackItem: nil
            )
        } else {
            overrides = HostingControllerOverrides(
                pushTarget: nil,
                navigation: navigationController,
                split: splitViewController,
                hasBackItem: nil
            )
        }
        
        self.overrides = overrides
    }
    
    final func _didMove(toParent parent: UIViewController?) {
        resolveRequiredBridges(nil, allowedActions: (parent == nil) ? .unknown1 : .unknown0)
    }
}

@available(iOS 16.4, tvOS 16.4, *)
@available(macOS, unavailable)
extension UIHostingController {
    @available(iOS 16.4, tvOS 16.4, *)
    @available(macOS, unavailable)
    @preconcurrency public var safeAreaRegions: SafeAreaRegions {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

extension UIHostingController : _UIHostingViewable where Content == AnyView {
}

extension UIHostingController: @preconcurrency ViewGraphBridgePropertiesDelegate {
    final func resolveRequiredBridges(_: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) {
        /*
         properties -> x0, x1, x2, x3
         allowedActions -> x4
         */
        fatalError("TODO")
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public func _makeUIHostingController(_ view: AnyView) -> any NSObject & _UIHostingViewable {
    fatalError("TODO")
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(macOS, unavailable)
public func _makeUIHostingController(_ view: AnyView, tracksContentSize: Bool, secure: Bool = false) -> any NSObject & _UIHostingViewable {
    fatalError("TODO")
}

@available(watchOS 6.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
public func _makeWatchKitUIHostingController(_ view: AnyView) -> any NSObject & _UIHostingViewable {
    fatalError("TODO")
}

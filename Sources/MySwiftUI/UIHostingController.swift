// 1D3224F5185670D36FFEB48E24E43C4F
public import UIKit
@_spi(Internal) internal import MySwiftUICore
private import _UIKitPrivate
private import AttributeGraph
private import os.log

open class UIHostingController<Content: View>: UIViewController {
    final var allowedBehaviors: HostingControllerAllowedBehaviors = [] // 0xa78
    
    final var requiredBridges: HostingControllerBridges = [] {
        didSet {
            didChangeRequiredBridges(from: oldValue, to: requiredBridges)
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
    final var overridePreferredContainerBackgroundStyle: UIContainerBackgroundStyle = .automatic /* 0xb28 */ {
        didSet {
            // 원래 없으며 inline으로 보임
            setNeedsUpdateOfPreferredContainerBackgroundStyle()
        }
    }
    @preconcurrency public var sizingOptions: UIHostingControllerSizingOptions = [] {
        didSet {
            sizingOptionsDidChange(from: oldValue)
        }
    }
    
    @preconcurrency public var rootView: Content {
        get {
            return host.rootView
        }
        set {
            host.rootView = newValue
        }
    }
    
    public dynamic required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    open override dynamic func loadView() {
        view = host
    }
    
    open override dynamic func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _viewWillAppear(animated)
    }
    
    open override dynamic func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        _willMove(toParent: parent)
    }
    
    open override dynamic func addChild(_ childController: UIViewController) {
        super.addChild(childController)
        self.setNeedsUpdateOfPreferredContainerBackgroundStyle()
    }
    
    open override dynamic var childForHomeIndicatorAutoHidden: UIViewController? {
        guard self._persistentSystemOverlays == .automatic else {
            return nil
        }
        
        guard self.shouldDeferPersistentSystemOverlaysToChildViewController else {
            return nil
        }
        
        assertUnimplemented()
    }
    
#if os(visionOS)
    open override dynamic var msui_childViewControllerForInterfaceOrientationLock: UIViewController? {
        return _childForInterfaceOrientationLock
    }
#else
    open override dynamic var childForInterfaceOrientationLock: UIViewController? {
        return _childForInterfaceOrientationLock
    }
#endif
    
#if os(visionOS)
    open override dynamic var childViewControllerForPreferredContainerBackgroundStyle: UIViewController? {
        guard self.preferredContainerBackgroundStyle == .automatic else {
            return nil
        }
        
        return children.last
    }
#endif
    
    open override dynamic var childForScreenEdgesDeferringSystemGestures: UIViewController? {
        return _childForScreenEdgesDeferringSystemGestures
    }
    
    open override dynamic var childForStatusBarHidden: UIViewController? {
        assertUnimplemented()
    }
    
    open override dynamic var childForStatusBarStyle: UIViewController? {
        assertUnimplemented()
    }
    
    open override dynamic func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        _didMove(toParent: parent)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        assertUnimplemented()
    }
    
    open override dynamic var isModalInPresentation: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    open override dynamic var keyCommands: [UIKeyCommand]? {
        assertUnimplemented()
    }
    
#if os(visionOS)
    open override dynamic var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        return overridePreferredContainerBackgroundStyle
    }
#endif
    
    open override dynamic func preferredContentSizeDidChange(forChildContentContainer container: any UIContentContainer) {
        assertUnimplemented()
    }
    
    open override dynamic var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return _preferredScreenEdgesDeferringSystemGestures
    }
    
    open override dynamic var preferredStatusBarStyle: UIStatusBarStyle {
        assertUnimplemented()
    }
    
    open override dynamic var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        assertUnimplemented()
    }
    
    open override dynamic var prefersHomeIndicatorAutoHidden: Bool {
        return _prefersHomeIndicatorAutoHidden
    }
    
    open override dynamic var prefersStatusBarHidden: Bool {
        assertUnimplemented()
    }
    
    open override dynamic func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        assertUnimplemented()
    }
    
    open override dynamic var undoManager: UndoManager? {
        assertUnimplemented()
    }
    
    open override dynamic func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _viewDidAppear(animated)
    }
    
    final func _viewDidAppear(_ animated: Bool) {
        // self -> x20 -> x19
        resolveRequiredBridges(nil, allowedActions: [.unknown0, .unknown1])
        host.viewControllerDidAppear(transitionCoordinator: transitionCoordinator, animated: animated)
        
        // x22
        if let navigationBridge {
            // <+184>
            // inlined
            navigationBridge.hostingControllerDidAppear()
        }
        
        // <+304>
        updateInitialSceneGeometry()
    }
    
    open override dynamic func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        _viewDidDisappear(animated)
    }
    
    final func _viewDidDisappear(_ animated: Bool) {
        requiredBridges.subtract(.unknown1)
    }
    
    open override dynamic func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        _viewWillLayoutSubviews()
    }
    
    open override dynamic func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        /*
         self -> x20 -> x22
         coordinator -> x0 -> x23
         size -> d0/d1 -> d9/d8
         */
        super.viewWillTransition(to: size, with: coordinator)
        
        // <+132>
        // w25
        let isLinked = isLinkedOnOrAfter(.v6_2)
        // x24
        var flag = false
        if let sceneBridge = host.sceneBridge {
            // <+192>
            // flag를 조건에 따라 true
            assertUnimplemented()
        }
        
        // <+220>
        if isLinked {
            // <+224>
            let host = host
            host.isInSizeTransition = true
            coordinator.animate(alongsideTransition: nil) { [weak host] _ in
                // $s7SwiftUI19UIHostingControllerC18viewWillTransition2to4withySo6CGSizeV_So06UIViewdG11Coordinator_ptFySo0kdgL7Context_pcfU_TA
                /*
                 isLinked -> w1 -> x20
                 weak host -> x2 -> x22
                 flag -> x3 -> x24
                 */
                if isLinked, let host {
                    host.isInSizeTransition = false
                }
                
                // <+192>
                guard flag else {
                    return
                }
                
                // <+224>
                assertUnimplemented()
            }
        }
        
        // <+428>
        host.invalidateProperties([.rootView], mayDeferUpdate: true)
    }
    
    open override dynamic func _wantsTransparentBackground() -> Bool {
        assertUnimplemented()
    }
    
    @preconcurrency public init(rootView: Content) {
        host = _UIHostingView(rootView: rootView)
        super.init(nibName: nil, bundle: nil)
        _commonInit()
    }
    
    @preconcurrency init(_hostingView: _UIHostingView<Content>) {
        host = _hostingView
        super.init(nibName: nil, bundle: nil)
        _commonInit()
    }
    
    @preconcurrency public init?(coder aDecoder: NSCoder, rootView: Content) {
        assertUnimplemented()
    }
    
    public func sizeThatFits(in size: CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    @preconcurrency public func _render(seconds: Double) {
        assertUnimplemented()
    }
    
    @preconcurrency public func _forEachIdentifiedView(body: (_IdentifiedViewProxy) -> Void) {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 16.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @available(macOS, unavailable)
    @available(tvOS, introduced: 13.0, deprecated: 16.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @available(watchOS, introduced: 6.0, deprecated: 9.4, message: "Use UIHostingController/safeAreaRegions or _UIHostingView/safeAreaRegions")
    @preconcurrency public var _disableSafeArea: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @preconcurrency public final var _rendererConfiguration: _RendererConfiguration {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @preconcurrency public final var _rendererObject: AnyObject? {
        assertUnimplemented()
    }
    
    package final func _as<T>(_ type: T.Type) -> T? {
        guard type == UIHostingControllerProvider.self else {
            return nil
        }
        
        // <+112>
        return _specialize(self as (any UIHostingControllerProvider), for: T.self)!
    }
    
    final func _viewDidMoveToWindow() {
        if let barAppearanceBridge {
            barAppearanceBridge.didMoveToWindow(hostingController: self)
        }
        
        if let inspectorBridgeV5 {
            inspectorBridgeV5.didMoveToWindow()
        }
        
        if let ornamentBridge {
            ornamentBridge.didMoveToWindow()
        }
        
        updateInitialSceneGeometry()
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x21
         preferences -> x19
         */
        // <+172>
        modernNavigationBridge.preferencesDidChange(preferences)
        dialogBridge.preferencesDidChange(preferences)
        fileImportExportBridge.preferencesDidChange(preferences)
        
        if let keyboardShortcutBridge {
            // inlined
            keyboardShortcutBridge.preferencesDidChange(preferences)
        }
        
        screenEdgesSystemGesturePreferencesDidChange(preferences)
        persistentSystemOverlaysPreferencesDidChange(preferences)
        
        // <+396>
        if let navigationBridge {
            // inlined
            navigationBridge.preferencesDidChange(preferences)
        }
        
        if let contentScrollViewBridge {
            contentScrollViewBridge.preferencesDidChange(preferences)
        }
        
        if let toolbarBridge {
            toolbarBridge.preferencesDidChange(preferences, hostingController: self)
        }
        
        if let barAppearanceBridge {
            barAppearanceBridge.preferencesDidChange(preferences, hostingController: self)
        }
        
        if let inspectorBridgeV5 {
            inspectorBridgeV5.preferencesDidChange(preferences)
        }
        
        if let ornamentBridge {
            ornamentBridge.preferencesDidChange(preferences)
        }
    }
    
    final func update(_ environmentValues: inout EnvironmentValues) {
        _update(&environmentValues)
    }
    
    final func updateViewGraphBridges(_ properties: inout ViewGraphBridgeProperties) {
        _update(bridgeProperties: &properties)
    }
    
    final func didRender() {
        guard let contentScrollViewBridge else {
            return
        }
        
        contentScrollViewBridge.update()
    }
    
    final func _viewSafeAreaDidChange() {
        if let toolbarBridge {
            toolbarBridge.safeAreaDidChange(hostingController: self)
        }
    }
    
    final var _preferredStatusBarStyle: UIStatusBarStyle {
        get {
            assertUnimplemented()
        }
    }
    
    final var _prefersStatusBarHidden: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    final var _preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        get {
            assertUnimplemented()
        }
    }
    
    final var _childForStatusBarStyle: UIViewController? {
        get {
            assertUnimplemented()
        }
    }
    
    final var _childForStatusBarHidden: UIViewController? {
        get {
            assertUnimplemented()
        }
    }
    
    final var _childForInterfaceOrientationLock: UIViewController? {
        if let result = self.children.last?.msui_childViewControllerForInterfaceOrientationLock {
            return result
        }
        
        return self.children.last
    }
    
    final var _prefersHomeIndicatorAutoHidden: Bool {
        return _persistentSystemOverlays == .hidden
    }
    
    final var _childForHomeIndicatorAutoHidden: UIViewController? {
        get {
            assertUnimplemented()
        }
    }
    
    final var disallowAnimations: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final var centersRootView: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final var isHiddenForReuse: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    final func _commonInit() {
        /*
         self -> x19
         */
        host.viewController = self
        
        Update.begin()
        
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
        Update.end()
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
    
    final func _viewWillAppear(_ animated: Bool) {
        /*
         self -> x19
         animated -> x21
         */
        resolveRequiredBridges(nil, allowedActions: [.unknown0, .unknown1])
        prepareForNavigationTransition(animated)
        coordinateListSelection(transitionCoordinator: transitionCoordinator, isAnimated: animated)
        
        if let toolbarBridge {
            toolbarBridge.viewWillAppear(hostingController: self)
        }
        
        if let barAppearanceBridge {
            barAppearanceBridge.viewWillAppear(hostingController: self)
        }
    }
    
    final func _didMove(toParent parent: UIViewController?) {
        resolveRequiredBridges(nil, allowedActions: (parent == nil) ? .unknown1 : .unknown0)
    }
    
    func sizingOptionsDidChange(from oldValue: UIHostingControllerSizingOptions) {
        /*
         self -> x20 -> x19
         oldValue -> x0 -> x20 -> x25
         */
        let x27 = UIHostingControllerSizingOptions(
            rawValue: self.sizingOptions.rawValue & ~oldValue.rawValue
        )
        
        if
            !UIHostingControllerSizingOptions
                .idealSize
                .intersection(x27)
                .isEmpty
        {
            // <+196>
            self.host.viewGraph.sizeThatFitsObservers.addObserver(for: _ProposedSize(.unspecified), exclusive: false) { _, _ in
                // $s7SwiftUI19UIHostingControllerC22sizingOptionsDidChange4fromyAA0cd6SizingF0V_tFySo6CGSizeV_AItcfU_TA
                // weak self를 포함한 값 3개 capture
                assertUnimplemented()
            }
        } else if
            UIHostingControllerSizingOptions
                .idealSize
                .intersection(self.sizingOptions)
                .isEmpty
        {
            // <+628>
            self.host.viewGraph.sizeThatFitsObservers.stopObserving(proposal: _ProposedSize(.unspecified))
        }
        
        // <+784>
        self.updateWindowSizeObservers(x27)
    }
    
    final func updateWindowSizeObservers(_ options: UIHostingControllerSizingOptions) {
        /*
         self -> x20 -> x21
         options -> x0 -> x24
         */
        guard let sceneBridge = self.host.sceneBridge else {
            return
        }
        
        if !options.contains(.unknown2) {
            // <+68>
            if !self.sizingOptions.contains(.unknown2) {
                // <+100>
                // <+168>
                sceneBridge.updateMinimumSizeObserver(added: false, viewGraph: self.host.viewGraph)
                // <+188>
            } else {
                // <+188>
            }
            
            // <+188>
        } else {
            // <+136>
            sceneBridge.updateMinimumSizeObserver(added: true, viewGraph: self.host.viewGraph)
            // <+188>
        }
        
        // <+188>
        if options.contains(.unknown3) || !self.sizingOptions.contains(.unknown3) {
            // <+224>
            sceneBridge.updateMaximumSizeObserver(added: options.contains(.unknown3), viewGraph: self.host.viewGraph)
        }
        
        // <+280>
    }
    
    final var _childForScreenEdgesDeferringSystemGestures: UIViewController? {
        guard
            deferredEdges == nil,
            shouldDeferScreenEdgesSystemGestureToChildViewController
        else {
            return nil
        }
        
        // <+52>
        assertUnimplemented()
    }
    
    final var _preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        let edges = deferredEdges ?? .horizontal
        return UIRectEdge(edges, layoutDirection: .leftToRight)
    }
    
    fileprivate final func navigationHierarchyAllowsToolbarBridge() -> Bool {
        if ViewGraphBridgePropertiesAreInput.isEnabled {
            return true
        }
        
        if !clientNeedsNestedToolbarBridgeSuppression {
            return true
        }
        
        guard let navigationController else {
            return false
        }
        
        return navigationController
            .viewControllers
            .contains { $0 == self}
    }
    
    final func resolveBarAppearanceBehavior(_ properties: ViewGraphBridgeProperties) {
        /*
         self -> x20 -> x21
         properties.managedBars -> x0 -> x19
         */
        let managedBars = properties.managedBars
        // x27
        let allowedBehaviors = allowedBehaviors
        let barAppearanceBridge = barAppearanceBridge
        
        let flag: Bool // true -> <+288> / false -> <+1196>
        if !managedBars.isEmpty {
            if let barAppearanceBridge {
                // <+1196>
                flag = false
            } else {
                // <+288>
                flag = true
            }
        } else {
            // <+188>
            if let barAppearanceBridge {
                // <+192>
                if allowedBehaviors.contains(.unknown0) {
                    // <+1196>
                    flag = false
                } else {
                    // <+196>
                    if let logger = Log.toolbar {
                        logger.log(level: .default, "Removed toolbar appearance bridge from \(self)")
                    }
                    
                    // <+1056>
                    assert(self.barAppearanceBridge != nil)
                    let viewGraph = host.viewGraph
                    viewGraph.removePreference(NavigationTitleKey.self)
                    viewGraph.removePreference(NavigationSubtitleKey.self)
                    viewGraph.removePreference(NavigationBarBackButtonHiddenKey.self)
                    self.barAppearanceBridge = nil
                    // <+1196>
                    flag = false
                }
            } else {
                // <+284>
                if allowedBehaviors.contains(.unknown0) {
                    // <+288>
                    flag = true
                } else {
                    // <+1196>
                    flag = false
                }
            }
        }
        
        if flag {
            // <+288>
            if let logger = Log.toolbar {
                logger.log(level: .default, "Added toolbar appearance bridge to \(self)")
            }
            
            // <+608>
            self.barAppearanceBridge = BarAppearanceBridge()
            
            if ViewGraphBridgePropertiesAreInput.isEnabled {
                host.invalidateProperties(.environment, mayDeferUpdate: true)
            }
            
            // <+756>
            self.barAppearanceBridge!.addPreferences(to: host.viewGraph)
            // <+1196>
        }
        
        // <+1196>
        if let barAppearanceBridge = self.barAppearanceBridge {
            barAppearanceBridge.updateAllowedBars(managedBars, viewGraph: host.viewGraph)
            
            if !allowedBehaviors.contains(.unknown0) {
                // <+1280>
                barAppearanceBridge.platformStorage.uiShouldUpdateNavigationController = true
                barAppearanceBridge.platformStorage.uiShouldUpdateNavigationTitle = false
            } else {
                // <+1308>
                barAppearanceBridge.platformStorage.uiShouldUpdateNavigationController = !managedBars.isEmpty
                barAppearanceBridge.platformStorage.uiShouldUpdateNavigationTitle = managedBars.isEmpty
            }
        }
        
        // <+1360>
    }
    
    fileprivate final func updateInitialSceneGeometry() {
        // self -> x20 -> x23
        // <+476>
        guard let sceneBridge = host.sceneBridge else {
            return
        }
        
        guard let windowScene = sceneBridge.windowScene else {
            return
        }
        
        if case .set = sceneBridge.initialSceneSizeState {
            return
        }
        
        // <+708>
        if windowScene.session.role == .immersiveSpaceApplication {
            // <+892>
            if let resize = Log.resize {
                resize.log(level: .debug, "Not updating initial scene geometry because this is an immersive scene")
            }
            
            sceneBridge.initialSceneSizeState = .set
        } else {
            // <+1244>
            let preferences = self.hostSizingPreferences(volumetric: sceneBridge.sceneIsVolume, initialSceneSizeState: sceneBridge.initialSceneSizeState)
            
            if let preferences {
                // <+1504>
                let geometryPreferences: UIWindowScene.GeometryPreferences.Vision
                if preferences.hasOutOfBoundsDefaultSize {
                    // <+1544>
                    geometryPreferences = UIWindowScene.GeometryPreferences.Vision()
                    
                    if preferences.use3D {
                        if let size3D = preferences.size3D {
                            geometryPreferences._size3D = size3D
                            geometryPreferences.mrui_volumetric = true
                        }
                    } else {
                        if let size2D = preferences.size2D {
                            geometryPreferences.size = size2D
                        }
                    }
                    
                    // <+2064>
                    sceneBridge.initialSceneSizeState = .setting
                    
                    if let resize = Log.resize {
                        resize.log(level: .info, "Sending request to shell: updating initial scene size \(ResizeLogs.size3D(geometryPreferences._size3D)). Not updating the scene minimum or maximum size yet since the app-provided default size was bigger than the current maximum size of the content or smaller than the current min, based on \(preferences.description).")
                    }
                    
                    // <+3260>
                } else {
                    // <+1864>
                    geometryPreferences = preferences.geometryPreferences
                    sceneBridge.initialSceneSizeState = .set
                    
                    if let resize = Log.resize {
                        resize.log(level: .info, "Sending request to shell: Updating initial scene geometry with scene size \(ResizeLogs.size3D(geometryPreferences._size3D)), min \(ResizeLogs.size3D(geometryPreferences._minimumSize3D)), max \(ResizeLogs.size3D(geometryPreferences._maximumSize3D))")
                    }
                    
                    // <+3260>
                }
                
                // <+3260>
                UIView.performWithoutAnimation {
                    // $s7SwiftUI11SceneBridgeC06updateC6Sizing_11transaction29invalidateEnvironmentPropertyyAA0F11PreferencesV_AA11TransactionVSgyyctFyyXEfU1_TA
                    windowScene.requestGeometryUpdate(geometryPreferences, errorHandler: nil)
                }
            } else {
                // <+1372>
                if let resize = Log.resize {
                    resize.log(level: .debug, "Not updating initial scene geometry because there isn't a new scene size, min or max")
                }
                
                sceneBridge.initialSceneSizeState = .set
            }
        }
    }
    
    final func hostSizingPreferences(volumetric: Bool, initialSceneSizeState: InitialSceneSizeState) -> SizingPreferences? {
        /*
         self -> x20 -> x29 - 0xe0
         volumetric -> w0 -> w20 -> w23
         initialSceneSizeState -> x1 -> x25
         */
        // <+400>
        var preferences: SizingPreferences
        if volumetric {
            preferences = .volume(size: nil, minimum: nil, maximum: nil)
        } else {
            preferences = .window(size: nil, minimum: nil, maximum: nil)
        }
        
        // <+500>
        // x29 - 0x100
        let hasUnknown2 = self.sizingOptions.intersection(.unknown2)
        // x29 - 0x108
        let hasUnknown3 = self.sizingOptions.intersection(.unknown3)
        
        if case .unset(let size) = initialSceneSizeState {
            // <+836>
            let fixedSize = size.fixingUnspecifiedDimensions()
            
            if
                volumetric,
                let viewIfLoaded = self.viewIfLoaded,
                let window = viewIfLoaded.window,
                let windowScene = window.windowScene
            {
                let effectiveSize = windowScene.effectiveGeometry._size
                let effectiveSize3D = Size3D(fixedSize, depth: effectiveSize.depth)
                preferences.size3D = effectiveSize3D
            } else {
                preferences.size2D = fixedSize
            }
            
            // <+1240>
        } else if case .unset3D(let size, let unit) = initialSceneSizeState {
            // <+640>
            let fixedSize = size.fixingUnspecifiedDimensions()
            let scene: UIScene?
            if
                let viewIfLoaded = self.viewIfLoaded,
                let window = viewIfLoaded.window,
                let windowScene = window.windowScene
            {
                scene = windowScene
            } else {
                scene = nil
            }
            
            let sizeInPoints = DefaultSizeBehavior.sizeInPoints(defaultSize: fixedSize, sizingUnit: unit, scene: scene)
            
            preferences.size3D = sizeInPoints
            // <+1240>
        } else {
            // <+1080>
            guard !hasUnknown2.union(hasUnknown3).isEmpty else {
                return nil
            }
            
            // <+1248>
        }
        
        // <+1248>
        return Update.ensure { 
            // $s7SwiftUI19UIHostingControllerC21hostSizingPreferences10volumetric21initialSceneSizeStateAA0fG0VSgSb_AA07InitialjkL0OtFyyXEfU_TA
            assertUnimplemented()
        }
    }
    
    final func _viewWillLayoutSubviews() {
        layoutToolbarIfNeeded()
    }
    
    fileprivate final func layoutToolbarIfNeeded() {
        guard let toolbarBridge else {
            return
        }
        
        // inlined
        toolbarBridge.layout()
    }
    
    final func _update(_ environment: inout EnvironmentValues) {
        /*
         self -> x20 -> x23
         environmentValues -> x0 -> x19
         */
        dialogBridge.lastEnvironment = environment
        
        // <+204>
        if let navigationBridge {
            navigationBridge.update(environment: &environment)
        }
        
        if let barAppearanceBridge {
            barAppearanceBridge.update(environment: &environment)
        }
        
        // <+272>
        if let contentScrollViewBridge {
            contentScrollViewBridge.pixelLength = environment.pixelLength
        }
        
        // <+320>
        if let testBridge {
            // <+332>
            assertUnimplemented()
        }
        
        // <+608>
        environment.withCurrentHostingController = WithCurrentHostingControllerAction(self)
        
        // <+692>
        persistentSystemOverlaysEnvironmentDidChange(environment: environment)
        ToolbarBridge<UIKitToolbarStrategy>.update(environment: &environment, toolbarBridge: toolbarBridge, hostingController: self)
        
        if let inspectorBridgeV5 {
            inspectorBridgeV5.update(environment: &environment)
        }
    }
    
    final func persistentSystemOverlaysEnvironmentDidChange(environment: EnvironmentValues) {
        /*
         self -> x19
         environment -> x20
         */
        // w21
        let overlays1 = environment[ScenePersistentSystemOverlaysKey.self]
        let overlays2 = self.persistentSystemOverlays
        if let visibility2 = overlays2.environment, overlays1.visibility == visibility2 {
            // <+160>
            return
        }
        
        // <+100>
        self.persistentSystemOverlays.environment = overlays1.visibility
        
        if self.persistentSystemOverlays.preferences != nil {
            updateHomeIndicator(animated: false)
        }
    }
    
    fileprivate final func updateHomeIndicator(animated: Bool) {
        /*
         self -> x20 -> x22
         animated -> x0 -> x21
         */
        if
            let window = host.window,
            let casted = window as? ViewHostingWindow,
            let windowScene = casted.windowScene,
            let keyWindow = windowScene.keyWindow,
            let rootViewController = keyWindow.rootViewController,
            rootViewController != self
        {
            // <+520>
            if animated {
                UIView.animate(withDuration: 1.0 / 3.0) { 
                    rootViewController.setNeedsUpdateOfHomeIndicatorAutoHidden()
                }
            } else {
                rootViewController.setNeedsUpdateOfHomeIndicatorAutoHidden()
            }
            return
        }
        
        // <+252>
        let viewController = host.viewController
        if animated {
            UIView.animate(withDuration: 1.0 / 3.0) { 
                viewController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
            }
        } else {
            viewController?.setNeedsUpdateOfHomeIndicatorAutoHidden()
        }
    }
    
    final func resolveRequiredBridges(_ properties: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) {
        /*
         self -> x20 -> x22
         properties -> x0, x1, x2, x3 -> x24, x26, x28, x27
         allowedActions -> x4 -> x23
         */
        func graphValue() -> ViewGraphBridgeProperties {
            return Graph.withoutUpdate { 
                // $s7SwiftUI19UIHostingControllerC22resolveRequiredBridges_14allowedActionsyAA25ViewGraphBridgePropertiesVSg_AA07HostingdlI0VtF10graphValueL_AGyAA0J0RzlFAGyXEfU_
                return host.viewGraph.viewGraphInputs.viewGraphBridgeProperties.wrappedValue ?? .defaultValue
            }
        }
        
        Update.begin()
        
        // x24, sp + 0x40, x25
        var resolved: ViewGraphBridgeProperties
        if ViewGraphBridgePropertiesAreInput.isEnabled {
            // <+196>
            if let properties {
                // <+228>
                resolved = properties
                // <+360>
            } else {
                // <+200>
                resolved = graphValue()
                resolved.suppliedBridges = [] // x19는 복사 안하고 있음. nil인채로 들어오면 0임
                // <+360>
            }
        } else {
            // <+224>
            if let properties {
                resolved = properties
                // <+360>
            } else {
                // <+244>
                resolved = host.viewGraph.environment.viewGraphBridgeProperties
                resolved.suppliedBridges = []
                // <+360>
            }
        }
        
        // <+360>
        // x22
        let environment = host.viewGraph.environment
        let flag_1: Bool // true -> <+500> / false -> <+660>
        if let properties {
            if allowedActions.isDisjoint(with: [.unknown0, .unknown1]) {
                // <+660>
                flag_1 = false
            } else {
                // <+500>
                flag_1 = true
            }
        } else {
            // <+636>
            if environment.plist.isEmpty {
                // <+672>
                Update.end()
                return
            } else {
                if allowedActions.isDisjoint(with: [.unknown0, .unknown1]) {
                    // <+660>
                    flag_1 = false
                } else {
                    // <+500>
                    flag_1 = true
                }
            }
        }
        
        if flag_1 {
            // <+500>
            // x19
            let requiredBridges = requiredBridges
            // x27
            let navigationController = navigationController ?? overrides.navigation
            // <+580>
            // sp + 0x38
            let x290xa8 = allowedActions.intersection(.unknown0)
            // sp + 0x30
            let tabBarController = tabBarController
            
            // true -> <+832> / false -> <+808>
            let flag_2: Bool
            
            if let navigationController {
                // <+612>
                if !resolved.suppliedBridges.contains(.unknown2) {
                    // <+620>
                    if navigationController._supportsDataDrivenNavigation() {
                        // <+832>
                        flag_2 = true
                    } else {
                        // <+808>
                        flag_2 = false
                    }
                } else {
                    // <+832>
                    flag_2 = true
                }
            } else {
                // <+680>
                if let navigationBridge, let _host = navigationBridge.host {
                    // <+748>
                    if let navigation = _host.hostingControllerOverrides.navigation {
                        // <+808>
                        flag_2 = false
                    } else {
                        // <+832>
                        flag_2 = true
                    }
                } else {
                    // <+832>
                    flag_2 = true
                }
            }
            
            var x26: Int
            let flag_3: Bool // true -> <+848> / false -> <+820>
            if !flag_2 {
                // <+808>
                x26 = requiredBridges.rawValue | (x290xa8.rawValue << 2)
                
                if let navigationController {
                    // <+848>
                    flag_3 = true
                } else {
                    // <+820>
                    flag_3 = false
                }
            } else {
                // <+832>
                let x8 = requiredBridges.subtracting(.unknown2)
                if allowedActions.contains(.unknown1) {
                    x26 = x8.rawValue
                } else {
                    x26 = requiredBridges.rawValue
                }
                // <+844>
                if navigationController == nil {
                    flag_3 = false
                } else {
                    flag_3 = true
                }
            }
            
            let flag_4: Bool // true -> <+948> / false -> <+868>
            if flag_3, self.navigationHierarchyAllowsToolbarBridge() {
                // <+948>
                flag_4 = true
            } else {
                // <+820> / <+864>
                flag_4 = (tabBarController != nil)
            }
            
            let flag_5: Bool // true -> <+968> / false -> <+956>
            if !flag_4 {
                // <+868>
                if host.isRootHost {
                    // <+948>
                    flag_5 = resolved.suppliedBridges.contains(.unknown0)
                } else {
                    // <+968>
                    flag_5 = true
                }
            } else {
                // <+948>
                flag_5 = resolved.suppliedBridges.contains(.unknown0)
            }
            
            var x19: Int
            if !flag_5 {
                // <+956>
                x19 = x26
                if (x26 & 1) == 0 {
                    x19 = x19 | x290xa8.rawValue
                }
                // <+984>
            } else {
                // <+968>
                x19 = (!allowedActions.contains(.unknown1) ? x26 : (x26 & ~1))
            }
            // x290xa8 -> x20
            
            // <+984>
            let v3 = isLinkedOnOrAfter(.v3)
            // <+992>
            let w8 = resolved.suppliedBridges.contains(.unknown4)
            let x9 = x19 | (x290xa8.rawValue << 4)
            let x10 = !allowedActions.contains(.unknown1) ? x19 : (x19 & ~0x10)
            
            if v3 && !w8 {
                x26 = x9
            } else {
                x26 = x10
            }
            
            if host.isRootHost, host.window != nil {
                // <+1136>
                x19 = x26 | (x290xa8.rawValue << 1)
                x26 = x290xa8.rawValue
            } else {
                // <+1160>
                let x8 = x26 & ~0x2
                if !allowedActions.contains(.unknown1) {
                    x19 = x26
                } else {
                    x19 = x8
                }
                x26 = x290xa8.rawValue
            }
            
            let flag_6: Bool // true -> <+1212> / false -> <+1228>
            if !resolved.suppliedBridges.contains(.unknown7) {
                // <+1184>
                if type(of: host).ignoresPresentations {
                    // <+1212>
                    flag_6 = true
                } else {
                    // <+1228>
                    flag_6 = false
                }
            } else {
                // <+1212>
                flag_6 = true
            }
            
            let newRequiredBridges: HostingControllerBridges
            if flag_6 {
                // <+1212>
                let x8 = x19 & ~0x80
                let x0: Int
                if !allowedActions.contains(.unknown1) {
                    x0 = x19
                } else {
                    x0 = x8
                }
                newRequiredBridges = HostingControllerBridges(rawValue: x0)
            } else {
                // <+1228>
                let x0 = x19 | (x26 << 7)
                newRequiredBridges = HostingControllerBridges(rawValue: x0)
            }
            self.requiredBridges = newRequiredBridges
        }
        
        // <+1268> or <+660>
        resolveBarAppearanceBehavior(resolved)
        Update.end()
    }
    
    final func _update(bridgeProperties: inout ViewGraphBridgeProperties) {
        /*
         self -> x20 -> x21
         bridgeProperties -> x19
         */
        if navigationBridge != nil {
            bridgeProperties.suppliedBridges.formUnion(.unknown2)
        }
        
        // <+48>
        if let barAppearanceBridge, barAppearanceBridge.platformStorage.uiShouldUpdateNavigationController {
            // <+84>
            bridgeProperties.requestedBars.subtract(barAppearanceBridge.allowedBars)
        }
        
        // <+136>
        if contentScrollViewBridge != nil {
            bridgeProperties.suppliedBridges.formUnion(.unknown4)
        }
        
        if toolbarBridge != nil {
            bridgeProperties.suppliedBridges.formUnion(.unknown0)
        }
        
        if inspectorBridgeV5 != nil {
            bridgeProperties.suppliedBridges.formUnion(.unknown7)
        }
    }
    
    final func didChangeRequiredBridges(from oldValue: HostingControllerBridges, to newValue: HostingControllerBridges) {
        /*
         self -> x20 -> x19
         oldValue -> x0 -> x23
         newValue -> x1 -> x20
         */
        guard newValue != oldValue else {
            return
        }
        
        Update.begin()
        
        let x28 = oldValue.subtracting(requiredBridges)
        let x26 = requiredBridges.subtracting(oldValue)
        
        if x28.contains(.unknown1) {
            // <+236>
            if keyboardShortcutBridge != nil {
                // <+248>
                host.viewGraph.removePreference(KeyboardShortcutBindingsKey.self)
            }
            
            // <+344>
            if let keyboardShortcutBridge {
                keyboardShortcutBridge.flushKeyCommands(self)
            }
            
            // <+428>
            self.keyboardShortcutBridge = nil
            // <+440>
        } else if x26.contains(.unknown1) {
            // <+208>
            self.keyboardShortcutBridge = KeyboardShortcutBridge()
            // <+440>
        } else {
            // <+440>
        }
        
        // <+440>
        if x28.contains(.unknown2) {
            // <+728>
            if let navigationBridge {
                // <+740>
                host.viewGraph.removePreference(NavigationDestinationsKey.self)
            }
            
            // <+808>
            self.navigationBridge = nil
            // <+820> (<+632>와 동일)
        } else if x26.contains(.unknown2) {
            // <+448>
            self.navigationBridge = NavigationBridge_PhoneTV()
            self.navigationBridge!.host = host
            assert(self.navigationBridge != nil)
            self.host.viewGraph.addPreference(NavigationDestinationsKey.self)
            // <+632>
        } else {
            // <+632>
        }
        
        // <+632>
        if x28.contains(.unknown0) {
            // <+824>
            if let logger = Log.toolbar {
                logger.log(level: .default, "Removed toolbar bridge from \(self)")
            }
            
            // <+1120>
            if toolbarBridge != nil {
                let viewGraph = host.viewGraph
                viewGraph.removePreference(ToolbarKey.self)
                viewGraph.removePreference(SearchKey.self)
                viewGraph.removePreference(NavigationPropertiesKey.self)
                viewGraph.removePreference(UINavigationItemAdaptorKey.self)
            }
            
            self.toolbarBridge = nil
            // <+1300>
        } else if x26.contains(.unknown0) {
            // <+640>
            if let logger = Log.toolbar {
                logger.log(level: .default, "Added toolbar bridge to \(self)")
            }
            
            // <+2020>
            self.toolbarBridge = ToolbarBridge<UIKitToolbarStrategy>()
            assert(self.toolbarBridge != nil)
            host.viewGraph.addPreference(ToolbarKey.self)
            host.viewGraph.addPreference(SearchKey.self)
            host.viewGraph.addPreference(NavigationPropertiesKey.self)
            host.viewGraph.addPreference(UINavigationItemAdaptorKey.self)
            // <+2200> (<+1300>와 동일)
        } else {
            // <+1300>
        }
        
        // <+1300>
        if x28.contains(.unknown4) {
            // <+2204>
            if contentScrollViewBridge != nil {
                host.viewGraph.removePreference(ContentScrollViewPreferenceKey.self)
            }
            self.contentScrollViewBridge = nil
            // <+2296> (<+1520>와 동일)
        } else if x26.contains(.unknown4) {
            // <+1308>
            self.contentScrollViewBridge = UIKitContentScrollViewBridge()
            self.contentScrollViewBridge!.viewController = self
            host.viewGraph.addPreference(ContentScrollViewPreferenceKey.self)
            // <+1520>
        } else {
            // <+1520>
        }
        
        // <+1520>
        if x28.contains(.unknown7) {
            // <+2300>
            if let inspectorBridgeV5 {
                inspectorBridgeV5.removePreferences(from: host.viewGraph)
            }
            
            self.inspectorBridgeV5 = nil
            // <+2392>
        } else if x26.contains(.unknown7) {
            // <+1528>
            self.inspectorBridgeV5 = UIKitInspectorBridgeV5()
            
            if let inspectorBridgeV5 {
                let host = host
                inspectorBridgeV5.host = host
                inspectorBridgeV5.transitioningDelegate.host = host
            }
            
            // <+1708>
            if let inspectorBridgeV5 {
                inspectorBridgeV5.addPreferences(to: host.viewGraph)
            }
            // <+2392>
        } else {
            // <+2392>
        }
        
        // <+2392>
        Update.end()
    }
    
    final func screenEdgesSystemGesturePreferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x21
         preferences -> x0 -> x19
         */
        defer {
            screenEdgesSystemGestureSeedTracker.updateSeeds(to: preferences)
        }
        
        let hasChanges = screenEdgesSystemGestureSeedTracker.hasChanges(in: preferences)
        guard hasChanges else {
            return
        }
        
        // x25
        let gesture = preferences[ScreenEdgesSystemGestureKey.self]
        self.deferredEdges = gesture.value
        
        self.shouldDeferScreenEdgesSystemGestureToChildViewController = preferences[HostingGestureOverlayAuthorityKey.self].value
        
        if let viewController = host.viewController {
            viewController.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
        }
    }
    
    final func persistentSystemOverlaysPreferencesDidChange(_ preferences: PreferenceValues) {
        defer {
            persistentSystemOverlaysSeedTracker.updateSeeds(to: preferences)
        }
        /*
         self -> x20 -> x21
         preferences -> x0 -> x19
         */
        let hasChanges = persistentSystemOverlaysSeedTracker.hasChanges(in: preferences)
        guard hasChanges else {
            return
        }
        
        self.persistentSystemOverlays = preferences[PersistentSystemOverlaysKey.self].value
        let animated = self.persistentSystemOverlays.preferences != nil
        self.shouldDeferPersistentSystemOverlaysToChildViewController = preferences[HostingGestureOverlayAuthorityKey.self].value
        
        updateHomeIndicator(animated: animated)
    }
}

@available(iOS 16.4, tvOS 16.4, *)
@available(macOS, unavailable)
extension UIHostingController {
    @available(iOS 16.4, tvOS 16.4, *)
    @available(macOS, unavailable)
    @preconcurrency public var safeAreaRegions: SafeAreaRegions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension UIHostingController : _UIHostingViewable where Content == AnyView {
}

extension UIHostingController: @preconcurrency ViewGraphBridgePropertiesDelegate {
    func updateRequiredBridges(_ properties: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) -> ViewGraphBridgeProperties {
        assertUnimplemented()
    }
}

extension UIHostingController: KeyboardShortcutSource {
    // TODO
}

extension UIHostingController: UIHostingControllerProvider {
    var hostingControllerOverrides: HostingControllerOverrides {
        get {
            return overrides
        }
        set {
            overrides = newValue
        }
    }
}

extension UIHostingController: ContentSizedSceneDelegate {
    package var coalesceChanges: Bool {
        assertUnimplemented()
    }
    
    package var shouldIgnoreBoundsAnimations: Bool {
        if let sceneBridge = host.sceneBridge {
            return sceneBridge.isAnimatingSceneResize
        } else {
            return false
        }
    }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(macOS, unavailable)
public func _makeUIHostingController(_ view: AnyView) -> any NSObject & _UIHostingViewable {
    assertUnimplemented()
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(macOS, unavailable)
public func _makeUIHostingController(_ view: AnyView, tracksContentSize: Bool, secure: Bool = false) -> any NSObject & _UIHostingViewable {
    assertUnimplemented()
}

@available(watchOS 6.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
public func _makeWatchKitUIHostingController(_ view: AnyView) -> any NSObject & _UIHostingViewable {
    assertUnimplemented()
}

@safe fileprivate nonisolated let clientNeedsNestedToolbarBridgeSuppression: Bool = {
    // $s7SwiftUI41clientNeedsNestedToolbarBridgeSuppression33_1D3224F5185670D36FFEB48E24E43C4FLLSbvpfiSbyXEfU_
    assertUnimplemented()
}()

extension SizingPreferences {
    var hasOutOfBoundsDefaultSize: Bool {
        assertUnimplemented()
    }
    
    var geometryPreferences: UIWindowScene.GeometryPreferences.Vision {
        assertUnimplemented()
    }
}

#warning("TODO")

public import UIKit
@_spi(Internal) public import MySwiftUICore
private import _UIKitShims
private import _UIKitPrivate
private import notify
private import MRUIKit
private import RealityKit
private import TCC
private import ARKit
private import AttributeGraph

@safe fileprivate nonisolated(unsafe) var effectiveGeometryObservationContext: Int = 0

open class _UIHostingView<Content: View>: UIView {
    class var ignoresPresentations: Bool {
        return false
    }
    
    class var createsUIInteractions: Bool {
        return true
    }
    
    class var defaultViewGraphOutputs: ViewGraph.Outputs {
        return ViewGraph.Outputs.defaults
    }
    
    public var rootView: Content {
        _rootView
    }
    
    private var _rootView: Content
    private let _base: _UIKitShims.UIHostingViewBase
    private var isBaseConfigured: Bool = false
    internal final let eventBindingManager = EventBindingManager()
    private var allowUIKitAnimations: Int32 = 0
    private var disabledBackgroundColor: Bool = false
    private var allowFrameChanges: Bool = true
    private var isInSizeTransition: Bool = false
    private var transparentBackgroundReasons: HostingViewTransparentBackgroundReason = []
    private var legacyKeyboardFrame: CGRect? = nil
    private var legacyKeyboardSeed: UInt32 = 0
    private var legacyKeyboardScreen: MyUIScreen? = nil
    private var legacyKeyboardAnimation: Animation? = nil
    private weak var viewController: UIHostingController<Content>? = nil
    private var currentEvent: UIEvent? = nil
    private var eventBridge: UIKitEventBindingBridge
    private var dumpLayerNotificationTokens: Int32? = nil
    private var colorAppearanceSeed: UInt32 = 0
    final var colorScheme: ColorScheme? = nil {
        didSet {
            didChangeColorScheme(from: oldValue)
        }
    }
    private let deprecatedAlertBridge: DeprecatedAlertBridge<Alert.Presentation> = DeprecatedAlertBridge<Alert.Presentation>(
        host: nil,
        isShown: false,
        seed: .empty,
        alertController: nil,
        lastEnvironment: EnvironmentValues(),
        lastPresentation: nil,
        isChangingIdentity: false,
        style: .alert
    )
    private let deprecatedActionSheetBridge: DeprecatedAlertBridge<ActionSheet.Presentation> = DeprecatedAlertBridge<ActionSheet.Presentation>(
        host: nil,
        isShown: false,
        seed: .empty,
        alertController: nil,
        lastEnvironment: EnvironmentValues(),
        lastPresentation: nil,
        isChangingIdentity: false,
        style: .alert
    )
    private lazy var sheetBridge: SheetBridge<SheetPreference.Key>? = {
        guard !Self.ignoresPresentations else {
            return nil
        }
        return SheetBridge<SheetPreference.Key>()
    }()
    private(set) final var focusBridge = FocusBridge()
    private let dragBridge = DragAndDropBridge()
    private var popoverBridge: UIKitPopoverBridge?
    internal final var inspectorBridge: UIKitInspectorBridgeV3? = nil
    private var tooltipBridge = TooltipBridge()
    private var editMenuBridge = EditMenuBridge()
    private var sharingActivityPickerBridge: SharingActivityPickerBridge? = nil
    private var shareConfigurationBridge: ShareConfigurationBridge? = nil
    private var statusBarBridge = UIKitStatusBarBridge()
    private weak var sceneBridge: SceneBridge? = nil
    private var scenePresentationBridge: ScenePresentationBridge? = nil
    private var pointerBridge: PointerBridge? = nil
    private var feedbackBridge: UIKitFeedbackGeneratorBridge<Content>? = nil
    private let mruiPreferenceExporter = MRUIPreferenceExporter()
    private var renderingMarginsBridge: RenderingMarginsBridge<Content>? = nil
    private var objectManipluateBridge = UIKitObjectManipulationBridge<Content>()
    private var remoteSessionController: RemoteScenes.SessionController? = nil
    private lazy var feedbackCache = UIKitSensoryFeedbackCache()
    private var contextMenuBridge = ContextMenuBridge()
    private var interactiveResizeBridge = InteractiveResizeBridge()
    private var shouldUpdateAccessibilityFocus: Bool = false
    private let largeContentViewerInteractionBridge = UILargeContentViewerInteractionBridge()
    private lazy var presentationModeLocation = LocationBox(location: UIKitPresentationModeLocation(host: self))
    private lazy var scenePresentationModeLocation = LocationBox(location: UIKitScenePresentationModeLocation(host: self))
    private var sceneSize: CGSize = .zero
    private var _boundsDepth: CGFloat = 0
    private var scrollTest: ScrollTest? = nil
    private weak var delegate: UIHostingViewDelegate? = nil
    private var rootViewDelegate: RootViewDelegate? = nil
    final var focusedValues = FocusedValues()
    private var disallowAnimations: Bool = false
    private weak var windowGeometryScene: UIWindowScene? = nil
    private var invalidatesIntrinsicContentSizeOnIdealSizeChange: Bool = false
    private var appliesContainerBackgroundColor: Bool = false
    private var containerBackgroundColor: UIColor? = nil
    private let surpressGraphUpdateIfNotInHierarchy: Bool = {
        if Bundle.main.bundleIdentifier == "com.studiolanes.ticker" {
            return isLinkedOnOrAfter(.v6)
        } else {
            return false
        }
    }()
    private lazy var foreignSubviews: NSHashTable<UIView> = {
        fatalError("TODO")
    }()
    private var insertingManagedSubviews: Int = 0
    
    private var inheritedEnvironment: EnvironmentValues? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    private var shouldDeferToChildViewController: Bool {
        return statusBarBridge.shouldDeferToChildViewController
    }
    
    private var boundsDepth: CGFloat {
        get {
            return _boundsDepth
        }
        set {
            _boundsDepth = newValue
            immersiveSpaceAuthorityDidChangeCurrentImmersiveSpace()
        }
    }
    
    private var base: _UIKitShims.UIHostingViewBase {
        let base = _base
        base.uiView = self
        base.delegate = self
        base.updateDelegate = self
        base.viewGraph.renderer.host = self
        return base
    }
    
    private var traitCollectionOverride: UITraitCollection? {
        return base.traitCollectionOverride
    }
    
    private var accessibilityEnabled: Bool {
        get {
            return _base.accessibilityEnabled
        }
        set {
            let oldValue = _base.accessibilityEnabled
            _base.accessibilityEnabled = newValue
            
            if oldValue != newValue {
                AccessibilityFocus.changed(from: nil, to: nil, within: self)
            }
        }
    }
    
    private var isPresentedInModalViewController: Bool {
        guard let viewController else {
            return false
        }
        
        return (viewController.presentingViewController != nil)
    }
    
    private var isPresentedInNavigationController: Bool {
        guard let navigationController = self.viewController?.navigationController else {
            return false
        }
        
        let viewControllers = navigationController.viewControllers
        
        guard !viewControllers.isEmpty else {
            return false
        }
        
        return (navigationController.topViewController == self.viewController)
    }
    
    public required init(rootView: Content) {
        self._rootView = rootView
        
        Update.begin()
        
        PlatformColorDefinition.setInternalDefinition(UIKitPlatformColorDefinition.self, system: .uiKit)
        PlatformScrollEdgeEffectTagDefinition.setDefinition(ScrollEdgeEffectTagModifierDefinition.self)
        let viewDefinition = PlatformViewDefinition.for(UIView.self)!
        let viewGraphHost = ViewGraphHost(rootViewType: Content.self, outputs: .defaults, viewDefinition: viewDefinition)
        let viewGraph = viewGraphHost.viewGraph
        
        var configuration = UIHostingViewBase.Configuration()
        configuration.options.insert(.allowKeyboardSafeArea)
        
        if !Geometry3DEffectImpl._affectsLayout {
            configuration.options.insert(.allowUnregisteredGeometryChanges)
        }
        
        self._base = UIHostingViewBase(viewGraph: viewGraphHost, configuration: configuration)
        
        viewGraph.append(feature: FocusViewGraph(graph: viewGraph))
        viewGraph.append(feature: PlatformItemListViewGraph())
        
        if _UIUpdateAdaptiveRateNeeded() {
            viewGraph.append(feature: EnableVFDFeature())
        }
        
        viewGraph.append(feature: ViewGraph3D(graph: viewGraph))
        viewGraph.append(feature: AccessibilityViewGraph(graph: viewGraph))
        viewGraph.append(feature: InteractiveResizeChangeViewGraphFeature(viewGraph: viewGraph, bridge: interactiveResizeBridge))
        
        eventBindingManager.addForwardedEventDispatcher(HoverEventDispatcher3D())
        eventBindingManager.addForwardedEventDispatcher(KeyEventDispatcher())
        
        self.eventBridge = UIKitEventBindingBridge(eventBindingManager: eventBindingManager)
        super.init(frame: .zero)
        viewGraphHost.updateDelegate = self
        
        viewGraph.append(feature: HostViewGraph(host: self))
        _base.setUp()
        
        if let values = unsafe RepresentableContextValues.current {
            if let preferenceBridge = values.preferenceBridge {
                self.setPreferenceBridge(preferenceBridge)
            }
            
            self.inheritedEnvironment = values.environment
        }
        
        feedbackCache.host = self
        
        let statusBarBridge = statusBarBridge
        statusBarBridge.host = self
        statusBarBridge.addPreferences(to: viewGraph)
        
        contextMenuBridge.host = self
        
        let deprecatedAlertBridge = deprecatedAlertBridge
        deprecatedAlertBridge.host = self
        deprecatedAlertBridge.addPreferences(to: viewGraph, isActionSheet: false)
        
        let deprecatedActionSheetBridge = deprecatedActionSheetBridge
        deprecatedActionSheetBridge.host = self
        deprecatedActionSheetBridge.addPreferences(to: viewGraph, isActionSheet: true)
        
        if let sheetBridge {
            sheetBridge.host = self
            sheetBridge.transitioningDelegate.host = self
            sheetBridge.addPreferences(to: viewGraph)
        }
        
        let focusBridge = focusBridge
        focusBridge._host = self
        focusBridge.addPreferences(to: viewGraph)
        
        let dragBridge = dragBridge
        dragBridge.host = self
        dragBridge.addPreferences(to: viewGraph)
        
        let tooltipBridge = tooltipBridge
        tooltipBridge.host = self
        tooltipBridge.addPreferences(to: viewGraph)
        
        let editMenuBridge = editMenuBridge
        editMenuBridge.host = self
        editMenuBridge.addPreferences(to: viewGraph)
        
        if self.traitCollection.userInterfaceIdiom == .vision {
            self.feedbackBridge = UIKitFeedbackGeneratorBridge<Content>()
            self.feedbackBridge?.host = self
            self.feedbackBridge?.addPreferences(to: viewGraph)
            
            self.objectManipluateBridge.host = self
            self.objectManipluateBridge.addPreferences(to: viewGraph)
        }
        
        if self.traitCollection.userInterfaceIdiom == .pad || self.traitCollection.userInterfaceIdiom == .vision {
            let pointerBridge = PointerBridge()
            pointerBridge.host = self
            pointerBridge.addPreferences(to: viewGraph)
            self.pointerBridge = pointerBridge
        }
        
        contextMenuBridge.addPreferences(to: viewGraph)
        mruiPreferenceExporter.host = self
        mruiPreferenceExporter.addPreferences(to: viewGraph)
        largeContentViewerInteractionBridge.host = self
        largeContentViewerInteractionBridge.updateRequestedPreferences(for: viewGraph)
        eventBindingManager.host = self
        eventBindingManager.delegate = self
        
        let eventBridge = eventBridge
        if let gestureRecognizer = eventBridge.gestureRecognizer {
            addGestureRecognizer(gestureRecognizer.twoHandedInteractionRelationshipGesture)
            addGestureRecognizer(gestureRecognizer)
        }
        addGestureRecognizer(eventBridge.hoverGestureRecognizer)
        
        let notificationCenter = NotificationCenter.default
        
        if isAppleInternalBuild() && isWindowRoot {
            let pid = getpid()
            unsafe withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
                _ = unsafe notify_register_dispatch("NameLayerTree-\(pid)", outToken.baseAddress, .main, { [weak self] token in
                    self?.setLayerDebugName()
                })
            }
            unsafe withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
                _ = unsafe notify_register_dispatch("NameLayerTree", outToken.baseAddress, .main, { [pid, weak self] token in
                    let state64 = unsafe withUnsafeTemporaryAllocation(of: UInt64.self, capacity: 1) { outState64 in
                        unsafe notify_get_state(token, outState64.baseAddress)
                        return unsafe outState64.baseAddress.unsafelyUnwrapped.pointee
                    }
                    
                    if pid != -1 && state64 == pid {
                        self?.setLayerDebugName()
                    }
                })
            }
        }
        
        unsafe notificationCenter.addObserver(self, selector: #selector(accessibilityFocusedElementDidChange(_:)), name: UIAccessibility.elementFocusedNotification, object: nil)
        addToHostingViewRegistry()
        
        if !Spacing.hasSetupDefaultValue {
            Spacing.hasSetupDefaultValue = true
        }
        
        Update.end()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override dynamic var frame: CGRect {
        get {
            return super.frame
        }
        set {
            guard allowFrameChanges else {
                return
            }
            let oldValue = self.frame
            super.frame = newValue
            base.frameDidChange(oldValue: oldValue)
        }
    }
    
    open override dynamic var bounds: CGRect {
        get {
            return super.bounds
        }
        set {
            guard allowFrameChanges else {
                return
            }
            let oldValue = self.bounds
            super.bounds = newValue
            base.frameDidChange(oldValue: oldValue)
        }
    }
    
    open override dynamic func didMoveToWindow() {
        Update.begin()
        
        eventBridge.hostingView(self, didMoveToWindow: window)
        
        if rootViewDelegate == nil, isWindowRoot {
            rootViewDelegate = RootViewDelegate()
            if let delegate {
                rootViewDelegate?.nextDelegate = delegate
            }
            
            self.delegate = rootViewDelegate
        }
        
        if let delegate {
            delegate.hostingView(self, didMoveTo: window)
        }
        
        if window == nil {
            contextMenuBridge.hostRemovedFromWindow()
            editMenuBridge.hostRemovedFromWindow()
        }
        
        if window == nil {
            sharingActivityPickerBridge?.hostRemovedFromWindow()
        }
        
        if window != nil {
            updateEventBridge()
        }
        updateWindowGeometryScene()
        
        if let windowScene = window?.windowScene {
            let size = windowScene.effectiveGeometry._size
            if allowFrameChanges {
                boundsDepth = size.depth
            }
            immersiveSpaceAuthorityDidChangeCurrentImmersiveSpace()
        }
        
        if let renderingMarginsBridge {
            renderingMarginsBridge.hostDidMove(to: window?.windowScene)
        }
        
        _ = focusBridge.host
        viewController?._viewDidMoveToWindow()
        
        sheetBridge?.didMoveToWindow()
        _base.didMoveToWindow()
        
        Update.end()
    }
    
    open override dynamic func layoutSubviews() {
        super.layoutSubviews()
        base.layoutSubviews()
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /*
         self = x21
         previousTraitCollection = x19
         */
        super.traitCollectionDidChange(previousTraitCollection)
        
        if
            (shouldDisableUIKitAnimation && isLinkedOnOrAfter(.v3)),
            let transaction = Transaction.currentUIViewTransaction(canDisableAnimations: true)
        {
            viewGraph.emptyTransaction(transaction)
        }
        
        // <+164>
        let userInterfaceIdiom = self.traitCollection.userInterfaceIdiom
        if let previousTraitCollection, userInterfaceIdiom == previousTraitCollection.userInterfaceIdiom {
            // nop
        } else {
            updateEventBridge()
        }
        
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            colorAppearanceSeed &+= 1
        }
        
        // <+332>
        base.traitCollectionDidChange(previousTraitCollection)
    }
    
    package final var isWindowRoot: Bool {
        guard let window else {
            return false
        }
        guard let rootViewController = window.rootViewController else {
            return false
        }
        guard let rootView = rootViewController.viewIfLoaded else {
            return false
        }
        return self == rootView
    }
    
    private final var navigationBridge: NavigationBridge_PhoneTV? {
        guard let viewController else {
            return nil
        }
        
        return viewController.navigationBridge
    }
    
    private func setLayerDebugName() {
        fatalError("TODO")
    }
    
    @objc private func accessibilityFocusedElementDidChange(_ notification: Notification) {
        fatalError("TODO")
    }
    
    private func addToHostingViewRegistry() {
        HostingViewRegistry.shared.add(self)
    }
    
    final func updateEventBridge() {
        let eventBridge = eventBridge
        guard traitCollection.userInterfaceIdiom == .carPlay else {
            return
        }
        guard let gestureRecognizer = eventBridge.gestureRecognizer else {
            return
        }
        
        gestureRecognizer.allowedTouchTypes = [NSNumber(integerLiteral: UITouch.TouchType.direct.rawValue)]
    }
    
    private func updateWindowGeometryScene() {
        let windowScene = window?.windowScene
        
        guard windowScene != windowGeometryScene else {
            return
        }
        
        windowGeometryScene?.removeObserver(self, forKeyPath: #keyPath(UIWindowScene.effectiveGeometry))
        
        if let windowScene {
            unsafe windowScene.addObserver(self, forKeyPath: #keyPath(UIWindowScene.effectiveGeometry), options: .new, context: &effectiveGeometryObservationContext)
        }
        windowGeometryScene = windowScene
    }
    
    @objc private func immersiveSpaceAuthorityDidChangeCurrentImmersiveSpace() {
        invalidateProperties([.transform], mayDeferUpdate: true)
    }
    
    @objc private func immersiveSpaceAuthorityDidChangeImmersion() {
        fatalError("TODO")
    }
    
    @objc private func sceneDidChangeImmersionState() {
        fatalError("TODO")
    }
    
    override func addManagedInteraction(_ interaction: any UIInteraction) {
        fatalError("TODO")
    }
    
    private func updateSnappingState(environment: inout EnvironmentValues) {
        // environment = x24
        // x27/x29, #-0xa0
        guard let windowScene = window?.windowScene else {
            return
        }
        
        // x21
        var surfaceSnappingInfo = environment.surfaceSnappingInfo
        surfaceSnappingInfo.isSnapped = windowScene.isSnappedToSurface
        // <+380>
        // x19
        var authorization = tcc_authorization_preflight(kTCCServiceWorldSensing, nil)
        
        if
            let wantsDetailedSurfaceInfo = Bundle.main.infoDictionary?["UIWantsDetailedSurfaceInfo"] as? Bool,
            wantsDetailedSurfaceInfo,
            authorization == 1,
            windowScene.isSnappedToSurface
        {
            tcc_authorization_request(kTCCServiceWorldSensing, nil) { result in
                // $s7SwiftUI14_UIHostingViewC19updateSnappingState11environmentyAA17EnvironmentValuesVz_tFySo25tcc_authorization_right_tacfU_TA
                authorization = result
            }
        }
        
        // environment = x19
        // <+872>
        // x29, #-0x90 (value), w19 (Optional)
        let surfaceClassification: SurfaceClassification?
        if authorization == 0 {
            // <+1064>
            SurfaceSnappingInfo.authorizationStatus = .denied
            surfaceClassification = nil
            // <+1272>
        } else if authorization != 2 {
            // <+1120>
            SurfaceSnappingInfo.authorizationStatus = .notDetermined
            surfaceClassification = nil
            // <+1272>
        } else {
            // <+928>
            SurfaceSnappingInfo.authorizationStatus = .authorized
            
            if windowScene.isSnappedToSurface {
                // <+1028>
                surfaceClassification = SurfaceClassification(windowScene.snappingSurfaceClassification)
                // <+1216>
            } else {
                surfaceClassification = nil
            }
            
            // <+1272>
        }
        
        // <+1272>
        surfaceSnappingInfo.classification = surfaceClassification
        environment.surfaceSnappingInfo = surfaceSnappingInfo
    }
    
    private func didChangeColorScheme(from oldColorScheme: ColorScheme?) {
        // oldColorScheme = x27 -> (copy) x23
        // x26 -> (copy) x23 + x19
        let newColorScheme = self.colorScheme
        
        guard (oldColorScheme != nil) || (newColorScheme != nil) else {
            return
        }
        
        // <+436>
        fatalError("TODO")
    }
    
    private var shouldDisableUIKitAnimation: Bool {
        if let sceneBridge, sceneBridge.isAnimatingSceneResize {
            return true
        }
        
        // <+48>
        if allowUIKitAnimations != 0 {
            return false
        } else if base.allowUIKitAnimationsForNextUpdate {
            return false
        } else if isInSizeTransition {
            return false
        } else if isResizingSheet {
            return false
        } else if isRotatingWindow {
            return false
        } else if isTabSidebarMorphing {
            return false
        } else {
            return true
        }
    }
    
    private var isRotatingWindow: Bool {
        return base.isRotatingWindow
    }
    
    private var isResizingSheet: Bool {
        let w19: Bool
        if let window {
            if let rootSheetPresentationController = window._rootSheetPresentationController() {
                w19 = rootSheetPresentationController._isGeneratingAnimations
            } else {
                w19 = false
            }
        } else {
            w19 = false
        }
        
        let w21: Bool
        if let containingViewController {
            if let activePresentationController = containingViewController.activePresentationController as? UISheetPresentationController {
                w21 = activePresentationController._isGeneratingAnimations
            } else {
                w21 = false
            }
        } else {
            w21 = false
        }
        
        return (w19 || w21)
    }
    
    private var isTabSidebarMorphing: Bool {
        guard let uiViewController else {
            return false
        }
        
        guard let tabBarController = uiViewController.tabBarController else {
            return false
        }
        
        return tabBarController._inSidebarTransition
    }
}

protocol UIHostingViewDelegate: AnyObject {
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout EnvironmentValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didUpdate values: EnvironmentValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, willUpdate: inout ViewGraphBridgeProperties)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: PreferenceValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList)
    func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout _ViewInputs)
}

extension _UIHostingView {
    struct EnableVFDFeature: ViewGraphFeature {
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        func uninstantiate(graph: ViewGraph) {
            fatalError("TODO")
        }
        
        func isHiddenForReuseDidChange(graph: ViewGraph) {
            fatalError("TODO")
        }
        
        func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
            fatalError("TODO")
        }
        
        func needsUpdate(graph: ViewGraph) -> Bool {
            fatalError("TODO")
        }
        
        func update(graph: ViewGraph) {
            fatalError("TODO")
        }
    }
}

extension _UIHostingView {
    fileprivate struct HostViewGraph<T: View>: ViewGraphFeature {
        private weak var host: _UIHostingView<T>?
        
        init(host: _UIHostingView<T>) {
            self.host = host
        }
        
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            guard let host else {
                return
            }
            
            inputs.base[EventBindingBridgeFactoryInput.self] = UIKitResponderEventBindingBridge.Factory.self
            inputs.base[GestureContainerFactoryInput.self] = ViewResponderGestureContainerFactory.self
            inputs.animationsDisabled = MainActor.assumeIsolated { host.disallowAnimations }
            inputs.base.platformProvidersDefinition = SwiftUIPlatformProvidersDefinition.self
            inputs.base.coreInteractionResponderProvider = UIInteractionResponderProvider.self
            
            // <+532>
            inputs.base.updateCycleUseSetNeedsLayout = UIKitUpdateCycle.defaultUseSetNeedsLayout
            
            if let delegate = MainActor.assumeIsolated({ UncheckedSendable(host.delegate) }).value {
                delegate.hostingView(host, willModifyViewInputs: &inputs)
            }
            
            // <+808>
            var inputsBox = UncheckedSendable(inputs)
            Update.syncMain {
                // $s7SwiftUI14_UIHostingViewC04HostD5Graph33_FAF0B683EB49BE9BABC9009857940A1ELLV06modifyD6Inputs6inputs5graphyAA01_dN0Vz_AA0dF0CtFyyXEfU_
                let idiom = host.traitCollection.userInterfaceIdiom
                if inputsBox.value[InterfaceIdiomInput.self] == nil {
                    inputsBox.value[InterfaceIdiomInput.self] = idiom.idiom
                }
            }
            inputs = inputsBox.value
            _ = consume inputsBox
            
            // <+856>
            inputs.uiKitHostContainerFocusItem = Attribute(value: WeakBox(host))
            
            // <+1016>
            if let navigationBridge = MainActor.assumeIsolated({ UncheckedSendable(host.navigationBridge) }).value {
                navigationBridge.hasSearch = inputs[IsSearchAllowedInput.self]
            }
            
            // <+1128>
            let viewStyle = ViewStyleRegistry.InterfaceIdiom(idiom: inputs.base.interfaceIdiom)
            let overrides = ViewStyleRegistry.overrides(for: viewStyle)
            overrides.register(in: &inputs)
        }
    }
}

extension _UIHostingView: @preconcurrency ViewRendererHost {
    package nonisolated final var viewGraph: MySwiftUICore.ViewGraph {
        return self._base.viewGraph.viewGraph
    }
    
    package final var currentTimestamp: MySwiftUICore.Time {
        get {
            fatalError("TODO")
        }
        set(newValue) {
            fatalError("TODO")
        }
    }
    
    package final var valuesNeedingUpdate: MySwiftUICore.ViewGraphRootValues {
        get {
            fatalError("TODO")
        }
        set(newValue) {
            fatalError("TODO")
        }
    }
    
    package final var renderingPhase: MySwiftUICore.ViewRenderingPhase {
        get {
            fatalError("TODO")
        }
        set(newValue) {
            fatalError("TODO")
        }
    }
    
    package final var externalUpdateCount: Int {
        get {
            fatalError("TODO")
        }
        set(newValue) {
            fatalError("TODO")
        }
    }
    
    package final func updateRootView() {
        viewGraph.setRootView(_rootView)
    }
    
    package final func updateEnvironment() {
        // x24 / x19 + 0xa8
        let environment = base._startUpdateEnvironment()
        
        // x24
        var resolved: EnvironmentValues
        do {
            let traitCollection = self.traitCollection
            let resolved_1 = traitCollection.resolvedPreEnvironment(base: EnvironmentValues(environment))
            let resolved_2 = traitCollection.coreResolvedBaseEnvironment(base: resolved_1)
            let resolved_3 = traitCollection.resolvedPostEnvironment(base: resolved_2)
            _ = consume traitCollection
            resolved = resolved_3
        }
        
        resolved.configureForPlatform(traitCollection: self.traitCollection)
        resolved[InheritedColorSeedKey.self] = colorAppearanceSeed
        
        if let delegate {
            delegate.hostingView(self, willUpdate: &resolved)
        }
        
        // <+1384>
        if !ViewGraphBridgePropertiesAreInput.isEnabled {
            if let delegate {
                delegate.hostingView(self, willUpdate: &resolved.viewGraphBridgeProperties)
            }
            
            // <+1544>
            if let viewController {
                viewController.resolveRequiredBridges(resolved.viewGraphBridgeProperties, allowedActions: [.unknown1, .unknown2])
            }
        }
        
        // <+1640>
        base._updateEnvironment(&resolved)
        
        // x19, #0x98
        _ = traitCollectionOverride ?? self.traitCollection
        
        // <+1700>
        if resolved.accessibilityInvertColors {
            resolved.ignoreInvertColorsFilterActive = _ancestorHasInvertFilterApplied()
        }
        
        // <+1764>
        if window != nil {
            resolved.accentColor = Color(_platformColor: _undimmedTintColor(), definition: UIKitPlatformColorDefinition.self)
        }
        
        // <+1868>
        if tintAdjustmentMode == .dimmed {
            // <+1892>
            resolved.effectiveTintAdjustmentMode = .desaturated
        }
        
        // <+1952>
        if accessibilityEnabled {
            resolved.accessibilityEnabled = true
        }
        
        // <+1976>
        if let windowScene = window?.windowScene {
            let systemUserInterfaceStyle = windowScene._systemUserInterfaceStyle
            switch systemUserInterfaceStyle {
            case .light:
                resolved.systemColorScheme = .light
            case .dark:
                resolved.systemColorScheme = .dark
            default:
                break
            }
        }
        
        // <+2228>
        resolved.windowScene = window?.windowScene
        resolved.undoManager = undoManager
        
        let focusAction: AccessibilityRequestFocusAction
        if accessibilityEnabled {
            focusAction = AccessibilityRequestFocusAction(onAccessibilityFocus: { _, _ in
                // partial apply forwarder for closure #2 (Swift.AnyHashable, SwiftUI.Namespace.ID) -> () in SwiftUI._UIHostingView.updateEnvironment() -> ()
                fatalError("TODO")
            })
        } else {
            focusAction = AccessibilityRequestFocusAction(onAccessibilityFocus: nil)
        }
        resolved.requestAccessibilityFocus = focusAction
        
        resolved.presentationMode = Binding(
            value: PresentationMode(isPresented: (isPresentedInModalViewController || isPresentedInNavigationController)),
            location: presentationModeLocation
        )
        
        resolved.dismissWindow.presentationMode = Binding(
            value: PresentationMode(isPresented: (window?.windowScene != nil)),
            location: scenePresentationModeLocation
        )
        
        // <+3000>
        // x29, #-0xf0
        var viewGraphBridgeProperties = resolved.viewGraphBridgeProperties
        
        if let viewController {
            viewController.update(&resolved)
        }
        
        if
            ViewGraphBridgePropertiesAreInput.isEnabled,
            let viewController
        {
            viewController.updateViewGraphBridges(&viewGraphBridgeProperties)
        }
        
        // <+3140>
        resolved.activeContextMenu = contextMenuBridge.presentedMenu
        deprecatedAlertBridge.update(environment: resolved)
        deprecatedActionSheetBridge.update(environment: resolved)
        
        if let sheetBridge {
            sheetBridge.update(environment: resolved)
        }
        
        // <+3364>
        if
            !ViewGraphBridgePropertiesAreInput.isEnabled,
            let sheetBridge
        {
            sheetBridge.hostingView(self, willUpdate: &viewGraphBridgeProperties)
        }
        
        // <+3440>
        focusBridge.updateEnvironment(&resolved)
        
        if let popoverBridge {
            if resolved.scenePhase == .background {
                popoverBridge.wasBackgrounded = true
            } else if popoverBridge.wasBackgrounded {
                popoverBridge.wasBackgrounded = false
                popoverBridge.updateAnchor()
            }
        }
        
        // <+3584>
        resolved.activeEditMenu = editMenuBridge.presentedMenu
        objectManipluateBridge.updateEnvironment(&resolved)
        updateSnappingState(environment: &resolved)
        
        if let renderingMarginsBridge {
            renderingMarginsBridge.updateEffectiveClippingMargins(environment: &resolved)
        }
        
        if let appDelegate = AppDelegate.shared {
            let immersiveSpaceAuthority = appDelegate.immersiveSpaceAuthority
            let windowScene = window?.windowScene
            let immersiveSpaceScene = immersiveSpaceAuthority.immersiveSpaceScene
            
            var pose: Pose3D
            let flag: Bool // true -> <+4224>
            if let windowScene {
                if let immersiveSpaceScene {
                    if immersiveSpaceScene == windowScene {
                        // <+3988>
                        if let casted = immersiveSpaceScene as? UIWindowScene {
                            // <+4020>
                            pose = casted._mrui_systemSceneDisplacement()
                            // <+4224>
                            flag = true
                        } else {
                            // +4180>
                            pose = Pose3D(position: .zero, rotation: simd_quatd(ix: 0, iy: 1, iz: 0, r: 0))
                            // <+4224>
                            flag = true
                        }
                    } else {
                        // <+4112>
                        pose = Pose3D.identity
                        // <+4456>
                        flag = false
                    }
                } else {
                    // <+4104>
                    pose = Pose3D.identity
                    // <+4456>
                    flag = false
                }
            } else {
                if immersiveSpaceScene != nil {
                    // <+4112>
                    pose = Pose3D.identity
                    // <+4456>
                    flag = false
                } else {
                    // <+4144>
                    pose = Pose3D(position: .zero, rotation: simd_quatd(ix: 0, iy: 1, iz: 0, r: 0))
                    // <+4224>
                    flag = true
                }
            }
            
            if flag {
                // <+4224>
                pose.position = resolved.pointScale.convert(pose.position, to: .meters)
            }
            
            // <+4456>
            resolved.systemExperienceDisplacement = pose
            
            if immersiveSpaceAuthority.immersiveSpaceScene == nil {
                resolved.immersion = nil
            } else {
                resolved.immersion = immersiveSpaceAuthority._immersion
            }
            
            if let remoteSessionController {
                resolved.remoteSessionController = remoteSessionController
            }
        }
        
        // <+4608>
        if let sceneBridge, ClientSideSceneClipping3DDuringResize.isEnabled {
            resolved.isAnimatingSceneResize = sceneBridge.isAnimatingSceneResize
        }
        
        // <+4832>
        if let windowScene = window?.windowScene {
            let capabilities = windowScene._worldTrackingCapabilities()
            var worldTrackingLimitations: Set<WorldTrackingLimitation> = []
            if capabilities.contains(.translation) {
                worldTrackingLimitations.insert(.translation)
            }
            if capabilities.contains(.orientation) {
                worldTrackingLimitations.insert(.orientation)
            }
            resolved.worldTrackingLimitations = worldTrackingLimitations
        }
        
        // <+5068>
        if let layerEntity = window?.layerEntity {
            resolved.realityScene = WeakBox(layerEntity.scene)
        } else {
            resolved.realityScene = WeakBox(nil)
        }
        
        // <+5268>
        if !ViewGraphBridgePropertiesAreInput.isEnabled {
            resolved.viewGraphBridgeProperties = viewGraphBridgeProperties
        }
        
        // <+5352>
        if let delegate {
            delegate.hostingView(self, didUpdate: resolved)
        }
        
        base._endUpdateEnvironment(resolved)
    }
    
    package final func updateTransform() {
        // self = x19
        base._updateTransform()
        
        if let popoverBridge {
            popoverBridge.updateAnchor()
        }
        
        // <+144>
        let editMenuBridge = editMenuBridge
        if editMenuBridge.presentedMenu != nil {
            if let interaction = editMenuBridge.interaction {
                interaction.updateVisibleMenuPosition(animated: true)
            }
        }
        
        // <+336>
        if let viewController {
            fatalError("TODO")
//            viewController.dialogBridge.transformDidChange()
        }
        
        // <+392>
        if let sharingActivityPickerBridge {
            sharingActivityPickerBridge.transformDidChange()
        }
        
        // <+424>
        if let legacyKeyboardFrame {
            invalidateProperties(.safeArea, mayDeferUpdate: false)
        }
    }
    
    package final func updateSize() {
        base._updateSize()
    }
    
    package final func updateSafeArea() {
        base._updateSafeArea(
            container: {
                // $s7SwiftUI14_UIHostingViewC14updateSafeAreayyFAA10EdgeInsetsVyXEfU_TA
                return base._containerSafeArea
            },
            keyboardHeight: {
                // $s7SwiftUI14_UIHostingViewC14updateSafeAreayyF12CoreGraphics7CGFloatVyXEfU0_TA
                return hostKeyboardHeight
            }
        )
    }
    
    package final func updateContainerSize() {
        base._updateContainerSize()
    }
    
    package final func updateFocusStore() {
        guard viewGraph.requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        viewGraph.setFocusStore(focusBridge.focusStore)
    }
    
    package final func updateFocusedItem() {
        guard viewGraph.requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        viewGraph.setFocusedItem(focustedItem)
    }
    
    package final func updateFocusedValues() {
        guard viewGraph.requestedOutputs.isSuperset(of: .focus) else {
            return
        }
        
        viewGraph.setFocusedValues(focusedValues)
    }
    
    package final func updateAccessibilityEnvironment() {
        fatalError("TODO")
    }
    
    package final func `as`<T>(_ type: T.Type) -> T? {
        if let result = _base._as(type) {
            return result
        } else if let result = viewController?._as(type) {
            return result
        } else if let result = _specialize(self as (any FocusHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any PlatformItemListHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any AccessibilityHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any UICoreViewControllerProvider), for: T.self) {
            return result
        } else if let result = _specialize(self as (any EventGraphHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any PointerHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any WindowLayoutHost), for: T.self) {
            return result
        } else if T.self == UIView.self {
            return unsafe unsafeBitCast(self, to: T.self)
        } else if let result = _specialize(self as (any CurrentEventProvider), for: T.self) {
            return result
        } else if let result = _specialize(self as (any FallbackResponderProvider), for: T.self) {
            return result
        } else if let result = _specialize(self as (any ContainerBackgroundHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any RootTransformProvider), for: T.self) {
            return result
        } else if let result = _specialize(self as (any RootTransformUpdater), for: T.self) {
            return result
        } else if let result = _specialize(self as (any ViewRendererHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any UIHostingViewProvider), for: T.self) {
            return result
        } else if let result = _specialize(self as (any ViewGraphRenderObserver), for: T.self) {
            return result
        } else if let result = _specialize(self as (any ToolbarInputFeatureDelegate), for: T.self) {
            return result
        } else if let result = _specialize(self as (any SensoryFeedbackCacheHost), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    package nonisolated final func requestUpdate(after time: Double) {
        MainActor.assumeIsolated {
            base._requestUpdate(after: time)
        }
    }
    
    package nonisolated final func startUpdateTimer(delay: Double) {
        fatalError("TODO")
    }
    
    package final func setNeedsUpdate() {
        base._setNeedsUpdate()
    }
    
    package final func preferencesDidChange() {
        // x25
        let preferenceValues = viewGraph.preferenceValues()
        
        if let viewController {
            viewController.preferencesDidChange(preferenceValues)
        }
        
        dragBridge.preferencesDidChange(preferenceValues)
        if let pointerBridge {
            pointerBridge.preferencesDidChange(preferenceValues)
        }
        if let feedbackBridge {
            feedbackBridge.preferencesDidChange(preferenceValues)
        }
        contextMenuBridge.preferencesDidChange(preferenceValues)
        statusBarBridge.preferencesDidChange(preferenceValues)
        if let sceneBridge {
            sceneBridge.preferencesDidChange(preferenceValues)
        }
        if let scenePresentationBridge {
            scenePresentationBridge.preferencesDidChange(preferenceValues)
        }
        deprecatedAlertBridge.preferencesDidChange(preferenceValues)
        deprecatedActionSheetBridge.preferencesDidChange(preferenceValues)
        if let inspectorBridge {
            inspectorBridge.updateInspectorIfNeeded(preferenceValues)
            let presentation = preferenceValues[PopoverPresentation.Key.self]
            let options = preferenceValues[PresentationOptionsPreferenceKey.self]
            let host = preferenceValues[ContainerBackgroundKeys.HostTransparency.self]
            
            inspectorBridge.updatePopoverIfNeeded(presentation, presentationOptionsPreference: options, backgroundPreference: host)
        }
        editMenuBridge.preferencesDidChange(preferenceValues)
        if let sheetBridge {
            sheetBridge.preferencesDidChange(preferenceValues)
        }
        focusBridge.preferencesDidChange(preferenceValues)
        if let sharingActivityPickerBridge {
            sharingActivityPickerBridge.preferencesDidChange(preferenceValues)
        }
        if let shareConfigurationBridge {
            let pref = preferenceValues[AnyShareConfiguration.Key.self]
            if !shareConfigurationBridge.shareConfigurationSeed.seed.matches(pref.seed) {
                shareConfigurationBridge.shareConfigurationSeed.seed.merge(pref.seed)
                shareConfigurationBridge.shareConfigurationDidChange(pref.value)
            }
        }
        
        largeContentViewerInteractionBridge.preferencesDidChange(preferenceValues)
        mruiPreferenceExporter.preferencesDidChange(preferenceValues)
        if let renderingMarginsBridge {
            renderingMarginsBridge.preferencesDidChange(preferenceValues)
        }
        objectManipluateBridge.preferencesDidChange(preferenceValues)
        
        let tooltipBridge = tooltipBridge
        tooltipBridge.preferencesDidChange(preferenceValues)
        
        if let delegate {
            delegate.hostingView(self, didChangePreferences: preferenceValues)
        }
    }
    
    package final func beginTransaction() {
        onMainThread { [weak self] in
            if UIKitUpdateCycle.defaultUseSetNeedsLayout {
                if let self {
                    self.base._setNeedsUpdate()
                }
            }
            
            if UIHostingViewBase.UpdateCycle.isEnabled {
                UIHostingViewBase.UpdateCycle.addPreCommitObserver {
                    Update.ensure {
                        guard let self else { return }
                        self.updateGraph { graphHost in
                            graphHost.flushTransactions()
                        }
                    }
                }
            }
            
            RunLoop.addObserver {
                Update.ensure { 
                    guard let self else { return }
                    self.updateGraph { graphHost in
                        graphHost.flushTransactions()
                    }
                }
            }
        }
    }
    
    package final func updateImmersiveSpaceAuthorityNotifications(oldScene: UIScene?, newScene: UIScene?) {
        /*
         oldScene = x21
         newScene = x19
         */
        let notificationCenter = NotificationCenter.default
        
        if oldScene != nil {
            notificationCenter.removeObserver(self, name: ImmersiveSpaceAuthority.didChangeCurrentImmersiveSpace, object: nil)
            notificationCenter.removeObserver(self, name: ImmersiveSpaceAuthority.didChangeImmersion, object: nil)
            notificationCenter.removeObserver(self, name: ._MRUISceneDidChangeImmersionState, object: nil)
        }
        
        if newScene != nil {
            notificationCenter.addObserver(self, selector: #selector(immersiveSpaceAuthorityDidChangeCurrentImmersiveSpace), name: ImmersiveSpaceAuthority.didChangeCurrentImmersiveSpace, object: nil)
            notificationCenter.addObserver(self, selector: #selector(immersiveSpaceAuthorityDidChangeImmersion), name: ImmersiveSpaceAuthority.didChangeImmersion, object: nil)
            notificationCenter.addObserver(self, selector: #selector(sceneDidChangeImmersionState), name: ._MRUISceneDidChangeImmersionState, object: nil)
        }
    }
    
    package var hostKeyboardHeight: CGFloat {
        if isLinkedOnOrAfter(.v7) {
            return base._keyboardSafeAreaHeight
        } else {
            return _legacyHostKeyboardHeight
        }
    }
    
    package final var _legacyHostKeyboardHeight: CGFloat {
        fatalError("TODO")
    }
}

extension _UIHostingView: @preconcurrency UIHostingViewProvider {
    final var environmentOverride: EnvironmentValues? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    final func renderForPreferences(updateDisplayList: Bool) {
        fatalError("TODO")
    }
    
    final var shouldCreateUIInteractions: Bool {
        return Self.createsUIInteractions
    }
    
    final var sceneActivationState: UIScene.ActivationState? {
        return base.sceneActivationState
    }
}

extension _UIHostingView: @preconcurrency UICoreViewControllerProvider {
    final var coreUIViewController: UIViewController? {
        return viewController
    }
}

extension _UIHostingView: @preconcurrency HostingViewProtocol {
    final func convertAnchor<T>(_ anchor: MySwiftUICore.Anchor<T>) -> T {
        fatalError("TODO")
    }
}

extension _UIHostingView: @preconcurrency UIHostingViewBaseDelegate {
    fileprivate final func baseShouldDisableUIKitAnimationsWhenRendering(_ base: _UIKitShims.UIHostingViewBase) -> Bool {
        return shouldDisableUIKitAnimation
    }
    
    fileprivate final func baseDidMoveToScene(_ base: _UIKitShims.UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?) {
        updateImmersiveSpaceAuthorityNotifications(oldScene: oldScene, newScene: newScene)
    }
    
    fileprivate final func baseSceneActivationStateDidChange(_ base: _UIKitShims.UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?) {
        guard let newState else {
            return
        }
        
        guard newState == .foregroundActive else {
            return
        }
        
        guard let rootViewDelegate else {
            return
        }
        
        Update.enqueueAction(reason: nil) {
            rootViewDelegate.updateAppFocus(view: self)
        }
    }
    
    fileprivate final func baseKeyboardSafeAreaDidChange(_ base: _UIKitShims.UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat) {
        fatalError("TODO")
    }
    
    fileprivate final func baseSceneBecameKey(_ base: _UIKitShims.UIHostingViewBase) {
        guard let rootViewDelegate else {
            return
        }
        
        Update.enqueueAction(reason: nil) { 
            rootViewDelegate.updateAppFocus(view: self)
        }
    }
    
    fileprivate final func baseSceneResignedKey(_ base: _UIKitShims.UIHostingViewBase) {
        fatalError("TODO")
    }
}

extension _UIHostingView: @preconcurrency FocusHost {
    var focustedItem: FocusItem? {
        return focusBridge.focusedItem
    }
    
    func focus(item: FocusItem) {
        fatalError("TODO")
    }
    
    func focusDidChange() {
        fatalError("TODO")
    }
}

extension _UIHostingView: FocusBridgeProvider {
    
}

extension _UIHostingView: PlatformItemListHost {
    
}

extension _UIHostingView: AccessibilityHost {
    
}

extension _UIHostingView: EventGraphHost {
    
}

extension _UIHostingView: PointerHost {
    
}

extension _UIHostingView: WindowLayoutHost {
    
}

extension _UIHostingView: CurrentEventProvider {
    
}

extension _UIHostingView: FallbackResponderProvider {
    
}

extension _UIHostingView: ContainerBackgroundHost {
    
}

extension _UIHostingView: RootTransformProvider {
    
}

extension _UIHostingView: RootTransformUpdater {
    
}

extension _UIHostingView: @preconcurrency ViewGraphRenderObserver {
    package func didRender() {
        if let viewController {
            viewController.didRender()
        }
    }
}

extension _UIHostingView: ToolbarInputFeatureDelegate {
    
}

extension _UIHostingView: SensoryFeedbackCacheHost {
    
}

extension _UIHostingView: @preconcurrency ViewGraphBridgePropertiesDelegate {
    final func resolveRequiredBridges(_: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) {
        fatalError("TODO")
    }
}

extension Spacing {
    @safe fileprivate static nonisolated(unsafe) var hasSetupDefaultValue = false
}

extension UITraitCollection {
    fileprivate func resolvedPreEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        /*
         self = x25
         base = x24
         */
        
        var environmentValues = base
        environmentValues[BridgedEnvironmentKeysKey.self] = []
        environmentValues[InheritedTraitCollectionKey.self] = self._traitCollectionByRemovingEnvironmentWrapper()
        
        if let placementTarget = mrui_placementTarget {
            switch placementTarget.anchoredPlane() {
            case .vertical:
                environmentValues._anchoredPlane = .vertical
                break
            case .horizontal:
                environmentValues._anchoredPlane = .horizontal
                break
            default:
                // <+940>
                break
            }
        }
        
        // <+940>
        if self._platterGroundingShadowVisibility() != .automatic {
            environmentValues.platterGroundingShadowVisibility = Visibility(rawValue: self._platterGroundingShadowVisibility().rawValue)!
        }
        
        // <+992>
        environmentValues.isInOrnament = self.mrui_ornamentStatus
        
        if self.userInterfaceIdiom == .vision {
            let material: MySwiftUICore.Material?
            switch _containerVibrancy() {
            case .ligherGlass:
                material = .lighterGlass
            case .darkerGlass:
                material = .darkerGlass
            case .ultraDarkerGlass:
                material = .ultraDarkerGlass
            default:
                material = nil
            }
            environmentValues.backgroundMaterial = material
            
            if (environmentValues.backgroundMaterial == nil) && environmentValues.isContainedInPlatter {
                environmentValues.backgroundMaterial = .vibrantGlassContent
            }
            
            environmentValues.isVisionEnabled = (self.userInterfaceIdiom == .vision)
        }
        
        environmentValues.accessibilitySettingsDefinition = PlatformSystemDefinition.uiKit
        return environmentValues
    }
    
    fileprivate func resolvedPostEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        var result = base
        
        guard self._vibrancy() == 1 else {
            return result
        }
        
        guard isLinkedOnOrAfter(.v5) else {
            return result
        }
        
        guard result.backgroundMaterial != nil else {
            return result
        }
        
        switch self._containerVibrancy() {
        case .ligherGlass:
            result.backgroundMaterial = .lighterGlass
        case .darkerGlass:
            result.backgroundMaterial = .darkerGlass
        case .ultraDarkerGlass:
            result.backgroundMaterial = .ultraDarkerGlass
        default:
            result.backgroundMaterial = nil
        }
        
        guard result.backgroundMaterial == nil else {
            return result
        }
        
        guard result.isContainedInPlatter else {
            return result
        }
        
        result.backgroundMaterial = .vibrantGlassContent
        return result
    }
}

fileprivate struct BridgedEnvironmentKeysKey: EnvironmentKey {
    static let defaultValue: [(any EnvironmentKey).Type] = []
}

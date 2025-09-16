#warning("TODO")

public import UIKit
@_spi(Internal) public import MySwiftUICore
private import _UIKitShims
private import _UIKitPrivate
private import notify
private import MRUIKit

fileprivate nonisolated(unsafe) var effectiveGeometryObservationContext: Int = 0

open class _UIHostingView<Content: View>: UIView {
    class var ignoresPresentations: Bool {
        return false
    }
    
    public var rootView: Content {
        _rootView
    }
    
    private var _rootView: Content
    private let _base: _UIKitShims.UIHostingViewBase
    private var isBaseConfigured: Bool = false
    internal let eventBindingManager = EventBindingManager()
    private var allowUIKitAnimations: Int32 = 0
    private var disabledBackgroundColor: Bool = false
    private var allowFrameChanges: Bool = true
    private var isInSizeTransition: Bool = false
    private var transparentBackgroundReasons: HostingViewTransparentBackgroundReason = []
    private var keyboardFrame: CGRect? = nil
    private var keyboardSeed: UInt32 = 0
    private var keyboardScreen: MyUIScreen? = nil
    private var keyboardAnimation: Animation? = nil
    private weak var viewController: UIHostingController<Content>? = nil
    private var currentEvent: UIEvent? = nil
    private var eventBridge: UIKitEventBindingBridge
    private var dumpLayerNotificationTokens: Int32? = nil
    private var colorAppearanceSeed: UInt32 = 0
    private var colorScheme: ColorScheme? = .light {
        didSet {
            fatalError("TODO")
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
    private var focusBridge = FocusBridge()
    private let dragBridge = DragAndDropBridge()
    internal final var inspectorBridge: UIKitInspectorBridgeV3? = nil
    private var tooltipBridge = TooltipBridge()
    private var editMenuBridge: EditMenuBridge = EditMenuBridge()
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
    private lazy var presentationModeLocation: LocationBox<UIKitPresentationModeLocation<Content>> = {
        fatalError("TODO")
    }()
    private lazy var scenePresentationModeLocation: LocationBox<UIKitScenePresentationModeLocation<Content>> = {
        fatalError("TODO")
    }()
    private var sceneSize: CGSize = .zero
    private var _boundsDepth: CGFloat = 0
    private var scrollTest: ScrollTest? = nil
    private weak var delegate: UIHostingViewDelegate? = nil
    private var rootViewDelegate: RootViewDelegate? = nil
    private var focusedValues: FocusedValues = FocusedValues()
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
        
        if let values = RepresentableContextValues.current {
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
        
        if let sheetBridge = sheetBridge {
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
            withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
                _ = notify_register_dispatch("NameLayerTree-\(pid)", outToken.baseAddress, .main, { [weak self] token in
                    self?.setLayerDebugName()
                })
            }
            withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
                _ = notify_register_dispatch("NameLayerTree", outToken.baseAddress, .main, { [pid, weak self] token in
                    let state64 = withUnsafeTemporaryAllocation(of: UInt64.self, capacity: 1) { outState64 in
                        notify_get_state(token, outState64.baseAddress)
                        return outState64.baseAddress.unsafelyUnwrapped.pointee
                    }
                    
                    if pid != -1 && state64 == pid {
                        self?.setLayerDebugName()
                    }
                })
            }
        }
        
        notificationCenter.addObserver(self, selector: #selector(accessibilityFocusedElementDidChange(_:)), name: UIAccessibility.elementFocusedNotification, object: nil)
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
        didSet {
            let oldValue = self.frame
            super.frame = frame
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
    }
    
    open override dynamic func layoutSubviews() {
        super.layoutSubviews()
//        fatalError("TODO")
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
            windowScene.addObserver(self, forKeyPath: #keyPath(UIWindowScene.effectiveGeometry), options: .new, context: &effectiveGeometryObservationContext)
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
}

protocol UIHostingViewDelegate: AnyObject {
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout EnvironmentValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didUpdate values: EnvironmentValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: PreferenceValues)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList)
    @MainActor func hostingView<Content: View>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout _ViewInputs)
}

extension _UIHostingView {
    struct EnableVFDFeature: ViewGraphFeature {}
}

extension _UIHostingView {
    fileprivate struct HostViewGraph<T: View>: ViewGraphFeature {
        private weak var host: _UIHostingView<T>?
        
        init(host: _UIHostingView<T>) {
            self.host = host
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
        fatalError("TODO")
    }
    
    package final func updateEnvironment() {
        fatalError("TODO")
    }
    
    package final func updateTransform() {
        fatalError("TODO")
    }
    
    package final func updateSize() {
        fatalError("TODO")
    }
    
    package final func updateSafeArea() {
        fatalError("TODO")
    }
    
    package final func updateContainerSize() {
        fatalError("TODO")
    }
    
    package final func updateFocusStore() {
        fatalError("TODO")
    }
    
    package final func updateFocusedItem() {
        fatalError("TODO")
    }
    
    package final func updateFocusedValues() {
        fatalError("TODO")
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
            return unsafeBitCast(self, to: T.self)
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
        ViewGraphHostUpdate.lock()
        defer {
            ViewGraphHostUpdate.unlock()
        }
        
        if (time == 0) && viewGraph.mayDeferUpdate {
            if Thread.isMainThread {
                MainActor.assumeIsolated {
                    setNeedsUpdate()
                }
            } else {
                DispatchQueue.main.async {
                    self.setNeedsUpdate()
                }
            }
            
            return
        }
        
        let actualTime = (time * Double(UIAnimationDragCoefficient()))
        guard actualTime < 0.25 else {
            startUpdateTimer(delay: actualTime)
            return
        }
        
        guard uiView != nil else {
            return
        }
        
        base.viewGraph.startDisplayLink(delay: actualTime) { _, _ in
            fatalError("TODO")
        }
    }
    
    package nonisolated final func startUpdateTimer(delay: Double) {
        fatalError("TODO")
    }
    
    package final func setNeedsUpdate() {
        base._setNeedsUpdate()
    }
    
    package final func updateGraph<T>(body: (MySwiftUICore.GraphHost) -> T) -> T {
        fatalError("TODO")
    }
    
    package final func graphDidChange() {
        fatalError("TODO")
    }
    
    package final func preferencesDidChange() {
        fatalError("TODO")
    }
    
    package final func beginTransaction() {
        fatalError("TODO")
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
        return true
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
        fatalError("TODO")
    }
    
    fileprivate final func baseDidMoveToScene(_ base: _UIKitShims.UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?) {
        updateImmersiveSpaceAuthorityNotifications(oldScene: oldScene, newScene: newScene)
    }
    
    fileprivate final func baseSceneActivationStateDidChange(_ base: _UIKitShims.UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?) {
        fatalError("TODO")
    }
    
    fileprivate final func baseKeyboardSafeAreaDidChange(_ base: _UIKitShims.UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat) {
        fatalError("TODO")
    }
    
    fileprivate final func baseSceneBecameKey(_ base: _UIKitShims.UIHostingViewBase) {
        fatalError("TODO")
    }
    
    fileprivate final func baseSceneResignedKey(_ base: _UIKitShims.UIHostingViewBase) {
        fatalError("TODO")
    }
}

extension _UIHostingView: FocusHost {
    
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

extension _UIHostingView: ViewGraphRenderObserver {
    
}

extension _UIHostingView: ToolbarInputFeatureDelegate {
    
}

extension _UIHostingView: SensoryFeedbackCacheHost {
    
}

extension Spacing {
    fileprivate static nonisolated(unsafe) var hasSetupDefaultValue = false
}

// SwiftUI에서 Geometry3DEffect를 conform하는 Type이 존재하지 않음
fileprivate struct Geometry3DEffectImpl: Geometry3DEffect {}

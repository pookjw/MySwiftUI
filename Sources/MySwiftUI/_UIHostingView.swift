// FAF0B683EB49BE9BABC9009857940A1E
public import UIKit
@_spi(Internal) public import MySwiftUICore
internal import _UIKitShims
public import _UIKitPrivate
private import notify
private import MRUIKit
private import RealityKit
private import TCC
private import ARKit
private import AttributeGraph
public import UIIntelligenceSupport
internal import UIAccessibility
private import os.log
private import Spatial

// TODO: 지워야함
fileprivate let mySwiftUI_disableUnimplementedAssertion: Bool = {
    return UserDefaults.standard.bool(forKey: "com.pookjw.MySwiftUI.disableUnimplementedAssertion")
}()


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
    
    open override class func _supportsInvalidatingFocusCache() -> Bool {
        return true
    }
    
    public var rootView: Content {
        get {
            return _rootView
        }
        set {
            _rootView = newValue
            invalidateProperties([.rootView], mayDeferUpdate: true)
        }
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
    private var explicitSafeAreaInsets: EdgeInsets?
    private var legacyKeyboardFrame: CGRect? = nil
    private var legacyKeyboardSeed: UInt32 = 0
    private var legacyKeyboardScreen: MyUIScreen? = nil
    private var legacyKeyboardAnimation: Animation? = nil
    weak var viewController: UIHostingController<Content>? = nil {
        didSet {
            updateBackgroundColor()
        }
    }
    private var currentEvent: UIEvent? = nil
    private var eventBridge: UIKitEventBindingBridge
    private nonisolated(unsafe) var dumpLayerNotificationTokens: (Int32, Int32)? = nil
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
    final var popoverBridge: UIKitPopoverBridge?
    final var inspectorBridge: UIKitInspectorBridgeV3? = nil
    private var tooltipBridge = TooltipBridge()
    private var editMenuBridge = EditMenuBridge()
    final var sharingActivityPickerBridge: SharingActivityPickerBridge? = nil
    final var shareConfigurationBridge: ShareConfigurationBridge? = nil
    private var statusBarBridge = UIKitStatusBarBridge()
    private(set) weak var sceneBridge: SceneBridge? = nil
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
    
    // updateRootTransform에서 getter 직접 호출하고 있기에 final
    private final var sceneSize: CGSize = .zero {
        didSet {
            immersiveSpaceAuthorityDidChangeCurrentImmersiveSpace()
        }
    }
    
    final var defaultNextResponder: UIResponder? {
        return super.next
    }
    
    private var _boundsDepth: CGFloat = 0
    private var scrollTest: ScrollTest? = nil
    private weak var delegate: UIHostingViewDelegate? = nil
    private var rootViewDelegate: RootViewDelegate? = nil
    final var focusedValues = FocusedValues()
    private var disallowAnimations: Bool = false
    private weak nonisolated(unsafe) var windowGeometryScene: UIWindowScene? = nil
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
    fileprivate final lazy var foreignSubviews = NSHashTable<UIView>.weakObjects()
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
    
    final var base: _UIKitShims.UIHostingViewBase {
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
    
    final var safeAreaRegions: SafeAreaRegions {
        return base.safeAreaRegions
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
        configuration.options.formUnion(.allowKeyboardSafeArea)
        
        if !Geometry3DEffectImpl._affectsLayout {
            configuration.options.formUnion(.allowUnregisteredGeometryChanges)
        }
        
        self._base = UIHostingViewBase(viewGraph: viewGraphHost, configuration: configuration)
        
        viewGraph.append(feature: FocusViewGraph(graph: viewGraph))
        viewGraph.append(feature: PlatformItemListViewGraph())
        
        if ViewGraphBridgePropertiesAreInput.isEnabled {
            viewGraph.append(feature: ViewGraphBridgePropertiesFeature())
        }
        
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
    
    deinit {
        MainActor.assumeIsolated {
            _base.tearDown(uiView: self, updateDelegate: self)
            NotificationCenter.default.removeObserver(self)
            
            if let windowGeometryScene = unsafe self.windowGeometryScene {
                windowGeometryScene.removeObserver(self, forKeyPath: "effectiveGeometry")
            }
            
            _base.clearDisplayLink()
            _base.clearUpdateTimer()
            
            HostingViewRegistry.shared.remove(self)
            
            if let dumpLayerNotificationTokens = unsafe dumpLayerNotificationTokens {
                notify_cancel(dumpLayerNotificationTokens.0)
                notify_cancel(dumpLayerNotificationTokens.1)
            }
        }
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
    
    open override var transform3D: CATransform3D {
        get {
            return super.transform3D
        }
        set {
            assert(mySwiftUI_disableUnimplementedAssertion)
            super.transform3D = newValue
        }
    }
    
    open override var transform: CGAffineTransform {
        get {
            return super.transform
        }
        set {
            let oldValue = transform
            super.transform = newValue
            base.transformDidChange(oldValue: oldValue)
        }
    }
    
    open override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            assert(mySwiftUI_disableUnimplementedAssertion)
            super.backgroundColor = newValue
        }
    }
    
    open override var _axesForDerivingIntrinsicContentSizeFromLayoutSize: UILayoutAxes {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._axesForDerivingIntrinsicContentSizeFromLayoutSize
    }
    
    open override var _layoutHeightDependsOnWidth: Bool {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._layoutHeightDependsOnWidth
    }
    
    open override var intrinsicContentSize: CGSize {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.intrinsicContentSize
    }
    
    open override var preferredFocusEnvironments: [any UIFocusEnvironment] {
       return _preferredFocusEnvironments
    }
    
    open override var _childContainers: [any _UIGestureRecognizerContainer] {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._childContainers
    }
    
    private var _preferredFocusEnvironments: [any UIFocusEnvironment] {
        // self = x21
        let focusBridge = focusBridge
        // x19 / sp + 0x8
        var requestedFocusEnvironments = focusBridge.requestedFocusEnvironments
        // x19
        let defaultFocusItemsContainer = defaultFocusItemsContainer()
        
        if let defaultFocusItemsContainer {
            // <+108>
            requestedFocusEnvironments.append(defaultFocusItemsContainer)
        } else {
            // <+168>
            requestedFocusEnvironments.append(contentsOf: focusBridge.preferredFocusEnvironments)
        }
        
        return requestedFocusEnvironments
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if unsafe context == &effectiveGeometryObservationContext {
            MainActor.assumeIsolated { [unchecked = UncheckedSendable((object, change))] in
                let object = unchecked.value.0
                let change = unchecked.value.1
                
                guard change != nil else {
                    return
                }
                
                guard keyPath == #keyPath(UIWindowScene.effectiveGeometry) else {
                    return
                }
                
                // <+148>
                guard let windowScene = object as? UIWindowScene else {
                    return
                }
                
                // x21
                let effectiveGeometry = windowScene.effectiveGeometry
                // x23
                let isInteractivelyResizing = effectiveGeometry.isInteractivelyResizing
                
                interactiveResizeBridge.handleLiveResize(isResizing: isInteractivelyResizing, host: self)
                let size = effectiveGeometry._size
                
                boundsDepth = size.depth
                sceneSize = CGSize(width: size.width, height: size.height)
            }
        } else {
            // <+500>
            unsafe super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    open override func _baselineOffsets(at size: CGSize) -> _UIBaselineOffsetPair {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._baselineOffsets(at: size)
    }
    
    open override func _didChange(toFirstResponder responder: UIResponder?) {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super._didChange(toFirstResponder: responder)
    }
    
    open override func _geometryChanged(_ context: UnsafeMutableRawPointer, forAncestor ancestor: UIView?) {
        unsafe base._geometryChanged(context, forAncestor: ancestor)
    }
    
    open override func _hitTest(with context: _UIHitTestContext) -> (any UIResponder & _UIGestureRecognizerContainer)? {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._hitTest(with: context)
    }
    
    open override var _intelligenceBaseClass: AnyClass {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._intelligenceBaseClass
    }
    
    open override func _intelligenceCollectContent(in rect: CGRect, collector: UIIntelligenceElementCollector) {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super._intelligenceCollectContent(in: rect, collector: collector)
    }
    
    open override func _intelligenceCollectRemoteContent(in rect: CGRect, remoteContextWrapper: UIIntelligenceCollectionRemoteContextWrapper) {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super._intelligenceCollectRemoteContent(in: rect, remoteContextWrapper: remoteContextWrapper)
    }
    
    open override func _safeAreaCornerInsetsDidChange() {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super._safeAreaCornerInsetsDidChange()
    }
    
    open override func _shouldAnimateProperty(withKey key: String?) -> Bool {
        /*
         self = x21
         key = x24/x23
         */
        if
            let key, key == #keyPath(UIView.bounds),
            let delegate = viewGraph.currentSceneResizeDelegate,
            delegate.shouldIgnoreBoundsAnimations
        {
            Log.resize?.debug("Not using a UIView animation for a bounds change because that could interrupt a SwiftUI resize animation.")
            return false
        } else {
            return super._shouldAnimateProperty(withKey: key)
        }
    }
    
    open override class func accessibilityElementCount() -> Int {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.accessibilityElementCount()
    }
    
    open override var accessibilityElements: [Any]? {
        get {
            assert(mySwiftUI_disableUnimplementedAssertion)
            return super.automationElements
        }
        set {
            assert(mySwiftUI_disableUnimplementedAssertion)
            super.automationElements = newValue
        }
    }
    
    open override var automationElements: [Any]? {
        get {
            assert(mySwiftUI_disableUnimplementedAssertion)
            return super.automationElements
        }
        set {
            assert(mySwiftUI_disableUnimplementedAssertion)
            super.automationElements = newValue
        }
    }
    
    open override var canBecomeFirstResponder: Bool {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.canBecomeFirstResponder
    }
    
    open override var clipsToBounds: Bool {
        get {
            return super.clipsToBounds
        }
        set {
            assert(mySwiftUI_disableUnimplementedAssertion)
            super.clipsToBounds = newValue
        }
    }

    open override func didAddSubview(_ subview: UIView) {
        // subview = x19
        super.didAddSubview(subview)
        
        guard insertingManagedSubviews == 0 else {
            return
        }
        
        foreignSubviews.add(subview)
        
        guard isLinkedOnOrAfter(.v7) else {
            return
        }
        
        let path: String
        if isAppleInternalBuild() {
            if viewController == nil {
                path = "_UIHostingView"
            }  else {
                path = "UIHostingController.view"
            }
        } else {
            path = "UIHostingController.view"
        }
        
        unsafe os_log(.fault, log: .runtimeIssuesLog, "Adding '%s' as a subview of %s is not supported and may result in a broken view hierarchy. Add your view above %s in a common superview or insert it into your SwiftUI content in a UIViewRepresentable instead.", _typeName(type(of: subview), qualified: false), path, path)
    }

    open override func didUpdateFocus(
        in context: UIFocusUpdateContext,
        with coordinator: UIFocusAnimationCoordinator
    ) {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super.didUpdateFocus(in: context, with: coordinator)
    }

    open override func focusItems(in rect: CGRect) -> [any UIFocusItem] {
        /*
         d11/d10/d9/d8 = rect
         self = sp + 0x20
         */
        let superItems = super.focusItems(in: rect)
        // sp + 0x18
        var items: [any UIFocusItem] = []
        for item in superItems {
            if let view = item as? UIView {
                items.append(view)
            }
        }
        
        // <+456>
        let shouldIgnoreChildFocusRegions = (viewController?._shouldIgnoreChildFocusRegions()) ?? false
        if !shouldIgnoreChildFocusRegions {
            let childItems = childFocusItems(in: rect)
            items.append(contentsOf: childItems)
        }
        
        return items
    }

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /*
         point -> d9, d8
         event -> x21
         */
        var result: UIView? {
            // x21
            return super.hitTest(point, with: event)
        }
        
        printHitTestIfNeeded(at: point, with: event)
        
        guard GestureContainerFeature.isEnabled else {
            // <+464>
            return result
        }
        
        // <+92>
        guard (_UICurrentHitTestContext() != nil) && CoreTesting.isRunning else {
            // <+464>
            return result
        }
        
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.hitTest(point, with: event)
    }

    open override var next: UIResponder? {
        if let keyPressResponder = eventBridge.keyPressResponder {
            return keyPressResponder
        } else {
            return defaultNextResponder
        }
    }

    open override var safeAreaInsets: UIEdgeInsets {
        guard explicitSafeAreaInsets != nil else {
            return super.safeAreaInsets
        }
        
        fatalError("TODO")
    }

    open override func safeAreaInsetsDidChange() {
        let safeAreaRegions = safeAreaRegions
        guard !safeAreaRegions.isEmpty || !isLinkedOnOrAfter(.v7) else {
            return
        }
        
        if let viewController {
            viewController._viewSafeAreaDidChange()
        }
        
        base.safeAreaInsetsDidChange()
    }

    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.sizeThatFits(size)
    }

    open override func tintColorDidChange() {
        assert(mySwiftUI_disableUnimplementedAssertion)
        super.tintColorDidChange()
    }

    open override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        foreignSubviews.remove(subview)
    }

    open override func _accessibilityAutomationHitTestReverseOrder() -> Bool {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._accessibilityAutomationHitTestReverseOrder()
    }

    open override func _accessibilityIsSwiftUIHostingView() -> Bool {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super._accessibilityIsSwiftUIHostingView()
    }

    open override func accessibilityShouldEnumerateContainerElementsArrayDirectly() -> Bool {
        assert(mySwiftUI_disableUnimplementedAssertion)
        return super.accessibilityShouldEnumerateContainerElementsArrayDirectly()
    }

    @objc open override var _accessibilitySwiftUIDebugData: [[String : Any]] {
        fatalError("TODO")
    }

    @objc open override func _accessibilityIsSwiftUIHostingCellView() -> Bool {
        fatalError("TODO")
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
            sceneSize = CGSize(width: size.width, height: size.height)
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
    
    final func viewControllerDidAppear(transitionCoordinator: UIViewControllerTransitionCoordinator?, animated: Bool) {
        focusBridge.hostingControllerDidAppear()
    }
    
    private func updateWindowGeometryScene() {
        let windowScene = window?.windowScene
        
        guard unsafe windowScene != windowGeometryScene else {
            return
        }
        
        unsafe windowGeometryScene?.removeObserver(self, forKeyPath: #keyPath(UIWindowScene.effectiveGeometry))
        
        if let windowScene {
            unsafe windowScene.addObserver(self, forKeyPath: #keyPath(UIWindowScene.effectiveGeometry), options: .new, context: &effectiveGeometryObservationContext)
        }
        unsafe windowGeometryScene = windowScene
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
    
    public override func myswiftui_addManagedInteraction(_ interaction: any UIInteraction) {
        fatalError("TODO")
    }
    
    public override func myswiftui_insertManagedSubview(_ subview: UIView, at index: Int) {
        insertingManagedSubviews += 1
        insertSubview(subview, at: index)
        insertingManagedSubviews -= 1
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
        var authorization = tcc_authorization_preflight(kTCCServiceWorldSensing as CFString, nil)
        
        if
            let wantsDetailedSurfaceInfo = Bundle.main.infoDictionary?["UIWantsDetailedSurfaceInfo"] as? Bool,
            wantsDetailedSurfaceInfo,
            authorization == 1,
            windowScene.isSnappedToSurface
        {
            tcc_authorization_request(kTCCServiceWorldSensing as CFString, nil) { result in
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
    
    fileprivate final func printHitTestIfNeeded(at point: CGPoint, with event: UIEvent?) {
        /*
         point -> d9/d8
         event -> x23
         self -> x22
         */
        guard _eventDebugTriggers.isSuperset(of: .hitTest) else {
            return
        }
        
        fatalError("TODO")
    }
    
    final func updateBackgroundColor() {
        func setBackground(_ backgroundColor: UIColor?, canOverwriteClientValue: Bool) {
            guard !disabledBackgroundColor || canOverwriteClientValue else {
                return
            }
            
            super.backgroundColor = backgroundColor
        } 
        
        if appliesContainerBackgroundColor, let containerBackgroundColor {
            setBackground(containerBackgroundColor, canOverwriteClientValue: true)
        } else {
            // <+60>
            guard let viewController else {
                return
            }
            
            if wantsTransparentBackground {
                setBackground(nil, canOverwriteClientValue: true)
            } else {
                if traitCollection.userInterfaceIdiom == .vision {
                    setBackground(nil, canOverwriteClientValue: true)
                } else {
                    setBackground(.systemBackground, canOverwriteClientValue: false)
                }
            }
        }
    }
    
    final var wantsTransparentBackground: Bool {
        return !transparentBackgroundReasons.isEmpty
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
                viewController.resolveRequiredBridges(resolved.viewGraphBridgeProperties, allowedActions: [.unknown0, .unknown1])
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
            !ViewGraphBridgePropertiesAreInput.isEnabled,
            let viewController
        {
            viewController.updateViewGraphBridges(&viewGraphBridgeProperties)
        }
        
        // <+3140>
        resolved.activeContextMenu = contextMenuBridge.presentedMenu
        deprecatedAlertBridge.update(environment: resolved)
        deprecatedActionSheetBridge.update(environment: resolved)
        
        if let sheetBridge {
            sheetBridge._update(environment: resolved)
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
            viewController.dialogBridge.transformDidChange()
        }
        
        // <+392>
        if let sharingActivityPickerBridge {
            sharingActivityPickerBridge.transformDidChange()
        }
        
        // <+424>
        if legacyKeyboardFrame != nil {
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
        } else if let result = _specialize(self as (any RootTransformAdjuster), for: T.self) {
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
        } else if let result = _specialize(self as (any ViewGraphBridgePropertiesDelegate), for: T.self) {
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
            // inlined
            shareConfigurationBridge.preferencesDidChange(preferenceValues)
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
            return base.environmentOverride
        }
        set {
            base.environmentOverride = newValue
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
    final func baseShouldDisableUIKitAnimationsWhenRendering(_ base: _UIKitShims.UIHostingViewBase) -> Bool {
        return shouldDisableUIKitAnimation
    }
    
    final func baseDidMoveToScene(_ base: _UIKitShims.UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?) {
        updateImmersiveSpaceAuthorityNotifications(oldScene: oldScene, newScene: newScene)
    }
    
    final func baseSceneActivationStateDidChange(_ base: _UIKitShims.UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?) {
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
    
    final func baseKeyboardSafeAreaDidChange(_ base: _UIKitShims.UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat) {
        fatalError("TODO")
    }
    
    final func baseSceneBecameKey(_ base: _UIKitShims.UIHostingViewBase) {
        guard let rootViewDelegate else {
            return
        }
        
        Update.enqueueAction(reason: nil) { 
            rootViewDelegate.updateAppFocus(view: self)
        }
    }
    
    final func baseSceneResignedKey(_ base: _UIKitShims.UIHostingViewBase) {
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

extension _UIHostingView: UIKitContainerFocusItem {
    var host: UIView? {
        return self
    }
}

extension _UIHostingView: RootTransformAdjuster {
    package func updateRootTransform(_ transform: inout ViewTransform) {
        if !base.registeredForGeometryChanges {
            base.registeredForGeometryChanges = true
            _registerForGeometryChanges()
        }
        
        // <+332>
        transform.appendWorldAndImmersiveSpaceCoordinates(for: window)
        transform.appendCoordinateSpace(id: CoordinateSpace.globalID)
        
        let sceneSize = sceneSize
        let size = Size3D(width: sceneSize.width, height: sceneSize.height, depth: boundsDepth)
        transform.appendSizedSpace3D(name: AnyHashable(SceneSize3DCoordinateSpace()), size3D: size)
        
        transform.appendSizedSpace(name: WindowCoordinateSpace(), size: self.sceneSize)
        transform.depth = .fixed(self.boundsDepth)
        
        // x20
        let layer = self.layer
        // x28
        let windowLayer = self.window?.layer
        
        // <+676>
        layer.mapGeometry3D(to: windowLayer, &transform)
        
        var buffer = ViewTransform.UnsafeBuffer()
        let isEnabled = _SemanticFeature<Semantics_v6>.isEnabled
        let bounds = self.bounds
        
        if isEnabled {
            // <+792>
            if let window = self.window {
                // <+844>
                let frameInWindow = self.convert(bounds, to: window)
                let geometry = ScrollGeometry.rootViewTransform(contentOffset: bounds.origin, containerSize: frameInWindow.size)
                buffer.appendScrollGeometry(geometry, isClipped: true)
            }
            
            // <+936>
            let clipsToBounds = self.clipsToBounds
            let geometry = ScrollGeometry.rootViewTransform(contentOffset: bounds.origin, containerSize: bounds.size)
            buffer.appendScrollGeometry(geometry, isClipped: clipsToBounds)
        } else {
            // <+1020>
            _ = self.clipsToBounds
        }
        
        // <+1036>
        buffer.appendCoordinateSpace(id: hostingViewCoordinateSpace, transform: &transform)
        buffer.appendCoordinateSpace(id: .viewGraphHostContainerCoordinateSpace, transform: &transform)
        transform.append(movingContentsOf: &buffer)
    }
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
    func updateRequiredBridges(_ properties: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) -> ViewGraphBridgeProperties {
        /*
         self -> x20 -> x19
         properties -> x0/x1/x2/x3 -> x21/x28/x23/x22
         allowedActions -> sp + 0x8
         */
        // x25/x24/x20/x26
        let properties_2 = properties ?? .defaultValue
        // <+168>
        // sp + 0x10
        var copy_1 = properties_2
        
        if let delegate {
            delegate.hostingView(self, willUpdate: &copy_1)
        }
        
        if let viewController {
            viewController.resolveRequiredBridges(copy_1, allowedActions: allowedActions)
        }
        
        // <+328>
        if let viewController {
            viewController.updateViewGraphBridges(&copy_1)
        }
        
        // <+356>
        if let sheetBridge {
            sheetBridge.update(bridgeProperties: &copy_1)
        }
        
        return copy_1
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
    @safe static nonisolated(unsafe) let defaultValue: [(any EnvironmentKey).Type] = []
}

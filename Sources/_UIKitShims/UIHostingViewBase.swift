package import UIKit
@_spi(Internal) package import MySwiftUICore
private import _UIKitPrivate
#if SwiftUICompataibility
private import SwiftUI
private import _SwiftUIPrivate
#endif
private import DesignLibrary
private import _DesignLibraryShims

package final class UIHostingViewBase: NSObject {    
    package weak var uiView: UIView? = nil
    package weak var delegate: UIHostingViewBaseDelegate? = nil
    package private(set) var safeAreaRegions: MySwiftUICore.SafeAreaRegions = .all
    private let configuration: UIHostingViewBase.Configuration
    package let viewGraph: MySwiftUICore.ViewGraphHost
    private var inheritedEnvironment: MySwiftUICore.EnvironmentValues? = nil
    package var environmentOverride: MySwiftUICore.EnvironmentValues? = nil {
        didSet {
            if let updateDelegate {
                updateDelegate.invalidateProperties([.environment], mayDeferUpdate: true)
            }
        }
    }
    package var traitCollectionOverride: UITraitCollection?
    private var cachedContainerShape: MySwiftUICore.UnevenRoundedRectangle?
    private var canAdvanceTimeAutomatically: Bool = true
    package private(set) var allowUIKitAnimationsForNextUpdate: Bool = false
    private var lastRenderTime: MySwiftUICore.Time = .zero
    private var pendingPreferencesUpdate: Bool = false
    private var pendingPostDisappearPreferencesUpdate: Bool = false
    private var _updateFidelity: _UpdateFidelity = .milliseconds
    private var isHiddenForReuse: Bool = false
    private var isEnteringForeground: Bool = false
    private var isExitingForeground: Bool = false
    private var isCapturingSnapshots: Bool = false
    package private(set) var isRotatingWindow: Bool = false
    private var isResizingWindow: Bool = false
    private var _sceneActivationState: UIScene.ActivationState? = nil
    package var registeredForGeometryChanges: Bool = false
    private weak var observedWindow: UIWindow? = nil
    private weak var observedScene: UIWindowScene? = nil
    private var keyboardFrame: CGRect? = nil
    private var inactiveKeyboardFrame: CGRect? = nil
    private var keyboardSeed: UInt32 = 0
    @MainActor private lazy var trackingElement: UICoreHostingKeyboardTrackingElement = {
        let element = UICoreHostingKeyboardTrackingElement()
        element.base = self
        return element
    }()
    private var isUpdatingKeyboard: Bool = false
    
    package var updateDelegate: ViewGraphRootValueUpdater? {
        get {
            return viewGraph.updateDelegate
        }
        set {
            viewGraph.updateDelegate = newValue
        }
    }
    
    @MainActor
    package var sceneActivationState: UIScene.ActivationState? {
        get {
            guard let uiView else {
                return .foregroundInactive
            }
            
            guard uiView.window?._windowHostingScene() != nil else {
                return .foregroundActive
            }
            
            return _sceneActivationState
        }
        set {
            _sceneActivationState = newValue
        }
    }
    
    @MainActor
    package var updatesWillBeVisible: Bool {
        guard uiView?.window?._windowHostingScene() != nil else {
            return false
        }
        
        guard let sceneActivationState = _sceneActivationState else {
            return false
        }
        
        guard !isHiddenForReuse else {
            return false
        }
        
        switch sceneActivationState {
        case .unattached, .foregroundActive:
            return true
        default:
            return isEnteringForeground || isCapturingSnapshots
        }
    }
    
    package var accessibilityEnabled: Bool {
        get {
            return viewGraph.accessibilityEnabled
        }
        set {
            let oldValue = viewGraph.accessibilityEnabled
            viewGraph.accessibilityEnabled = newValue
            
            if
                oldValue != newValue,
                let updateDelegate
            {
                updateDelegate.invalidateProperties(.environment, mayDeferUpdate: true)
            }
        }
    }
    
    @MainActor package var _containerSafeArea: MySwiftUICore.EdgeInsets {
        // x29 = sp + 0x110
        // x22
        guard let uiView else {
            return .zero
        }
        
        // d8
        let pixelLength = viewGraph.environment.pixelLength
        let safeAreaInsets = uiView.safeAreaInsets
        // sp + 0x58
        var insets = MySwiftUICore.EdgeInsets(
            top: safeAreaInsets.top,
            leading: safeAreaInsets.left,
            bottom: safeAreaInsets.bottom,
            trailing: safeAreaInsets.right
        )
        insets.xFlipIfRightToLeft { .leftToRight }
        insets.round(toMultipleOf: pixelLength)
        
        return insets
    }
    
    package init(viewGraph: MySwiftUICore.ViewGraphHost, options: UIHostingViewBase.Options) {
        fatalError("TODO")
    }
    
    package init(viewGraph: MySwiftUICore.ViewGraphHost, configuration: UIHostingViewBase.Configuration) {
        ___lldb_unnamed_symbol319514(configuration: configuration)
        self.viewGraph = viewGraph
        self.configuration = configuration
        super.init()
    }
    
    package func _as<T>(_ type: T.Type) -> T? {
        if let result = viewGraph.as(type) {
            return result
        } else if let result = _specialize(self as (any ViewGraphRenderDelegate), for: T.self) {
            return result
        } else if let result = _specialize(self as (any RootContainerShapeProvider), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    package func setUp() {
        let viewGraphHost = viewGraph
        viewGraphHost.renderDelegate = self
        viewGraphHost.delegate = self
        viewGraphHost.setUp()
        
        addNotificationObservers()
    }
    
    @MainActor
    package func frameDidChange(oldValue: CGRect) {
        guard
            let uiView,
            let updateDelegate
        else {
            return
        }
        
        guard uiView.bounds != oldValue else {
            return
        }
        
        _ = UICoreHostingViewForUIKitTester()
        updateDelegate.invalidateProperties([.size, .containerSize, .safeArea], mayDeferUpdate: false)
    }
    
    @MainActor
    package func didMoveToWindow() {
        guard let uiView else {
            return
        }
        
        // x22
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        // x20
        let observedWindow = observedWindow
        
        if
            isLinkedOnOrAfter(.v2),
            self.uiView != nil, // x25
            let observedWindow
        {
            _ = uiView.window
            if let keyboardSceneDelegate = self.uiView?.keyboardSceneDelegate {
                UICoreKeyboardTrackingClass().remove(trackingElement, window: observedWindow, keyboardDelegate: keyboardSceneDelegate)
            }
        }
        
        let newWindow = uiView.window
        if newWindow != nil {
            let traitCollectionOverride = traitCollectionOverride
            self.traitCollectionOverride = nil
            
            if
                traitCollectionOverride != nil,
                let updateDelegate = viewGraph.updateDelegate
            {
                updateDelegate.invalidateProperties([.environment], mayDeferUpdate: true)
            }
            
            viewGraph.initialInheritedEnvironment = nil
            updateDelegate.invalidateProperties([.transform], mayDeferUpdate: true)
        }
        
        if isChaaranaApp {
            if newWindow == nil {
                if !pendingPostDisappearPreferencesUpdate && isLinkedOnOrAfter(.v6) {
                    UIHostingViewBase.UpdateCycle.addPreCommitObserver { [weak self] in
                        fatalError("TODO")
                    }
                }
            }
        } else {
            if !pendingPostDisappearPreferencesUpdate && isLinkedOnOrAfter(.v6) {
                UIHostingViewBase.UpdateCycle.addPreCommitObserver { [weak self] in
                    // ___lldb_unnamed_symbol317393
                    guard let self else {
                        return
                    }
                    
                    let viewGraph = self.viewGraph
                    guard let updateDelegate = viewGraph.updateDelegate else {
                        return
                    }
                    
                    guard self.canAdvanceTimeAutomatically else {
                        return
                    }
                    
                    let interval = self.interval(time: CACurrentMediaTime()) / Double(UIAnimationDragCoefficient())
                    updateDelegate.render(interval: interval, updateDisplayList: false, targetTimestamp: nil)
                    self.pendingPostDisappearPreferencesUpdate = false
                }
            }
        }
        
        if newWindow == nil {
            if let application = UIApp {
                application._performBlockAfterCATransactionCommits { [weak self] in
                    guard let self else { return }
                    self.updateRemovedState(uiView: nil)
                }
            }
        } else {
            updateRemovedState(uiView: nil)
        }
        
        if isHiddenForReuse {
            clearDisplayLink()
        }
        
        updateRemovedState(uiView: nil)
        windowSceneDidChange()
        windowDidChange()
        requestUpdateForFidelity()
        
        if newWindow == nil {
            isRotatingWindow = false
        }
        
        updateDelegate.invalidateProperties([.environment], mayDeferUpdate: true)
    }
    
    package func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /*
         self = x19
         previousTraitCollection = x26
         */
        // x22
        let viewGraph = viewGraph
        
        // x21
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        // x23
        guard self.uiView != nil else {
            return
        }
        
        updateDelegate.invalidateProperties(.environment, mayDeferUpdate: true)
        
        if #unavailable(iOS 26.4, visionOS 26.4) {
//            guard _UIViewMaskingConfigurationSPIEnabled() else {
//                return
//            }
            
            fatalError("TODO")
        }
    }
    
    // ___lldb_unnamed_symbol317399
    package func interval(time: Double) -> Double {
        // time = x19
        // x23
        var lastRenderTime = lastRenderTime
        let zeroTime = MySwiftUICore.Time.zero
        
        if lastRenderTime <= zeroTime {
            // <+320>
            lastRenderTime = Time(seconds: time - 1.0e-06)
            self.lastRenderTime = lastRenderTime
        }
        
        // <+396>
        let result = time - lastRenderTime.seconds
        self.lastRenderTime = Time(seconds: time)
        return result
    }
    
    package nonisolated func _requestUpdate(after time: Double) {
        ViewGraphHostUpdate.lock()
        defer {
            ViewGraphHostUpdate.unlock()
        }
        
        let viewGraph = viewGraph
        
        if (time == 0) && !viewGraph.mayDeferUpdate {
            if Thread.isMainThread {
                MainActor.assumeIsolated {
                    self._setNeedsUpdate()
                }
            } else {
                DispatchQueue.main.async {
                    self._setNeedsUpdate()
                }
            }
            
            return
        }
        
        let actualTime = (time * Double(UIAnimationDragCoefficient()))
        guard actualTime < 0.25 else {
            viewGraph.startUpdateTimer(delay: actualTime)
            return
        }
        
        guard uiView != nil else {
            return
        }
        
        viewGraph.startDisplayLink(delay: actualTime) { _, _ in
            // ___lldb_unnamed_symbol317443
            fatalError("TODO")
        }
    }
    
    @MainActor
    package final func updateRemovedState(uiView: UIView?) {
        guard let uiView = uiView ?? self.uiView else {
            return
        } 
        
        let window = uiView.window
        let isHiddenForReuse = isHiddenForReuse
        if isHiddenForReuse {
            clearDisplayLink()
        }
        viewGraph.updateRemovedState(isUnattached: window == nil, isHiddenForReuse: isHiddenForReuse)
    }
    
    @MainActor package func _updateSafeArea(container: @MainActor () -> MySwiftUICore.EdgeInsets, keyboardHeight: @MainActor () -> CGFloat) {
        /*
         self = x21
         container = x25/x20
         keyboardHeight = x22/x23
         */
        // x29 = sp + 0x180
        // x19
        guard let uiView else {
            return
        }
        
        let insets: MySwiftUICore.EdgeInsets?
        let cornerInsets: MySwiftUICore.RectangleCornerInsets?
        if safeAreaRegions.contains(.container) {
            // <+192>
            let _insets = container()
            insets = _insets
            cornerInsets = self.cornerInsets
        } else {
            // <+160>
            insets = nil
            cornerInsets = nil
        }
        
        let height: CGFloat?
        if safeAreaRegions.contains(.keyboard) {
            // <+316>
            height = keyboardHeight()
        } else {
            // <+304>
            height = nil
        }
        
        let needsInvalidation = viewGraph.setSafeAreaInsets(insets, keyboardHeight: height, cornerInsets: cornerInsets)
        if needsInvalidation {
            uiView.invalidateIntrinsicContentSize()
        }
    }
    
    package func safeAreaInsetsDidChange() {
        // self = x21
        // x20
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        guard !safeAreaRegions.isEmpty || isLinkedOnOrAfter(.v7) else {
            return
        }
        
        // <+104>
        _ = UICoreHostingViewForUIKitTester()
        // w24
        let safeArea = ViewGraphRootValues.safeArea
        // *(tester + 0x20) = safeArea
        // w22
        let containerSize = ViewGraphRootValues.containerSize
        // *(tester + 0x22) = containerSize
        
        // UICoreHostingViewForUIKitTester에 값을 할당하지만 ivar 정보가 없기도 하고, Internal Build가 아니라서 아무것도 안하기에 구현 안함
        
        // <+172>
        // w21
        let values = safeArea.union(containerSize)
        updateDelegate.invalidateProperties(values, mayDeferUpdate: false)
    }
    
    package func _geometryChanged(_ context: UnsafeMutableRawPointer, forAncestor ancestor: UIView?) {
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        guard registeredForGeometryChanges else {
            return
        }
        
        var values = ViewGraphRootValues.transform
        if isLinkedOnOrAfter(.v7) {
            values.formUnion(.safeArea)
        }
        
        updateDelegate.invalidateProperties(values, mayDeferUpdate: false)
    }
    
    @MainActor package func transformDidChange(oldValue: CGAffineTransform) {
        guard let uiView else {
            return
        }
        
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        let newValue = uiView.transform
        
        guard oldValue != newValue else {
            return
        }
        
        updateDelegate.invalidateProperties(.transform, mayDeferUpdate: false)
    }
    
    // ___lldb_unnamed_symbol322028
    @MainActor private var cornerInsets: MySwiftUICore.RectangleCornerInsets {
        // x29 = sp + 0x170
        // x23
        guard let uiView else {
            return MySwiftUICore.RectangleCornerInsets()
        }
        
        // sp + 0x38
        let pixelLength = viewGraph.environment.pixelLength
        // d11, d12, d9, d10, d8, d15, d14, d13
        let insets = uiView._safeAreaCornerInsets
        
        var cornerInsets = MySwiftUICore.RectangleCornerInsets(
            topLeading: insets.topLeft,
            topTrailing: insets.topRight,
            bottomLeading: insets.bottomLeft,
            bottomTrailing: insets.bottomRight
        )
        let absolute = MySwiftUICore.AbsoluteRectangleCornerInsets(cornerInsets, layoutDirection: .leftToRight)
        cornerInsets = MySwiftUICore.RectangleCornerInsets(
            topLeading: absolute.topLeading,
            topTrailing: absolute.topTrailing,
            bottomLeading: absolute.bottomLeading,
            bottomTrailing: absolute.bottomTrailing
        )
        
        cornerInsets.topLeading.round(toMultipleOf: pixelLength)
        cornerInsets.topTrailing.round(toMultipleOf: pixelLength)
        cornerInsets.bottomLeading.round(toMultipleOf: pixelLength)
        cornerInsets.bottomTrailing.round(toMultipleOf: pixelLength)
        
        return cornerInsets
    }
    
    @MainActor package func tearDown(uiView: UIView, updateDelegate: any ViewGraphRootValueUpdater) {
        NotificationCenter.default.removeObserver(self)
        let window = uiView.window
        let isHiddenForReuse = isHiddenForReuse
        if isHiddenForReuse {
            viewGraph.clearDisplayLink()
        }
        
        viewGraph.updateRemovedState(isUnattached: (window == nil), isHiddenForReuse: isHiddenForReuse)
        viewGraph.tearDown(delegate: updateDelegate)
    }
    
    // ___lldb_unnamed_symbol317396
    @MainActor
    private func windowSceneDidChange() {
        guard let uiView else {
            return
        }
        
        let newScene = uiView.window?.windowScene // x22
        let oldScene = observedScene
        
        let flag: Bool
        if newScene == nil {
            flag = (oldScene != nil)
        } else {
            if oldScene == nil {
                flag = true
            } else {
                flag = (newScene != oldScene)
            }
        }
        
        guard flag else { return }
        
        let notificationCenter = NotificationCenter.default
        
        if let oldScene = observedScene {
            notificationCenter.removeObserver(self, name: UIScene.willDeactivateNotification, object: oldScene)
            notificationCenter.removeObserver(self, name: UIScene.didActivateNotification, object: oldScene)
            notificationCenter.removeObserver(self, name: UIScene.didEnterBackgroundNotification, object: oldScene)
            notificationCenter.removeObserver(self, name: UIScene.willEnterForegroundNotification, object: oldScene)
            notificationCenter.removeObserver(self, name: ._UIWindowSceneDidUpdateSystemUserInterfaceStyle, object: oldScene)
            notificationCenter.removeObserver(self, name: ._UIWindowSceneDidBeginLiveResize, object: oldScene)
            notificationCenter.removeObserver(self, name: ._UIWindowSceneDidEndLiveResize, object: oldScene)
            notificationCenter.removeObserver(self, name: ._UISceneDidBecomeKey, object: oldScene)
            notificationCenter.removeObserver(self, name: ._UISceneDidResignKey, object: oldScene)
            notificationCenter.removeObserver(self, name: .sceneDidUpdateSystemSceneDisplacementNotification, object: nil)
            notificationCenter.removeObserver(self, name: .sceneDidChangeRelativeTransformNotification, object: nil)
            notificationCenter.removeObserver(self, name: .windowSceneWorldTrackingCapabilitiesDidChange, object: nil)
        }
        
        if let newScene {
            notificationCenter.addObserver(self, selector: #selector(sceneWillDeactivate), name: UIScene.willDeactivateNotification, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidActivate), name: UIScene.didActivateNotification, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidEnterBackground), name: UIScene.didEnterBackgroundNotification, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneWillEnterForeground), name: ._UIWindowSceneDidUpdateSystemUserInterfaceStyle, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidBeginResize), name: ._UIWindowSceneDidBeginLiveResize, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidEndResize), name: ._UIWindowSceneDidEndLiveResize, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidBecomeKey), name: ._UISceneDidBecomeKey, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidResignKey), name: ._UISceneDidResignKey, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(sceneDidUpdateSystemSceneDisplacement), name: .sceneDidUpdateSystemSceneDisplacementNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(sceneDidChangeRelativeTransform(_:)), name: .sceneDidChangeRelativeTransformNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(sceneDidChangeWorldTrackingLimitations(_:)), name: .windowSceneWorldTrackingCapabilitiesDidChange, object: nil)
            notificationCenter.addObserver(self, selector: #selector(snappingUpdate(_:)), name: .windowSceneDidBeginSnapToSurfaceNotification, object: newScene)
            notificationCenter.addObserver(self, selector: #selector(snappingUpdate(_:)), name: .windowSceneDidChangeSnappingSurfaceClassificationNotification, object: newScene)
        }
        
        if let delegate {
            delegate.baseDidMoveToScene(self, oldScene: observedScene, newScene: newScene)
        }
        
        observedScene = newScene
        updateSceneActivationState()
    }
    
    // ___lldb_unnamed_symbol317386
    @MainActor
    private func updateSceneActivationState() {
        // x22
        let activationState: UIScene.ActivationState
        if let observedScene {
            activationState = observedScene.activationState
        } else {
            activationState = .foregroundActive
        }
        
        if let delegate {
            delegate.baseSceneActivationStateDidChange(self, oldState: sceneActivationState, newState: activationState)
        }
        
        sceneActivationState = activationState
    }
    
    // ___lldb_unnamed_symbol317397
    @MainActor
    private func windowDidChange() {
        guard let uiView else {
            return
        }
        
        let newWindow = uiView.window // x19
        let oldWindow = observedWindow
        
        let flag: Bool
        if newWindow == nil {
            flag = (oldWindow != nil)
        } else {
            if oldWindow == nil {
                flag = true
            } else {
                flag = (newWindow != oldWindow)
            }
        }
        
        guard flag else {
            return
        }
        
        let notificationCenter = NotificationCenter.default
        
        if let oldWindow {
            notificationCenter.removeObserver(self, name: .UIWindowWillRotate, object: oldWindow)
            notificationCenter.removeObserver(self, name: .UIWindowDidRotate, object: oldWindow)
            notificationCenter.removeObserver(self, name: .windowDidMoveToSceneNotification, object: oldWindow)
        }
        
        if let newWindow {
            notificationCenter.addObserver(self, selector: #selector(windowWillRotateWithNotification(_:)), name: .UIWindowWillRotate, object: newWindow)
            notificationCenter.addObserver(self, selector: #selector(windowWillRotateWithNotification(_:)), name: .UIWindowDidRotate, object: newWindow)
            notificationCenter.addObserver(self, selector: #selector(windowDidMoveToSceneWithNotification(_:)), name: .windowDidMoveToSceneNotification, object: newWindow)
        }
        
        observedWindow = newWindow
        updateSceneActivationState()
    }
    
    @MainActor
    package func requestUpdateForFidelity() {
        guard let uiView else {
            return
        }
        
        if updatesWillBeVisible {
            uiView.setNeedsLayout()
            
            guard let updateDelegate else {
                return
            }
            
            updateDelegate.requestUpdate(after: 0)
        } else {
            // <+156>
            let viewGraph = viewGraph
            viewGraph.clearDisplayLink()
            viewGraph.clearUpdateTimer()
            
            let needsLayout = uiView.layer.needsLayout()
            if needsLayout {
                _setNeedsUpdate()
            }
        }
    }
    
    package func clearDisplayLink() {
        viewGraph.clearDisplayLink()
    }
    
    package func clearUpdateTimer() {
        viewGraph.clearUpdateTimer()
    }
    
    @MainActor
    package func _startUpdateEnvironment() -> MySwiftUICore.EnvironmentValues {
        // <+280>
        guard let uiView else {
            return MySwiftUICore.EnvironmentValues()
        }
        
        // x22
        let traitCollection = traitCollectionOverride ?? uiView.traitCollection
        // <+408>
        // x23
        let environmentValues: MySwiftUICore.EnvironmentValues
        if traitCollection._environmentWrapper != nil {
            // <+440>
            // x26
            if let inheritedEnvironment {
                // <+812>
                environmentValues = inheritedEnvironment
                // <+856>
            } else {
                // <+528>
                environmentValues = traitCollection.environmentValues()
                // inheritedEnvironment nil 여부를 확인하지만 nil이기에 의미 없음
                // <+596>
                // <+856>
            }
        } else {
            // <+604>
            // x26
            if let inheritedEnvironment {
                // <+832>
                environmentValues = inheritedEnvironment
                // <+856>
            } else {
                // <+688>
                // self -> x20 -> x28
                // x20
                let viewGraph = viewGraph
                // x27
                if let initialInheritedEnvironment = viewGraph.initialInheritedEnvironment {
                    // <+1044>
                    environmentValues = initialInheritedEnvironment
                    // <+856>
                } else {
                    // <+748>
                    environmentValues = traitCollection.environmentValues()
                    // inheritedEnvironment, initialInheritedEnvironment의 nil 여부를 확인하지만 모두 nil이기에 의미 없음
                    // <+856>
                }
            }
            
            // <+1100>은 불릴 수 없는 것 같음
        }
        
        // <+856>
        if let environmentOverride = self.environmentOverride {
            // <+952>
            fatalError("TODO")
        }
        
        return environmentValues
    }
    
    @MainActor
    package func _updateEnvironment(_ environmentValues: inout MySwiftUICore.EnvironmentValues) {
        guard let uiView else {
            return
        }
        
        if let uiView = self.uiView {
            // <+364>
            if let idiom = MySwiftUICore.ViewGraphHost.Idiom(_uiIdiom: uiView.traitCollection.userInterfaceIdiom) {
                environmentValues.viewGraphIdiom = idiom
            }
        }
        
        let screen = MyUIScreen._mainScreen
        environmentValues.viewGraphAssetCatalogConfiguration = ViewGraphHost.AssetCatalogConfiguration(
            referenceBounds: screen._referenceBounds,
            pointsPerInch: screen._pointsPerInch,
            preferredArtworkSubtype: 0
        )
        
        if let undimmedTintColor = uiView.window?._undimmedTintColor() {
            // <+728>
            environmentValues._accentColor = Color.init(_platformColor: undimmedTintColor, definition: UICorePlatformColorDefinition.self)
        }
        
        // <+808>
        if uiView.traitCollection.userInterfaceIdiom == .vision {
            environmentValues._defaultAccentColor = .white
        }
        
        environmentValues._defaultAccentColor = .blue
        
        // <+888>
        if let uiView = self.uiView, uiView.tintAdjustmentMode == .dimmed {
            // <+924>
            environmentValues.tintAdjustmentMode = .desaturated
        }
        
        // <+988>
        environmentValues.isLowPowerModeEnabled = UIGlobalState.shared.isLowPowerModeEnabled
        
        let glassLegibilitySetting = UIViewGlassGetLegibilitySetting()
        let diffusion: _Glass.Diffusion
        if glassLegibilitySetting == 1 {
            diffusion = .increased
        } else {
            diffusion = .automatic
        }
        environmentValues.glassDiffusion = diffusion
        
        updateMaterial(environmentValues: &environmentValues)
        
        if let uiView = self.uiView {
            let traitCollection: UITraitCollection
            if let traitCollectionOverride {
                traitCollection = traitCollectionOverride
            } else {
                traitCollection = uiView.traitCollection
            }
            
            environmentValues.appearsActive = (traitCollection.activeAppearance != .inactive)
        }
    }
    
    @MainActor
    package func _endUpdateEnvironment(_ environmentValues: MySwiftUICore.EnvironmentValues) {
        guard let uiView else {
            return
        }
        
        let traitCollection = traitCollectionOverride ?? uiView.traitCollection
        
        let environmentWrapper: MySwiftUICore.ViewGraphHostEnvironmentWrapper
        if let _environmentWrapper = traitCollection._environmentWrapper as? MySwiftUICore.ViewGraphHostEnvironmentWrapper {
            // <+180>
            environmentWrapper = _environmentWrapper
        } else {
            // <+240>
            environmentWrapper = MySwiftUICore.ViewGraphHostEnvironmentWrapper()
        }
        
        viewGraph.setEnvironment(environmentValues, wrapper: environmentWrapper)
    }
    
    @MainActor package func _updateTransform() {
        // self = x19
        // x21
        guard let uiView else {
            return
        }
        
        guard !viewGraph.invalidateTransform() else {
            return
        }
        
        if registeredForGeometryChanges {
            uiView._unregisterForGeometryChanges()
            registeredForGeometryChanges = false
        }
    }
    
    @MainActor package func _updateSize() {
        guard let uiView else {
            return
        }
        
        viewGraph.setProposedSize(uiView.bounds.size)
    }
    
    @MainActor package func _updateContainerSize() {
        guard let uiView else {
            return
        }
        
        let safeAreaInsets = uiView.safeAreaInsets
        var insets = MySwiftUICore.EdgeInsets(top: safeAreaInsets.top, leading: safeAreaInsets.left, bottom: safeAreaInsets.bottom, trailing: safeAreaInsets.right)
        insets.xFlipIfRightToLeft { .leftToRight }
        
        let bounds = uiView.bounds
        let result = bounds.inset(by: insets)
        viewGraph.setContainerSize(result.size)
    }
    
    @MainActor
    private func updateMaterial(environmentValues: inout MySwiftUICore.EnvironmentValues) {
        // x23
        guard let uiView else {
            return
        }
        
        // x25
        let traitCollection = traitCollectionOverride ?? uiView.traitCollection
        let typedStorage = uiView.typedStorage
        let storage = modifyTypedStorage(typedStorage) { $0 }
        
        // UIKit._UIIntelligenceLightSourceConfiguration._GlassBackgroundStyleKey가 Key로 있으면 뭔가를 함
        guard !storage.isEmpty else {
            return
        }
        fatalError("TODO")
        
//#if SwiftUICompataibility
//        var nativeEnvironmentValues = SwiftUI.EnvironmentValues()
//        let hostingView = SwiftUI._UIHostingView(rootView: EmptyView())
//        let base = unsafe unsafeBitCast(Mirror(reflecting: hostingView).descendant("_base")!, to: _UIKitPrivate.UIHostingViewBase.self)
//        base.uiView = self.uiView
//        base._updateEnvironment(&nativeEnvironmentValues)
//        
//        guard let glassMaterialContainerStyle = nativeEnvironmentValues.glassMaterialContainerStyle else {
//            return
//        }
//        environmentValues.glassMaterialContainerStyle = glassMaterialContainerStyle
//        
//        if let resolvedProvider = traitCollection.resolvedProvider as? _SwiftUICorePrivate.MaterialProvider {
//            environmentValues.glassColorScheme = ColorScheme(_uiUserInterfaceStyle: traitCollection.userInterfaceStyle) ?? .light
//            environmentValues.backgroundMaterial = Material(provider: MaterialProviderNativeBridge(base: resolvedProvider))
//        }
//#endif
    }
    
    // ___lldb_unnamed_symbol317388
    private func addNotificationObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(willBeginSnapshotSession), name: .applicationWillBeginSnapshotSessionNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(didEndSnapshotSession), name: .applicationDidEndSnapshotSessionNotification, object: nil)
        
        var names: [Notification.Name] = [
            Notification.Name(rawValue: CFNotificationName.cfLocaleCurrentLocaleDidChange!.rawValue as String),
            Notification.Name(rawValue: CFNotificationName.cfTimeZoneSystemTimeZoneDidChange!.rawValue as String),
            .NSProcessInfoPowerStateDidChange
        ]
        names.append(PlatformAccessibilitySettingsDefinition.notification)
        
        for name in names {
            notificationCenter.addObserver(self, selector: #selector(externalEnvironmentDidChange), name: name, object: nil)
        }
    }
    
    @MainActor
    package func _setNeedsUpdate() {
        guard let uiView else {
            return
        }
        
        viewGraph.cancelAsyncRendering()
        
        guard !updatesWillBeVisible else {
            uiView.setNeedsLayout()
            return
        }
        
        guard !pendingPreferencesUpdate else {
            return
        }
        
        self.pendingPreferencesUpdate = true
        DispatchQueue.main.async {
            // ___lldb_unnamed_symbol312705
            self.isEnteringForeground = false
            self.updateSceneActivationState()
        }
    }
    
    @objc private func willBeginSnapshotSession() {
        fatalError("TODO")
    }
    
    @objc private func didEndSnapshotSession() {
        fatalError("TODO")
    }
    
    @objc private func externalEnvironmentDidChange() {
        fatalError("TODO")
    }
    
    @MainActor @objc private func sceneWillDeactivate() {
        updateSceneActivationState()
        isExitingForeground = true
    }
    
    @MainActor @objc private func sceneDidActivate() {
        updateSceneActivationState()
        isExitingForeground = false
        requestUpdateForFidelity()
    }
    
    @objc private func sceneDidEnterBackground() {
        fatalError("TODO")
    }
    
    @objc private func sceneWillEnterForeground() {
        fatalError("TODO")
    }
    
    @objc private func sceneDidUpdateSystemUserInterfaceStyle() {
        fatalError("TODO")
    }
    
    @objc private func sceneDidBeginResize() {
        isResizingWindow = true
    }
    
    @objc private func sceneDidEndResize() {
        isResizingWindow = false
    }
    
    @objc private func sceneDidBecomeKey() {
        guard let delegate else {
            return
        }
        
        delegate.baseSceneBecameKey(self)
    }
    
    @objc private func sceneDidResignKey() {
        fatalError("TODO")
    }
    
    @objc private func sceneDidUpdateSystemSceneDisplacement() {
        if let updateDelegate = viewGraph.updateDelegate {
            updateDelegate.invalidateProperties(.environment, mayDeferUpdate: true)
        }
    }
    
    @objc @MainActor private func sceneDidChangeRelativeTransform(_ notification: Notification) {
        guard let uiView else {
            return
        }
        
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        guard let windowScene = uiView.window?.windowScene else {
            return
        }
        
        guard let scene = notification.object as? UIScene, scene == windowScene else {
            return
        }
        
        updateDelegate.invalidateProperties([.transform], mayDeferUpdate: true)
    }
    
    @objc @MainActor private func sceneDidChangeWorldTrackingLimitations(_ notification: Notification) {
        guard let uiView else {
            return
        }
        
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        guard let windowScene = uiView.window?.windowScene else {
            return
        }
        
        guard let scene = notification.object as? UIScene, scene == windowScene else {
            return
        }
        
        updateDelegate.invalidateProperties([.environment], mayDeferUpdate: true)
    }
    
    @objc private func snappingUpdate(_ notification: Notification) {
        fatalError("TODO")
    }
    
    @objc private func windowWillRotateWithNotification(_ notification: Notification) {
        fatalError("TODO")
    }
    
    @objc private func windowDidMoveToSceneWithNotification(_ notification: Notification) {
        fatalError("TODO")
    }
    
    @MainActor package func layoutSubviews() {
        let viewGraph = viewGraph
        guard let updateDelegate = viewGraph.updateDelegate else {
            return 
        }
        
        guard let uiView else {
            return
        }
        
        guard uiView.window != nil else {
            return
        }
        
        guard canAdvanceTimeAutomatically else {
            return
        }
        
        Update.locked { 
            viewGraph.cancelAsyncRendering()
            let interval = viewGraph.nextRenderInterval { 
                return renderInterval(from: .systemUptime) / Double(UIAnimationDragCoefficient())
            }
            
            updateDelegate.render(interval: interval, updateDisplayList: true, targetTimestamp: nil)
        }
    }
    
    // ___lldb_unnamed_symbol318822
    private func renderInterval(from time: MySwiftUICore.Time) -> Double {
        /*
         self = x21
         time (Time *) = x19
         */
        if lastRenderTime == .zero {
            self.lastRenderTime = Time(seconds: time.seconds - Double(1E-6))
        } else {
            if (time < lastRenderTime) {
                self.lastRenderTime = Time(seconds: time.seconds - Double(1E-6))
            }
        }
        
        // <+396>
        let lastRenderTime = self.lastRenderTime
        var d8 = time.seconds
        let d9 = lastRenderTime.seconds
        d8 = (d8 - d9)
        self.lastRenderTime = time
        return d8
    }
    
    package var _keyboardSafeAreaHeight: CGFloat {
        return 0
    }
}

extension UIHostingViewBase {
    package struct Configuration {
        package var options = UIHostingViewBase.Options.allowKeyboardSafeArea
        package var colorDefinitions: MySwiftUICore.PlatformColorDefinition.Type? = nil
        
        package init() {}
    }
}

extension UIHostingViewBase {
    package struct Options: OptionSet {
        package static var allowUnregisteredGeometryChanges: Options { return Options(rawValue: 1 << 0) }
        package static var allowKeyboardSafeArea: Options { return Options(rawValue: 1 << 1) }
        package static var allowContainerShape: Options { return Options(rawValue: 0) }
        
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension UIHostingViewBase: ViewGraphRenderDelegate {
    package var renderingRootView: AnyObject {
        if let uiView {
            return uiView
        } else {
            return UIView()
        }
    }
    
    package func updateRenderContext(_ context: inout MySwiftUICore.ViewGraphRenderContext) {
        guard let uiView else {
            return
        }
        
        if let window = uiView.window {
            context.contentsScale = (window.myUIScreen?.scale ?? 0)
        } else {
            context.contentsScale = 1
        }
    }
    
    package func withMainThreadRender(wasAsync: Bool, _ body: @MainActor () -> MySwiftUICore.Time) -> MySwiftUICore.Time {
        let baseShouldDisableUIKitAnimationsWhenRendering: Bool
        if let delegate {
            baseShouldDisableUIKitAnimationsWhenRendering = delegate.baseShouldDisableUIKitAnimationsWhenRendering(self)
        } else {
            baseShouldDisableUIKitAnimationsWhenRendering = false
        }
        
        // <+148>
        if !UIView.areAnimationsEnabled || !baseShouldDisableUIKitAnimationsWhenRendering {
            // <+204>
            let result = body()
            if !wasAsync {
                allowUIKitAnimationsForNextUpdate = false
            }
            return result
        } else {
            if wasAsync {
                // <+188>
                return body()
            } else {
                // <+256>
                var result = MySwiftUICore.Time.infinity
                UIView.performWithoutAnimation {
                    result = body()
                }
                allowUIKitAnimationsForNextUpdate = false
                return result
            }
        }
    }
    
    package func renderIntervalForDisplayLink(timestamp: MySwiftUICore.Time) -> Double {
        fatalError("TODO")
    }
}

extension UIHostingViewBase: ViewGraphHostDelegate {
    package func updateGraphInputs(_ inputs: inout MySwiftUICore._GraphInputs) {
        var unchecked = UncheckedSendable(inputs)
        MainActor.assumeIsolated {
            var inputs = unchecked.value
            
            // x20
            guard let uiView else {
                return
            }
            
            guard let idiom = ViewGraphHost.Idiom(_msui_uiIdiom: uiView.traitCollection.userInterfaceIdiom) else {
                return
            }
            
            guard inputs.viewGraphHostIdiom == nil else {
                return
            }
            
            inputs.viewGraphHostIdiom = idiom
            unchecked.value = inputs
        }
        inputs = unchecked.value
    }
}

extension UIHostingViewBase: RootContainerShapeProvider {}

package protocol UIHostingViewBaseDelegate: AnyObject {
    func baseShouldDisableUIKitAnimationsWhenRendering(_ base: UIHostingViewBase) -> Bool
    func baseDidMoveToScene(_ base: UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?)
    func baseSceneActivationStateDidChange(_ base: UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?)
    func baseKeyboardSafeAreaDidChange(_ base: UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat)
    func baseSceneBecameKey(_ base: UIHostingViewBase)
    func baseSceneResignedKey(_ base: UIHostingViewBase)
}

fileprivate let isChaaranaApp: Bool = {
    return Bundle.main.bundleIdentifier == "com.parjanya.ChaaranaVision"
}()

extension UIHostingViewBase: @unchecked Sendable {}

fileprivate func ___lldb_unnamed_symbol319514(configuration: UIHostingViewBase.Configuration) {
    let colorDefinitions = configuration.colorDefinitions ?? UICorePlatformColorDefinition.self
    PlatformColorDefinition.setDefinition(colorDefinitions, system: .uiKit)
    
    PlatformGlassDefinition.setDefinition(UIKitPlatformGlassDefinition.self, system: .uiKit)
    PlatformGlassInteractionDefinition.setDefinition(UIKitPlatfromGlassInteractionDefinition.self, system: .uiKit)
    PlatformAccessibilitySettingsDefinition.setDefinition(UIKitPlatformAccessibilitySettingsDefinition.self, system: .uiKit)
}

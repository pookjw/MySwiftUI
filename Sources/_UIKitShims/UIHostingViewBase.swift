package import UIKit
@_spi(Internal) package import MySwiftUICore
private import _UIKitPrivate

package class UIHostingViewBase: NSObject {    
    package weak var uiView: UIView? = nil
    package weak var delegate: UIHostingViewBaseDelegate? = nil
    private var safeAreaRegions: SafeAreaRegions = .all
    private let configuration: UIHostingViewBase.Configuration
    package let viewGraph: ViewGraphHost
    private var inheritedEnvironment: EnvironmentValues? = nil
    private var environmentOverride: EnvironmentValues? = nil
    private var traitCollectionOverride: UITraitCollection?
    private var cachedContainerShape: UnevenRoundedRectangle?
    private var canAdvanceTimeAutomatically: Bool = true
    private var allowUIKitAnimationsForNextUpdate: Bool = false
    private var lastRenderTime: Time = .zero
    private var pendingPreferencesUpdate: Bool = false
    private var pendingPostDisappearPreferencesUpdate: Bool = false
    private var _updateFidelity: _UpdateFidelity = .milliseconds
    private var isHiddenForReuse: Bool = false
    private var isEnteringForeground: Bool = false
    private var isExitingForeground: Bool = false
    private var isCapturingSnapshots: Bool = false
    private var isRotatingWindow: Bool = false
    private var isResizingWindow: Bool = false
    private var _sceneActivationState: UIScene.ActivationState? = nil
    private var registeredForGeometryChanges: Bool = false
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
    
    package init(viewGraph: ViewGraphHost, options: UIHostingViewBase.Options) {
        fatalError("TODO")
    }
    
    package init(viewGraph: ViewGraphHost, configuration: UIHostingViewBase.Configuration) {
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
            let updateDelegate = viewGraph.updateDelegate
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
        
        let viewGraph = viewGraph
        
        guard let updateDelegate = viewGraph.updateDelegate else {
            return
        }
        
        let observedWindow = observedWindow
        addOrRemoveKeyboardTracking(oldWindow: observedWindow)
        
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
                    fatalError("TODO")
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
        ___lldb_unnamed_symbol317396()
        ___lldb_unnamed_symbol317397()
        requestUpdateForFidelity()
        
        if newWindow == nil {
            isRotatingWindow = false
        }
        
        updateDelegate.invalidateProperties([.environment], mayDeferUpdate: true)
    }
    
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
    
    private func ___lldb_unnamed_symbol317396() {
        fatalError("TODO")
    }
    
    private func ___lldb_unnamed_symbol317397() {
        fatalError("TODO")
    }
    
    package func requestUpdateForFidelity() {
        fatalError("TODO")
    }
    
    package func clearDisplayLink() {
        viewGraph.clearDisplayLink()
    }
    
    // ___lldb_unnamed_symbol320011
    @MainActor
    private func addOrRemoveKeyboardTracking(oldWindow: UIWindow?) {
        guard isLinkedOnOrAfter(.v2) else {
            return
        }
        guard let uiView else {
            return
        }
        guard configuration.options.contains(.allowKeyboardSafeArea) else {
            return
        }
        
        if let oldWindow {
            guard uiView.window == nil else {
                return
            }
            
            guard let keyboardSceneDelegate = uiView.keyboardSceneDelegate else {
                return
            }
            
            _UICoreKeyboardTrackingClass().remove(trackingElement, window: oldWindow, keyboardDelegate: keyboardSceneDelegate)
        } else {
            guard let window = uiView.window else {
                return
            }
            
            guard let keyboardSceneDelegate = uiView.keyboardSceneDelegate else {
                return
            }
            
            _UICoreKeyboardTrackingClass().add(trackingElement, window: window, keyboardDelegate: keyboardSceneDelegate)
        }
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
    
    @objc private func willBeginSnapshotSession() {
        fatalError("TODO")
    }
    
    @objc private func didEndSnapshotSession() {
        fatalError("TODO")
    }
    
    @objc private func externalEnvironmentDidChange() {
        fatalError("TODO")
    }
}

extension UIHostingViewBase {
    package struct Configuration {
        package var options = UIHostingViewBase.Options.allowKeyboardSafeArea
        package var colorDefinitions: PlatformColorDefinition.Type? = nil
        
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

extension UIHostingViewBase: ViewGraphRenderDelegate {}
extension UIHostingViewBase: ViewGraphHostDelegate {}
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

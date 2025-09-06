package import UIKit
@_spi(Internal) package import MySwiftUICore
private import _UIKitPrivate

package final class UIHostingViewBase: NSObject {
    private weak var uiView: UIView? = nil
    private weak var delegate: UIHostingViewBaseDelegate? = nil
    private var safeAreaRegions: SafeAreaRegions = .all
    private let configuration: UIHostingViewBase.Configuration
    private let viewGraph: ViewGraphHost
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
    private lazy var trackingElement: UICoreHostingKeyboardTrackingElement? = nil
    private var isUpdatingKeyboard: Bool = false
    
    package init(viewGraph: ViewGraphHost, configuration: UIHostingViewBase.Configuration) {
        self.viewGraph = viewGraph
        self.configuration = configuration
        super.init()
    }
    
    package func setUp() {
        let viewGraphHost = viewGraph
        viewGraphHost.renderDelegate = self
        viewGraphHost.delegate = self
        viewGraphHost.setUp()
        
        addNotificationObservers()
    }
    
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
        package var options = UIHostingViewBase.Options.allowContainerShape
        package var colorDefinitions: PlatformColorDefinition.Type? = nil
        
        package init() {
        }
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

protocol UIHostingViewBaseDelegate: AnyObject {
    func baseShouldDisableUIKitAnimationsWhenRendering(_ base: UIHostingViewBase) -> Bool
    func baseDidMoveToScene(_ base: UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?)
    func baseSceneActivationStateDidChange(_ base: UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?)
    func baseKeyboardSafeAreaDidChange(_ base: UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat)
    func baseSceneBecameKey(_ base: UIHostingViewBase)
    func baseSceneResignedKey(_ base: UIHostingViewBase)
}

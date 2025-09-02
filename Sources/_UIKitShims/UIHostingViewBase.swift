package import UIKit
@_spi(Internal) package import MySwiftUICore
private import _UIKitPrivate

package class UIHostingViewBase: NSObject {
    private weak var uiView: UIView?
    private weak var delegate: UIHostingViewBaseDelegate?
    private var safeAreaRegions: SafeAreaRegions
    private let configuration: UIHostingViewBase.Configuration
    private let viewGraph: ViewGraphHost
    private var inheritedEnvironment: EnvironmentValues?
    private var environmentOverride: EnvironmentValues?
    private var traitCollectionOverride: UITraitCollection?
    private var cachedContainerShape: UnevenRoundedRectangle?
    private var canAdvanceTimeAutomatically: Bool
    private var allowUIKitAnimationsForNextUpdate: Bool
    private var lastRenderTime: Time
    private var pendingPreferencesUpdate: Bool
    private var pendingPostDisappearPreferencesUpdate: Bool
    private var _updateFidelity: _UpdateFidelity
    private var isHiddenForReuse: Bool
    private var isEnteringForeground: Bool
    private var isExitingForeground: Bool
    private var isCapturingSnapshots: Bool
    private var isRotatingWindow: Bool
    private var isResizingWindow: Bool
    private var _sceneActivationState: UIScene.ActivationState?
    private var registeredForGeometryChanges: Bool
    private weak var observedWindow: UIWindow?
    private weak var observedScene: UIWindowScene?
    private var keyboardFrame: CGRect?
    private var inactiveKeyboardFrame: CGRect?
    private var keyboardSeed: UInt32
    private lazy var trackingElement: UICoreHostingKeyboardTrackingElement? = { fatalError("TODO") }()
    private var isUpdatingKeyboard: Bool
    
    package init(viewGraph: ViewGraphHost, configuration: UIHostingViewBase.Configuration) {
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

protocol UIHostingViewBaseDelegate: AnyObject {
    func baseShouldDisableUIKitAnimationsWhenRendering(_ base: UIHostingViewBase) -> Bool
    func baseDidMoveToScene(_ base: UIHostingViewBase, oldScene: UIScene?, newScene: UIScene?)
    func baseSceneActivationStateDidChange(_ base: UIHostingViewBase, oldState: UIScene.ActivationState?, newState: UIScene.ActivationState?)
    func baseKeyboardSafeAreaDidChange(_ base: UIHostingViewBase, oldHeight: CGFloat, newHeight: CGFloat)
    func baseSceneBecameKey(_ base: UIHostingViewBase)
    func baseSceneResignedKey(_ base: UIHostingViewBase)
}

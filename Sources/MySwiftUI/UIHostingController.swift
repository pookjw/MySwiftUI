public import UIKit
internal import MySwiftUICore
private import _UIKitPrivate

open class UIHostingController<Content: View>: UIViewController {
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
        fatalError("TODO")
    }
    
    open override dynamic func viewWillAppear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override dynamic func willMove(toParent parent: UIViewController?) {
        fatalError("TODO")
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
        fatalError("TODO")
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
        fatalError("TODO")
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
    
    final var navigationBridge: NavigationBridge_PhoneTV? {
        fatalError("TODO")
    }
    
    final func _viewSafeAreaDidChange() {
        fatalError("TODO")
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

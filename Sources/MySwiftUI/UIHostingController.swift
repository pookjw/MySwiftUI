public import UIKit
internal import MySwiftUICore
private import _UIKitPrivate

open class UIHostingController<Content: View>: UIViewController {
    deinit {
        fatalError("TODO")
    }
    
    public required init?(coder: NSCoder) {
        fatalError("TODO")
    }
    
    open override func loadView() {
        fatalError("TODO")
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override func willMove(toParent parent: UIViewController?) {
        fatalError("TODO")
    }
    
    open override func addChild(_ childController: UIViewController) {
        fatalError("TODO")
    }
    
    open override var childForHomeIndicatorAutoHidden: UIViewController? {
        fatalError("TODO")
    }
    
    open override var msui_childViewControllerForInterfaceOrientationLock: UIViewController? {
        fatalError("TODO")
    }
    
#if os(visionOS)
    open override var childViewControllerForPreferredContainerBackgroundStyle: UIViewController? {
        fatalError("TODO")
    }
#endif
    
    open override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
        fatalError("TODO")
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        fatalError("TODO")
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        fatalError("TODO")
    }
    
    open override func didMove(toParent parent: UIViewController?) {
        fatalError("TODO")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("TODO")
    }
    
    open override var isModalInPresentation: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    open override var keyCommands: [UIKeyCommand]? {
        fatalError("TODO")
    }
    
#if os(visionOS)
    open override var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        fatalError("TODO")
    }
#endif
    
    open override func preferredContentSizeDidChange(forChildContentContainer container: any UIContentContainer) {
        fatalError("TODO")
    }
    
    open override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        fatalError("TODO")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        fatalError("TODO")
    }
    
    open override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        fatalError("TODO")
    }
    
    open override var prefersHomeIndicatorAutoHidden: Bool {
        fatalError("TODO")
    }
    
    open override var prefersStatusBarHidden: Bool {
        fatalError("TODO")
    }
    
    open override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        fatalError("TODO")
    }
    
    open override var undoManager: UndoManager? {
        fatalError("TODO")
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        fatalError("TODO")
    }
    
    open override func viewWillLayoutSubviews() {
        fatalError("TODO")
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        fatalError("TODO")
    }
    
    open override func _wantsTransparentBackground() -> Bool {
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

extension UIHostingController: @preconcurrency ViewGraphBridgePropertiesDelegate {
    final func resolveRequiredBridges(_: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) {
        fatalError("TODO")
    }
}

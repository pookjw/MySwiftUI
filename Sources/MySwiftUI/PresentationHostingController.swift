// EA2FC9BF0979B2FBDEE9FB25F07E8D92
internal import UIKit
internal import MySwiftUICore
internal import _UIKitPrivate

final class PresentationHostingController<Content : View>: UIHostingController<Content> {
    private weak var secondaryDismissDelegate: PresentationHostingControllerDismissDelegate?
    private var legacyPresentationWantsTransparentBackground: Bool
    private var bridgedPresentationWantsTransparentBackground: Bool
    private(set) var presentingBridgeKind: PresentationHostingControllerPresenterKind?
    private var placement: SheetPreference.Placement?
    private var lastColumnCount: Int
    var lastInteractiveDismissDisabled: Bool?
    var didPresenterLoseModifierRecursively: Bool
    var wasPreempted: Bool
    private var lastPresentationOptions: PresentationOptionsPreference?
    private var lastPreferenceForSheetControllerConfiguration: PresentationOptionsPreference?
    private let oscillationDetector: OscillationDetector<PresentationOptionsPreference>?
    private var observedSize: CGSize?
    var isDelayingRemotePresentation: Bool
    private var breakthroughEffect: BreakthroughEffect?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func _canShowWhileLocked() -> Bool {
        assertUnimplemented()
    }
    
    override var _preferredBreakthroughMode: _UIBreakthroughMode {
        assertUnimplemented()
    }
    
    override var _showcaseView: UIView? {
        assertUnimplemented()
    }
    
    override var keyCommands: [UIKeyCommand]? {
        assertUnimplemented()
    }
    
    override var preferredContentSize: CGSize {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        assertUnimplemented()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        assertUnimplemented()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: any UIViewControllerTransitionCoordinator) {
        assertUnimplemented()
    }
    
    @objc fileprivate func escapeKeyPressed() {
        assertUnimplemented()
    }
    
    override func sizingOptionsDidChange(from oldValue: UIHostingControllerSizingOptions) {
        assertUnimplemented()
    }
    
    fileprivate var shouldUsePresentationSizing: Bool {
        assertUnimplemented()
    }
    
    override func update(_ environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
    
    fileprivate var presentationKind: PresentationKind {
        assertUnimplemented()
    }
    
    func configureSecondaryDismissDelegate<T: PresentationHostingControllerDismissDelegate>(_: T) {
        assertUnimplemented()
    }
}

extension PresentationHostingController where Content == AnyView {
    func setPresentationColorScheme(_ colorScheme: ColorScheme) {
        assertUnimplemented()
    }
    
    func didChangeSelectedDetent(sheet: UISheetPresentationController) {
        assertUnimplemented()
    }
    
    func resetSheetControllerOscillationDetection() {
        assertUnimplemented()
    }
    
    func setupDelayIfNeeded() {
        assertUnimplemented()
    }
    
    func setupSheet(for kind: PresentationHostingControllerPresenterKind, presenter: UIViewController, placement: SheetPreference.Placement) {
        assertUnimplemented()
    }
    
    func updateSheet(with preference: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    func setBackgroundTransparency(preferenceValue: ContainerBackgroundKeys.Transparency?) {
        assertUnimplemented()
    }
    
    func prepareModalPresentationStyle(_ style: UIModalPresentationStyle, presentationOptions: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    func sizingOptionsDidChange(from sizingOptions: UIHostingControllerSizingOptions) {
        assertUnimplemented()
    }
    
    convenience init(rootView: Content, delegate: PresentationHostingControllerDelegate?, placement: SheetPreference.Placement?, legacyDrawsBackground: Bool) {
        assertUnimplemented()
    }
    
    fileprivate func configureSizingOptions(for preference: PresentationOptionsPreference, sheetController: UISheetPresentationController?) {
        assertUnimplemented()
    }
    
    func updatePreferredContentSizeIfNeeded(presenter: UIViewController?, sizing: PresentationSizing?) {
        assertUnimplemented()
    }
    
    func configureDetents(of sheet: UISheetPresentationController, using preference: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    func setPassthrough(using preference: PresentationOptionsPreference) {
        assertUnimplemented()
    }
}

extension PresentationHostingController {
    fileprivate final class HostingView : _UIHostingView<Content> {
        weak var backgroundDelegate: PresentationBackgroundDelegate?
        
        var defaultBackgroundIsTransparent: Bool {
            assertUnimplemented()
        }
        
        required init(rootView: Content) {
            assertUnimplemented()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

enum PresentationHostingControllerPresenterKind {
    case sheetBridge
    case popoverInspectorBridge
    case inspectorRepresentable
}

protocol PresentationHostingControllerDelegate : AnyObject {
    func didBeginInteractiveDismissal(_ viewController: UIViewController)
    func didDismissViewController(_ viewController: UIViewController, wasPreempted: Bool, modifierRemoved: Bool)
    var isBackingV5Inspector: Bool { get }
    func willTransitionToRegularSizeClass()
}

protocol PresentationHostingControllerDismissDelegate : AnyObject {
    func didDismissViewController(_ viewController: UIViewController, wasPreempted: Bool)
}

protocol PresentationBackgroundDelegate : AnyObject {
    var defaultBackgroundIsTransparent: Bool { get }
}

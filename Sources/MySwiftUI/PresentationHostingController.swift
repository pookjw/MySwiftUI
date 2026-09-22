// EA2FC9BF0979B2FBDEE9FB25F07E8D92
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import _UIKitPrivate

let clientNeedsOscillationSuppression = isLinkedOnOrAfter(.v6)

final class PresentationHostingController<Content : View>: UIHostingController<Content> {
    private weak var delegate: PresentationHostingControllerDelegate? = nil
    private weak var secondaryDismissDelegate: PresentationHostingControllerDismissDelegate? = nil
    private var legacyPresentationWantsTransparentBackground: Bool
    private var bridgedPresentationWantsTransparentBackground: Bool = false
    private(set) var presentingBridgeKind: PresentationHostingControllerPresenterKind? = nil
    private var placement: SheetPreference.Placement? = nil
    private var lastColumnCount: Int = 0
    var lastInteractiveDismissDisabled: Bool? = nil
    var didPresenterLoseModifierRecursively: Bool = false
    var wasPreempted: Bool = false
    private var lastPresentationOptions: PresentationOptionsPreference? = nil
    private var lastPreferenceForSheetControllerConfiguration: PresentationOptionsPreference? = nil
    private let oscillationDetector: OscillationDetector<PresentationOptionsPreference>?
    private var observedSize: CGSize? = nil
    var isDelayingRemotePresentation: Bool = false
    private var breakthroughEffect: BreakthroughEffect? = nil
    
    init(
        rootView: Content,
        delegate: PresentationHostingControllerDelegate?, 
        placement: SheetPreference.Placement?,
        legacyDrawsBackground: Bool
    ) {
        /*
         content -> x0 -> x19
         delegate -> x1/x2 -> x21/x23
         placement -> w3 -> w24
         legacyDrawsBackground -> w4 -> w25
         */
        // <+364>
        self.legacyPresentationWantsTransparentBackground  = !legacyDrawsBackground
        self.placement = placement
        
        if clientNeedsOscillationSuppression {
            // <+420>
            self.oscillationDetector = OscillationDetector(
                type: PresentationOptionsPreference.self,
                size: 3,
                retentionCount: 10,
                predicate: { to, from in
                    // $s7SwiftUI29PresentationHostingControllerC8rootView8delegate9placement21legacyDrawsBackgroundACyxGx_AA0cdE8Delegate_pSgAA15SheetPreferenceV9PlacementOSgSbtcfcSbAA0c7OptionsO0V_AQSgtcfU_
                    return !to.sheetConfigurationChanged(from: from)
                }
            )
        } else {
            self.oscillationDetector = nil
        }
        
        // <+728>
        let hostingView = PresentationHostingController<Content>.HostingView(rootView: rootView)
        super.init(_hostingView: hostingView)
        
        // <+848>
        self.delegate = delegate
        self.setBackgroundTransparency(preferenceValue: .automatic)
        
        self.registerForTraitChanges(
            [UITraitHorizontalSizeClass.self, UITraitVerticalSizeClass.self, UITraitPresentationSemanticContext.self]
        ) { (traitEnvironment: PresentationHostingController<Content>, previousTraitCollection: UITraitCollection) in
            // $s7SwiftUI29PresentationHostingControllerC8rootView8delegate9placement21legacyDrawsBackgroundACyxGx_AA0cdE8Delegate_pSgAA15SheetPreferenceV9PlacementOSgSbtcfcyAHXD_So17UITraitCollectionCtcfU0_AA03AnyG0V_Tg5Tf4nnd_n
            if let preference = traitEnvironment.lastPresentationOptions {
                traitEnvironment.updateSheet(with: preference)
            }
        }
    }
    
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
    
    fileprivate var shouldUsePresentationSizing: Bool {
        assertUnimplemented()
    }
    
    override func update(_ environment: inout EnvironmentValues) {
        /*
         self -> x20 -> x19
         environment -> x0 -> x21
         */
        // <+148>
        environment.presentationKind = self.presentationKind.tag
        environment.presentationWantsTransparentBackground = self.host.wantsTransparentBackground
        
        if environment.isVisionEnabled {
            environment.backgroundInfo = BackgroundInfo(layer: 0, groupCount: 0)
            environment.backgroundMaterial = nil
        }
        
        super.update(&environment)
    }
    
    fileprivate var presentationKind: PresentationKind {
        guard
            let viewIfLoaded,
            viewIfLoaded.superview != nil
        else {
            return PresentationKind(tag: .none)
        }
        
        // <+72>
        // x21
        let presentationSemanticContext = self.traitCollection._presentationSemanticContext()
        
        if let activePresentationController = self.activePresentationController {
            let presentationStyle = activePresentationController.presentationStyle
            
            switch presentationSemanticContext {
            case .unspecified:
                // <+176>
                switch presentationStyle {
                case .fullScreen:
                    return PresentationKind(tag: .none)
                case .pageSheet:
                    return PresentationKind(tag: .fullScreenCover)
                case .formSheet:
                    return PresentationKind(tag: .fullScreenCover)
                case .currentContext:
                    return PresentationKind(tag: .none)
                case .custom:
                    return PresentationKind(tag: .none)
                case .overFullScreen:
                    return PresentationKind(tag: .fullScreenCover)
                case .overCurrentContext:
                    return PresentationKind(tag: .none)
                case .popover:
                    return PresentationKind(tag: .none)
                case .blurOverFullScreen:
                    return PresentationKind(tag: .blurOverFullScreen)
                case .none:
                    return PresentationKind(tag: .none)
                case .automatic:
                    return PresentationKind(tag: .none)
                @unknown default:
                    return PresentationKind(tag: .none)
                }
            case .sheet:
                return PresentationKind(tag: .sheet)
            case .popover:
                return PresentationKind(tag: .popover)
            default:
                return PresentationKind(tag: .none)
            }
        } else {
            switch presentationSemanticContext {
            case .unspecified:
                return PresentationKind(tag: .none)
            case .sheet:
                return PresentationKind(tag: .sheet)
            case .popover:
                return PresentationKind(tag: .popover)
            default:
                return PresentationKind(tag: .none)
            }
        }
    }
    
    func configureSecondaryDismissDelegate<T: PresentationHostingControllerDismissDelegate>(_: T) {
        assertUnimplemented()
    }
    
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
        // self -> x20 -> x19
        guard self.host.preferenceValue(RemotePresentationDelayKey.self) else {
            return
        }
        
        let view = unsafe self.view.unsafelyUnwrapped
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        self._beginDelayingPresentation(5.0) { [weak self] _ in
            // $s7SwiftUI29PresentationHostingControllerC18setupDelayIfNeededyyFS2bcfU_AA7AnyViewV_Tg5TA
            if let self {
                self.isDelayingRemotePresentation = false
            }
            
            return true
        }
        
        self.isDelayingRemotePresentation = true
    }
    
    func setupSheet(
        for kind: PresentationHostingControllerPresenterKind,
        presenter: UIViewController,
        placement: SheetPreference.Placement
    ) {
        /*
         self -> x20 -> x19
         kind -> w0
         presenter -> x1 -> x22
         placement -> w2 -> w20
         */
        self.presentingBridgeKind = kind
        self.placement = placement
        
        // sp + 0x50
        let (preference, transparency): (PresentationOptionsPreference, ContainerBackgroundKeys.Transparency) = Update.ensure { 
            // $s7SwiftUI29PresentationHostingControllerC10setupSheet3for9presenter9placementyAA0cdE13PresenterKindO_So06UIViewE0CAA0G10PreferenceV9PlacementOtFAA0c7OptionsN0V_AA23ContainerBackgroundKeysO12TransparencyOtyXEfU_AA7AnyViewV_Tg5TA
            // self -> x0 -> x21
            // <+256>
            let preferenceValues = self
                .host
                .base
                .viewGraph
                .viewGraph
                .preferenceValues()
            
            let options = preferenceValues[PresentationOptionsPreferenceKey.self].value
            let transparency = preferenceValues[ContainerBackgroundKeys.HostTransparency.self].value
            
            return (options, transparency)
        }
        
        assertUnimplemented()
    }
    
    func updateSheet(with preference: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    func setBackgroundTransparency(preferenceValue: ContainerBackgroundKeys.Transparency?) {
        /*
         self -> x20 -> x19
         preferenceValue -> x0 -> x21/w26
         */
        let host_1 = self.host
        // w25
        let wantsTransparentBackground = host_1.wantsTransparentBackground
        
        host_1.setWantsTransparentBackground(
            for: [.legacyPresentationSPI],
            self.legacyPresentationWantsTransparentBackground
        )
        
        if let preferenceValue {
            // <+144>
            let defaultBackgroundIsTransparent = self.host.defaultBackgroundIsTransparent
            
            let flag: Bool
            switch preferenceValue {
            case .transparent:
                flag = true
            case .notTransparent:
                flag = false
            case .automatic:
                flag = defaultBackgroundIsTransparent
            }
            
            self.host.setWantsTransparentBackground(
                for: [.containerBackground],
                flag
            )
        }
        
        // <+248>
        let host_2 = self.host
        
        guard wantsTransparentBackground != host_2.wantsTransparentBackground else {
            return
        }
        
        host_2.invalidateProperties([.environment], mayDeferUpdate: true)
    }
    
    func prepareModalPresentationStyle(_ style: UIModalPresentationStyle, presentationOptions: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    override func sizingOptionsDidChange(from sizingOptions: UIHostingControllerSizingOptions) {
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
        
        override var defaultBackgroundIsTransparent: Bool {
            if let backgroundDelegate {
                return backgroundDelegate.defaultBackgroundIsTransparent
            } else {
                return false
            }
        }
        
        required init(rootView: Content) {
            super.init(rootView: rootView)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
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

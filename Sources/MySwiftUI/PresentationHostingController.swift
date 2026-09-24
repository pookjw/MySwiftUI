// EA2FC9BF0979B2FBDEE9FB25F07E8D92
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import _UIKitPrivate
private import os.log

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
            return super.preferredContentSize
        }
        set {
            UIView.performWithoutAnimation { 
                super.preferredContentSize = newValue
            }
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
        
        // x29 - 0xd0
        let copy_1 = preference
        // transparency -> w21
        
        // <+164>
        let style: UIModalPresentationStyle
        
        switch placement {
        case .automatic:
            // <+264>
            if _SemanticFeature<Semantics_v6>.isEnabled {
                // <+320>
                if isLinkedOnOrAfter(.v7) {
                    style = .formSheet
                } else {
                    style = .automatic
                }
            } else {
                // <+376>
                style = .automatic
            }
        case .overFullScreen:
            // <+208>
            style = .overFullScreen
        case .formSheet:
            // <+484>
            style = .formSheet
        case .blurOverFullScreen:
            // <+188>
            style = .mrui_blurOverFullScreen
        case .fullScreenSheet:
            // <+484>
            style = .formSheet
        case .popover:
            // <+224>
            if let popoverPresentationController {
                // <+244>
                if let popoverEdgeAppearance = copy_1.popoverEdgeAppearance {
                    // <+408>
                    popoverPresentationController._prefersZoomTransitions = (popoverEdgeAppearance == .automatic)
                    style = .popover
                } else {
                    // <+428>
                    style = .popover
                }
            } else {
                // <+428>
                style = .popover
            }
        case .pageSheet:
            // <+368>
            style = .pageSheet
        }
        
        // <+496>
        self.prepareModalPresentationStyle(style, presentationOptions: copy_1)
        
        let sheetPresentationController: UISheetPresentationController
        if let _sheetPresentationController = self.presentationController as? UISheetPresentationController {
            // <+620>
            sheetPresentationController = _sheetPresentationController
        } else {
            // <+568>
            if let popoverPresentationController {
                let adaptiveSheetPresentationController: UISheetPresentationController?
#if os(visionOS)
                adaptiveSheetPresentationController = popoverPresentationController.msui_adaptiveSheetPresentationController
#else
                adaptiveSheetPresentationController = popoverPresentationController.adaptiveSheetPresentationController
#endif
                
                if let adaptiveSheetPresentationController {
                    sheetPresentationController = adaptiveSheetPresentationController
                } else {
                    return
                }
            } else {
                return
            }
        }
        
        // <+620>
        self.configureSizingOptions(for: copy_1, sheetController: sheetPresentationController)
        
        // <+640>
        // sp + 0x50
        let sizing: (any PresentationSizing)?
        if _SemanticFeature<Semantics_v6>.isEnabled {
            // <+696>
            sizing = copy_1.sizing ?? .automatic
        } else {
            // <+740>
            sizing = nil
        }
        
        self.updatePreferredContentSizeIfNeeded(presenter: presenter, sizing: sizing)
        
        // <+808>
        if (self.traitCollection.horizontalSizeClass == .regular) && (self.traitCollection.verticalSizeClass == .regular) {
            // <+932>
        } else {
            // <+888>
            if !copy_1.detents.isEmpty {
                self.configureDetents(of: sheetPresentationController, using: copy_1)
            } else {
                switch copy_1.dimmingBehavior {
                case .undimmedUpThrough, .backgroundInteractionEnabled:
                    self.configureDetents(of: sheetPresentationController, using: copy_1)
                case .always, nil:
                    break
                }
            }
            
            // <+932>
        }
        
        // <+932>
        if let selection = copy_1.selection {
            let value = selection.wrappedValue
            
            if copy_1.detents.contains(value) {
                sheetPresentationController.mrui_selectedDetentIdentifier = value.uiSheetDetentId.rawValue
            } else {
                Log.externalWarning("Cannot set selected sheet detent if it is not included\nin supported sheet detents.")
            }
        }
        
        // <+1088>
        self.lastPresentationOptions = copy_1
        
        if
            let delegate = self.delegate,
            let casted = delegate as? UISheetPresentationControllerDelegate
        {
            sheetPresentationController.delegate = casted
        } else {
            sheetPresentationController.delegate = nil
        }
        
        self.setBackgroundTransparency(preferenceValue: transparency)
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
        /*
         self -> x20
         style -> x0 -> x21
         presentationOptions -> x1 -> x19
         */
        if (style == .mrui_blurOverFullScreen) || (style == .overFullScreen) {
            self.modalPresentationCapturesStatusBarAppearance = true
        }
        
        self.modalPresentationStyle = style
        
        let currentStyle = self.modalPresentationStyle
        
        if (currentStyle == .popover) || (currentStyle == .formSheet) {
            Update.ensure { 
                // $s7SwiftUI0A10UIOrnamentC8position16contentAlignment18isRelativeToParent11environment20usesRemoteVisibility8rootViewACyxGSo27MRUIPlatterOrnamentPosition_p_AA11Alignment3DVSbAA17EnvironmentValuesVSgSbxtcfcyyXEfU1_AA03AnyP0V_Tg5TA
                self.host.base.viewGraph.viewGraph.instantiateIfNeeded()
            }
            
            self.configureSizingOptions(for: presentationOptions, sheetController: nil)
        }
    }
    
    override func sizingOptionsDidChange(from sizingOptions: UIHostingControllerSizingOptions) {
        /*
         self -> x20 -> x24
         sizingOptions -> x0 -> x27
         */
        // <+484>
        if let observedSize {
            self
                .host
                .base
                .viewGraph
                .viewGraph
                .sizeThatFitsObservers
                .stopObserving(
                    proposal: _ProposedSize(width: observedSize.width, height: nil)
                )
            
            self.observedSize = nil
            // <+756>
        }
        
        // <+756>
        guard let presentingViewController else {
            super.sizingOptionsDidChange(from: sizingOptions)
            return
        }
        
        let sizing: (any PresentationSizing)?
        if let lastPresentationOptions {
            // lastPresentationOptions -> x19 + 0xb8 (sp + 0x218)
            // <+824>
            if _SemanticFeature<Semantics_v6>.isEnabled {
                // <+904>
                // <+1016>
                sizing = lastPresentationOptions.sizing ?? .automatic
            } else {
                // <+968>
                super.sizingOptionsDidChange(from: sizingOptions)
                return
            }
        } else {
            // <+948>
            super.sizingOptionsDidChange(from: sizingOptions)
            return
        }
        
        // <+1016>
        if let sizing {
            if self.sizingOptions.isEmpty {
                // <+1160>
                if
                    let sheetPresentationController,
                    sheetPresentationController.presentationStyle == .formSheet
                {
                    // <+1208>
                    if
                        let lastPresentationOptions, 
                        lastPresentationOptions.useFormSheetSPISizing
                    {
                        // <+1076>
                    } else {
                        // <+1224>
                        let interfaceIdiom = self.traitCollection.userInterfaceIdiom.idiom ?? _GraphInputs.defaultInterfaceIdiom
                        // <+1420>
                        let presenter = presentingViewController.nonPresentedAncestor.view!
                        let navigationColumnCount = self.lastColumnCount
                        
                        var environment: EnvironmentValues
                        let traitCollection = self.traitCollection
                        if
                            let wrapper = traitCollection._environmentWrapper,
                            let casted = wrapper as? EnvironmentWrapper
                        {
                            environment = casted.environment
                        } else {
                            environment = EnvironmentValues()
                            environment.configureForRoot()
                            environment.configureForPlatform(traitCollection: traitCollection)
                        }
                        
                        let readableWidth = environment.readableWidth
                        
                        let context = PresentationSizingContext(
                            presenter: presenter,
                            navigationColumnCount: navigationColumnCount,
                            currentSize: nil,
                            sidebarColumnWidth: nil,
                            contentColumnWidth: nil,
                            interfaceIdiom: interfaceIdiom,
                            readableWidth: readableWidth
                        )
                        
                        let sizing = SheetSizing(
                            presentationSizing: sizing,
                            sizeContext: context
                        )
                        
                        let sheetSize = sizing.sheetSizeThatFits(
                            host: self.host,
                            subview: PresentationSizingRoot(host: self.host)
                        )
                        
                        // <+1848>
                        self.preferredContentSize = sheetSize
                        // <+2112>
                        self.observedSize = sheetSize
                        
                        self
                            .host
                            .base
                            .viewGraph
                            .viewGraph
                            .sizeThatFitsObservers
                            .addObserver(
                                for: _ProposedSize(width: sheetSize.width, height: nil),
                                exclusive: true
                            ) { [weak self] _, _ in
                                // $s7SwiftUI29PresentationHostingControllerC22sizingOptionsDidChange4fromyAA09UIHostinge6SizingG0V_tFySo6CGSizeV_AItcfU0_AA7AnyViewV_TG5TA
                                /*
                                 self -> x0 -> x20
                                 interfaceIdiom -> x1 -> x21
                                 */
                                // <+220>
                                guard
                                    let self,
                                    let lastPresentationOptions // x19 + 0x48
                                else {
                                    return
                                }
                                
                                // <+304>
                                let sizing: (any PresentationSizing)?
                                if _SemanticFeature<Semantics_v6>.isEnabled {
                                    // <+380>
                                    sizing = lastPresentationOptions.sizing ?? .automatic
                                } else {
                                    // <+444>
                                    sizing = nil
                                }
                                
                                // <+496>
                                guard
                                    let sizing,
                                    let presentingViewController = self.presentingViewController
                                else {
                                    return
                                }
                                
                                let presenter = presentingViewController.nonPresentedAncestor.view!
                                let navigationColumnCount = self.lastColumnCount
                                let preferredContentSize = self.preferredContentSize
                                
                                var environment: EnvironmentValues
                                let traitCollection = self.traitCollection
                                if
                                    let wrapper = traitCollection._environmentWrapper,
                                    let casted = wrapper as? EnvironmentWrapper
                                {
                                    environment = casted.environment
                                } else {
                                    environment = EnvironmentValues()
                                    environment.configureForRoot()
                                    environment.configureForPlatform(traitCollection: traitCollection)
                                }
                                
                                let readableWidth = environment.readableWidth
                                
                                let context = PresentationSizingContext(
                                    presenter: presenter,
                                    navigationColumnCount: navigationColumnCount,
                                    currentSize: preferredContentSize,
                                    sidebarColumnWidth: nil,
                                    contentColumnWidth: nil,
                                    interfaceIdiom: interfaceIdiom,
                                    readableWidth: readableWidth
                                )
                                
                                let sheetSizing = SheetSizing(
                                    presentationSizing: sizing,
                                    sizeContext: context
                                )
                                
                                let sheetSize = sheetSizing.sheetSizeThatFits(
                                    host: self.host,
                                    subview: PresentationSizingRoot(host: self.host)
                                )
                                
                                self.preferredContentSize = sheetSize
                            }
                        
                        return
                    }
                } else {
                    // <+1076>
                }
            } else {
                // <+1112>
            }
        } else {
            // <+1092>
        }
        
        super.sizingOptionsDidChange(from: sizingOptions)
    }
    
    fileprivate func configureSizingOptions(for preference: PresentationOptionsPreference, sheetController: UISheetPresentationController?) {
        /*
         self -> x20
         preference -> x0 -> x21
         sheetController -> x1 -> x19
         */
        guard self.modalPresentationStyle != .popover else {
            self.sizingOptions = [.preferredContentSize]
            return
        }
        
        // <+100>
        guard !preference.useFormSheetSPISizing else {
            self.sizingOptions = [.preferredContentSize]
            // <+772>
            if let sheetController {
                sheetController.prefersPageSizing = false
            }
            
            return
        }
        
        // <+156>
        // self -> x20 -> x23
        if self.modalPresentationStyle == .formSheet {
            // <+176>
            if _SemanticFeature<Semantics_v6>.isEnabled {
                // <+232>
                // <+392>
            } else {
                // <+276>
                self.sizingOptions = [.preferredContentSize]
                // <+772>
                if let sheetController {
                    sheetController.prefersPageSizing = false
                }
                
                return
            }
        } else {
            // <+392>
        }
        
        // <+392>
        if _SemanticFeature<Semantics_v6>.isEnabled {
            // <+452>
            // <+732>
            self.sizingOptions = []
            // <+772>
            if let sheetController {
                sheetController.prefersPageSizing = false
            }
        } else {
            // <+496>
            if _SemanticFeature<Semantics_v6>.isEnabled {
                // noop
            } else {
                // <+584>
                if self.modalPresentationStyle == .pageSheet {
                    // <+632>
                    self.sizingOptions = []
                    // <+772>
                    if let sheetController {
                        sheetController.prefersPageSizing = true
                    }
                } else {
                    // noop
                }
            }
        }
    }
    
    func updatePreferredContentSizeIfNeeded(presenter: UIViewController?, sizing: (any PresentationSizing)?) {
        /*
         self -> x20 -> x25
         presenter -> x0 -> x22
         sizing -> x1 -> x20
         */
        // <+392>
        guard
            self.modalPresentationStyle == .formSheet &&
            self.traitCollection.horizontalSizeClass == .regular
        else {
            return
        }
        
        // x29 - 0xc0
        let resolved: (any PresentationSizing)?
        if let sizing {
            resolved = sizing
        } else {
            // <+500>
            if let lastPresentationOptions {
                // <+540>
                if _SemanticFeature<Semantics_v6>.isEnabled {
                    // <+612>
                    resolved = lastPresentationOptions.sizing ?? .automatic
                } else {
                    // <+672>
                    resolved = nil
                }
            } else {
                // <+656>
                resolved = nil
            }
        }
        
        // <+740>
        // x29 - 0x90
        guard let resolved else {
            return
        }
        
        // <+748>
        // x26
        guard let presenting = presenter ?? self.presentingViewController else {
            return
        }
        
        // <+816>
        guard self.sizingOptions.isEmpty else {
            return
        }
        
        // <+908>
        guard
            let sheetPresentationController,
            sheetPresentationController.presentationStyle == .formSheet
        else {
            return
        }
        
        // <+952>
        if
            let lastPresentationOptions,
            lastPresentationOptions.useFormSheetSPISizing
        {
            return
        }
        
        // <+1004>
        let interfaceIdiom = self.traitCollection.userInterfaceIdiom.idiom ?? _GraphInputs.defaultInterfaceIdiom
        
        // <+1180>
        let presenter = presenting.nonPresentedAncestor.view!
        let navigationColumnCount = self.lastColumnCount
        
        var environment: EnvironmentValues
        let traitCollection = self.traitCollection
        if
            let wrapper = traitCollection._environmentWrapper,
            let casted = wrapper as? EnvironmentWrapper
        {
            environment = casted.environment
        } else {
            environment = EnvironmentValues()
            environment.configureForRoot()
            environment.configureForPlatform(traitCollection: traitCollection)
        }
        
        let readableWidth = environment.readableWidth
        
        let context = PresentationSizingContext(
            presenter: presenter,
            navigationColumnCount: navigationColumnCount,
            currentSize: nil,
            sidebarColumnWidth: nil,
            contentColumnWidth: nil,
            interfaceIdiom: interfaceIdiom,
            readableWidth: readableWidth
        )
        
        let sizing = SheetSizing(
            presentationSizing: resolved,
            sizeContext: context
        )
        
        let sheetSize = sizing.sheetSizeThatFits(
            host: self.host,
            subview: PresentationSizingRoot(host: self.host)
        )
        
        self.preferredContentSize = sheetSize
        
        // <+1856>
        guard self.isDelayingRemotePresentation else {
            return
        }
        
        let proposedSize = resolved.proposedSize(
            for: PresentationSizingRoot(host: self.host),
            context: context
        )
        
        guard
            let width = proposedSize.width,
            let height = proposedSize.height
        else {
            return
        }
        
        self.preferredContentSize = CGSize(width: width, height: height)
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

extension UIViewController {
    fileprivate var nonPresentedAncestor: UIViewController {
        // x19
        var viewController = self
        
        while
            let presenting = viewController.presentingViewController,
            presenting.view.window != nil
        {
            viewController = presenting
        }
        
        // <+132>
        while
            let parent = viewController.parent,
            parent.view.window != nil
        {
            viewController = parent
        }
        
        return viewController
    }
}

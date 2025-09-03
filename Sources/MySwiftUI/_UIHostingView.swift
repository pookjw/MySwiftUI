#warning("TODO")

public import UIKit
@_spi(Internal) public import MySwiftUICore
private import _UIKitShims
private import _UIKitPrivate

open class _UIHostingView<Content: View>: UIView {
    public var rootView: Content {
        _rootView
    }
    
    private var _rootView: Content
    private let _base: UIHostingViewBase
    private var isBaseConfigured: Bool = false
    private let eventBindingManager: EventBindingManager = EventBindingManager()
    private var allowUIKitAnimations: Int32 = 0
    private var disabledBackgroundColor: Bool = false
    private var allowFrameChanges: Bool = true
    private var isInSizeTransition: Bool = false
    private var transparentBackgroundReasons: HostingViewTransparentBackgroundReason = []
    private var keyboardFrame: CGRect? = nil
    private var keyboardSeed: UInt32 = 0
    private var keyboardScreen: MyUIScreen? = nil
    private var keyboardAnimation: Animation? = nil
    private weak var viewController: UIHostingController<Content>? = nil
    private var currentEvent: UIEvent? = nil
    private var eventBridge: UIKitEventBindingBridge
    private var dumpLayerNotificationTokens: Int32? = nil
    private var colorAppearanceSeed: UInt32 = 0
    private var colorScheme: ColorScheme? = .light
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
    private lazy var sheetBridge: SheetBridge<SheetPreference.Key>?? = {
        fatalError("TODO")
    }()
    private var focusBridge: FocusBridge = FocusBridge()
    private let dragBridge: DragAndDropBridge = DragAndDropBridge()
    private var inspectorBridge: UIKitInspectorBridgeV3? = nil
    private var tooltipBridge: TooltipBridge = TooltipBridge()
    private var editMenuBridge: EditMenuBridge = EditMenuBridge()
    private var sharingActivityPickerBridge: SharingActivityPickerBridge? = nil
    private var shareConfigurationBridge: ShareConfigurationBridge? = nil
    private var statusBarBridge: UIKitStatusBarBridge = UIKitStatusBarBridge()
    private weak var sceneBridge: SceneBridge? = nil
    private var scenePresentationBridge: ScenePresentationBridge? = nil
    private var pointerBridge: PointerBridge? = nil
    private var feedbackBridge: UIKitFeedbackGeneratorBridge<Content>? = nil
    private let mruiPreferenceExporter: MRUIPreferenceExporter = MRUIPreferenceExporter()
    private var renderingMarginsBridge: RenderingMarginsBridge<Content>? = nil
    private var objectManipluateBridge: UIKitObjectManipulationBridge<Content> = UIKitObjectManipulationBridge()
    private var remoteSessionController: RemoteScenes.SessionController? = nil
    private lazy var feedbackCache: UIKitSensoryFeedbackCache? = nil
    private var contextMenuBridge: ContextMenuBridge = ContextMenuBridge()
    private var interactiveResizeBridge: InteractiveResizeBridge = InteractiveResizeBridge()
    private var shouldUpdateAccessibilityFocus: Bool = false
    private let largeContentViewerInteractionBridge: UILargeContentViewerInteractionBridge = UILargeContentViewerInteractionBridge()
    private lazy var presentationModeLocation: LocationBox<UIKitPresentationModeLocation<Content>>? = nil
    private lazy var scenePresentationModeLocation: LocationBox<UIKitScenePresentationModeLocation<Content>>? = nil
    private var sceneSize: CGSize = .zero
    private var _boundsDepth: CGFloat = 0
    private var scrollTest: ScrollTest? = nil
    private weak var delegate: UIHostingViewDelegate? = nil
    private var rootViewDelegate: RootViewDelegate? = nil
    private var focusedValues: FocusedValues = FocusedValues()
    private var disallowAnimations: Bool = false
    private weak var windowGeometryScene: UIWindowScene? = nil
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
    private lazy var foreignSubviews: NSHashTable<UIView>? = nil
    private var insertingManagedSubviews: Int = 0
    
    public required init(rootView: Content) {
        Update.begin()
        PlatformColorDefinition.setInternalDefinition(UIKitPlatformColorDefinition.self, system: .uiKit)
        PlatformScrollEdgeEffectTagDefinition.setDefinition(ScrollEdgeEffectTagModifierDefinition.self)
        let viewDefinition = PlatformViewDefinition.for(UIView.self)!
        let viewGraphHost = ViewGraphHost(rootViewType: Content.self, outputs: .defaults, viewDefinition: viewDefinition)
        let viewGraph = viewGraphHost.viewGraph
        
        var configuration = UIHostingViewBase.Configuration()
        configuration.options.insert(.allowKeyboardSafeArea)
        
        if !Geometry3DEffectImpl._affectsLayout {
            configuration.options.insert(.allowUnregisteredGeometryChanges)
        }
        
        self._base = UIHostingViewBase(viewGraph: viewGraphHost, configuration: configuration)
        let focusViewGraph = FocusViewGraph(graph: viewGraph)
        viewGraph.append(feature: focusViewGraph)
        // <+3864>
        
        fatalError("TODO")
    }
    
    public required init?(coder: NSCoder) {
        fatalError("TODO")
    }
}

protocol UIHostingViewDelegate: AnyObject {
    
}

// SwiftUI에서 Geometry3DEffect를 conform하는 Type이 존재하지 않음
fileprivate struct Geometry3DEffectImpl: Geometry3DEffect {}

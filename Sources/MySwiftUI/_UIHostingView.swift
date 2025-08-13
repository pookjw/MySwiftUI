#warning("TODO")

public import UIKit
public import MySwiftUICore
private import _UIKitShims
private import _UIKitPrivate

open class _UIHostingView<Content: View>: UIView {
    public var rootView: Content {
        _rootView
    }
    
    private var _rootView: Content
    private let _base: UIHostingViewBase
    private var isBaseConfigured: Bool
    private let eventBindingManager: EventBindingManager
    private var allowUIKitAnimations: Int32
    private var disabledBackgroundColor: Bool
    private var allowFrameChanges: Bool
    private var isInSizeTransition: Bool
    private var transparentBackgroundReasons: HostingViewTransparentBackgroundReason
    private var keyboardFrame: CGRect?
    private var keyboardSeed: UInt32
    private var keyboardScreen: MyUIScreen?
    private var keyboardAnimation: Animation?
    private weak var viewController: UIHostingController<Content>?
    private var currentEvent: UIEvent?
    private var eventBridge: UIKitEventBindingBridge
    private var dumpLayerNotificationTokens: Int32?
    private var colorAppearanceSeed: UInt32
    private var colorScheme: ColorScheme?
    private let deprecatedAlertBridge: DeprecatedAlertBridge<Alert.Presentation>
    private let deprecatedActionSheetBridge: DeprecatedAlertBridge<ActionSheet.Presentation>
//    private lazy var sheetBridge: SheetBridge<SheetPreference.Key>??
    private var focusBridge: FocusBridge
    private let dragBridge: DragAndDropBridge
    private var inspectorBridge: UIKitInspectorBridgeV3?
    private var tooltipBridge: TooltipBridge
    private var editMenuBridge: EditMenuBridge
    private var sharingActivityPickerBridge: SharingActivityPickerBridge?
    private var shareConfigurationBridge: ShareConfigurationBridge?
    private var statusBarBridge: UIKitStatusBarBridge
    private weak var sceneBridge: SceneBridge?
    private var scenePresentationBridge: ScenePresentationBridge?
    private var pointerBridge: PointerBridge?
    private var feedbackBridge: UIKitFeedbackGeneratorBridge<Content>?
    private let mruiPreferenceExporter: MRUIPreferenceExporter
    private var renderingMarginsBridge: RenderingMarginsBridge<Content>?
    private var objectManipluateBridge: UIKitObjectManipulationBridge<Content>
    private var remoteSessionController: RemoteScenes.SessionController?
//    private lazy var feedbackCache: UIKitSensoryFeedbackCache?
    private var contextMenuBridge: ContextMenuBridge
    private var interactiveResizeBridge: InteractiveResizeBridge
    private var shouldUpdateAccessibilityFocus: Bool
    private let largeContentViewerInteractionBridge: UILargeContentViewerInteractionBridge
//    private lazy var presentationModeLocation: LocationBox<UIKitPresentationModeLocation<Content>>?
//    private lazy var scenePresentationModeLocation: LocationBox<UIKitScenePresentationModeLocation<Content>>?
    private var sceneSize: CGSize
    private var _boundsDepth: CGFloat
    private var scrollTest: ScrollTest?
    private weak var delegate: UIHostingViewDelegate?
    private var rootViewDelegate: RootViewDelegate?
    private var focusedValues: FocusedValues
    private var disallowAnimations: Bool
    private weak var windowGeometryScene: UIWindowScene?
    private var invalidatesIntrinsicContentSizeOnIdealSizeChange: Bool
    private var appliesContainerBackgroundColor: Bool
    private var containerBackgroundColor: UIColor?
    private let surpressGraphUpdateIfNotInHierarchy: Bool
//    private lazy var foreignSubviews: NSHashTable<UIView>?
    private var insertingManagedSubviews: Int
    
    public required init(rootView: Content) {
        print(MemoryLayout<_UIHostingView>.offset(of: \._base))
        fatalError("TODO")
    }
    
    public required init?(coder: NSCoder) {
        fatalError("TODO")
    }
}

protocol UIHostingViewDelegate: AnyObject {
    
}

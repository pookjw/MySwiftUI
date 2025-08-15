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
        fatalError("TODO")
    }
    
    public required init?(coder: NSCoder) {
        fatalError("TODO")
    }
}

protocol UIHostingViewDelegate: AnyObject {
    
}

/*
 _rootView
 208
 _base
 208
 isBaseConfigured
 210
 eventBindingManager
 218
 allowUIKitAnimations
 220
 disabledBackgroundColor
 224
 allowFrameChanges
 225
 isInSizeTransition
 226
 transparentBackgroundReasons
 228
 explicitSafeAreaInsets
 230
 keyboardFrame
 258
 keyboardSeed
 27c
 keyboardScreen
 280
 keyboardAnimation
 288
 viewController
 290
 currentEvent
 298
 eventBridge
 2a0
 dumpLayerNotificationTokens
 2a8
 colorAppearanceSeed
 2b4
 colorScheme
 2b8
 deprecatedAlertBridge
 2c0
 deprecatedActionSheetBridge
 2c8
 $__lazy_storage_$_sheetBridge
 2d0
 focusBridge
 2d8
 dragBridge
 2e0
 inspectorBridge
 2e8
 tooltipBridge
 2f0
 editMenuBridge
 2f8
 sharingActivityPickerBridge
 300
 shareConfigurationBridge
 308
 statusBarBridge
 310
 sceneBridge
 318
 scenePresentationBridge
 320
 pointerBridge
 328
 feedbackBridge
 330
 mruiPreferenceExporter
 338
 renderingMarginsBridge
 340
 objectManipluateBridge
 348
 remoteSessionController
 350
 $__lazy_storage_$_feedbackCache
 358
 contextMenuBridge
 360
 interactiveResizeBridge
 368
 shouldUpdateAccessibilityFocus
 370
 largeContentViewerInteractionBridge
 378
 $__lazy_storage_$_presentationModeLocation
 380
 $__lazy_storage_$_scenePresentationModeLocation
 388
 sceneSize
 390
 _boundsDepth
 3a0
 scrollTest
 3a8
 delegate
 3b0
 rootViewDelegate
 3c0
 focusedValues
 3c8
 disallowAnimations
 3e8
 windowGeometryScene
 3f0
 invalidatesIntrinsicContentSizeOnIdealSizeChange
 3f8
 appliesContainerBackgroundColor
 3f9
 containerBackgroundColor
 400
 surpressGraphUpdateIfNotInHierarchy
 408
 $__lazy_storage_$_foreignSubviews
 410
 insertingManagedSubviews
 418
 */

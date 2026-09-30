// 57D99A1BF35446A09F91A1066009F644
@_spi(Internal) public import MySwiftUICore
public import UIKit
private import _UIKitPrivate

@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIHostingConfiguration<Content, Background> : UIContentConfiguration where Content : View, Background : View {
    fileprivate private(set) var rootView: Content
    private var backgroundView: Background
    fileprivate private(set) var storage = UIHostingConfigurationStorage()
    
    fileprivate init(rootView: Content, backgroundView: Background, storage: UIHostingConfigurationStorage) {
        self.rootView = rootView
        self.backgroundView = backgroundView
        self.storage = storage
    }
    
    public func background<B>(@ViewBuilder content: () -> B) -> UIHostingConfiguration<Content, B> where B : View {
        assertUnimplemented()
    }
    
    public func background<S>(_ style: S) -> UIHostingConfiguration<Content, _UIHostingConfigurationBackgroundView<S>> where S : ShapeStyle {
        assertUnimplemented()
    }
    
    public func margins(_ edges: Edge.Set = .all, _ length: CoreFoundation.CGFloat) -> UIHostingConfiguration<Content, Background> {
        assertUnimplemented()
    }
    
    public func margins(_ edges: Edge.Set = .all, _ insets: EdgeInsets) -> UIHostingConfiguration<Content, Background> {
        assertUnimplemented()
    }
    
    public func minSize(width: CoreFoundation.CGFloat? = nil, height: CoreFoundation.CGFloat? = nil) -> UIHostingConfiguration<Content, Background> {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Please pass one or more parameters.")
    @_alwaysEmitIntoClient public func minSize() -> UIHostingConfiguration<Content, Background> {
        self
    }
    
    @MainActor public func makeContentView() -> any UIView & UIContentView {
        if self.storage.createsUIInteractions {
            return UIHostingContentView(configuration: self)
        } else {
            return UIHostingContentViewWithoutInteractions(configuration: self)
        }
    }
    
    public func updated(for state: any UIConfigurationState) -> UIHostingConfiguration<Content, Background> {
        var copy = self
        copy.storage.lastState = (state as? UICellConfigurationState)
        return copy
    }
}

@available(*, unavailable)
extension UIHostingConfiguration : Sendable {
}

@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension UIHostingConfiguration where Background == EmptyView {
    public init(@ViewBuilder content: () -> Content) {
        self.init(
            rootView: content(),
            backgroundView: EmptyView(),
            storage: UIHostingConfigurationStorage()
        )
        
        self.storage.wantsBackground = false
    }
}

@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct _UIHostingConfigurationBackgroundView<Style> : View where Style : ShapeStyle {
    @MainActor @preconcurrency public var body: some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _UIHostingConfigurationBackgroundView : Sendable {
}

struct IsInHostingConfiguration : ViewInputBoolFlag {}

fileprivate struct UIHostingConfigurationStorage {
    var wantsBackground: Bool = true // 0x0
    private(set) var margins = OptionalEdgeInsets() // 0x14 (offset field)
    private(set) var _minSize: (CGFloat?, CGFloat?) = (nil, nil) // 0x18 (offset field)
    private(set) var createsUIInteractions: Bool = true // 0x1c (offset field)
    private var disablesAnimatedSizeInvalidation: Bool = false // 0x20 (offset field)
    var lastState: UICellConfigurationState? = nil // 0x24 (offset field)
    private(set) var wantsPlatformItemList: Bool = false // 0x28 (offset field)
    private weak var delegate: (any UIHostingViewDelegate)? = nil // 0x2c (offset field)
}

fileprivate final class UIHostingContentViewWithoutInteractions<Content : View, Background : View> : UIHostingContentView<Content, Background> {
}

fileprivate class UIHostingContentView<Content : View, Background : View> : _UIHostingView<ModifiedContent<Content, HostingContentViewRootModifier>>, _UIContentViewContainerBackgroundViewProviding, _UIContentViewContainerDisplayTracking, _UIContentViewSwipeActionsConfigurationProviding, _UIContentViewSeparatorInsetProviding, _UIContentViewPopupMenuButtonProviding, _UIContentViewDefaultStylingObtaining, _UIContentViewHoverStyleProviding {
    private var listEnvironment: UIListEnvironment = .none {
        didSet {
            assertUnimplemented()
        }
    }
    
    private var _configuration: UIHostingConfiguration<Content, Background> {
        didSet {
            assertUnimplemented()
        }
    }
    
    var _containerBackgroundViewDidChangeHandler: (() -> Void)? = nil
    private var backgroundHost: _UIHostingView<Background>? = nil
    
    private var _defaultListContentConfigurationProvider: (() -> UIListContentConfiguration?)? = nil {
        didSet {
            updateHostedViews()
        }
    }
    
    var _popupMenuButtonDidChangeHandler: (() -> Void)? = nil
    private var popUpButton: WeakBox<UIButton>? = nil
    private var popUpButtonSeed = VersionSeedTracker<BridgedPopUpButtonPreferenceKey>(seed: .invalid)
    private var lastObservedSize: _ProposedSize? = nil
    private var lastSizeThatFits: CGSize? = nil
    private var hasBeenVisible: Bool = false
    var _preferredContainerHoverStyleDidChangeHandler: (() -> Void)? = nil
    
    private var hoverEffectConfiguration: ListRowHoverEffectConfiguration? = nil {
        didSet {
            assertUnimplemented()
        }
    }
    
    var _preferredSeparatorInsetsDidChangeHandler: (() -> Void)? = nil
    
    init(configuration: UIHostingConfiguration<Content, Background>) {
        // <+748>
        PlatformColorDefinition.setInternalDefinition(UIKitPlatformColorDefinition.self, system: .uiKit)
        PlatformItemsDefinition.setDefinition(UIKitPlatformItemsDefinition.self, system: .uiKit)
        
        // <+844>
        self._configuration = configuration
        
        let rootView = configuration
            .rootView
            .modifier(
                HostingContentViewRootModifier(
                    defaultStyling: ListContentStyling(
                        insets: .zero,
                        minHeight: 0,
                        font: nil,
                        foregroundStyle: nil,
                        isUppercase: false,
                        labelIconToTitleSpacing: 10,
                        tint: nil
                    ),
                    margins: configuration.storage.margins,
                    minSize: configuration.storage._minSize,
                    listEnvironment: .none,
                    configurationState: nil
                )
            )
        
        super.init(rootView: rootView)
        
        // <+1224>
        if configuration.storage.wantsPlatformItemList {
            self.viewGraph.requestedOutputs.insert(.platformItemList)
        }
        
        // <+1360>
        self.updateHostedViews()
        
        Update.ensure { 
            // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC13configurationADyxq_GAA0C13ConfigurationVyxq_G_tcfcyyXEfU_TA
            self.viewGraph.addPreference(BridgedPopUpButtonPreferenceKey.self)
            self.viewGraph.addPreference(ListRowHoverEffectPreferenceKey.self)
            self.viewGraph.addPreference(DefaultListRowHoverEffectPreferenceKey.self)
            self.viewGraph.addPreference(ListRowHoverEffectDisabledPreferenceKey.self)
            self.viewGraph.addPreference(UsesPreferenceBasedListRowHoverEffectsKey.self)
            self.viewGraph.append(feature: SwipeActions.Feature())
        }
        
        self.delegate = self
        self.preservesSuperviewLayoutMargins = true
        
        self.registerForTraitChanges([UITraitUserInterfaceStyle.self], action: #selector(setNeedsLayout))
    }
    
    required init(rootView: ModifiedContent<Content, HostingContentViewRootModifier>) {
        preconditionFailure()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var bounds: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var frame: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    func _containerViewIsHidden(forReuse hidden: Bool) {
        assertUnimplemented()
    }
    
    func _preferredLeadingSeparatorInset() -> CGFloat {
        assertUnimplemented()
    }
    
    var _containerBackgroundView: UIView? {
        assertUnimplemented()
    }
    
    func _defaultListContentConfigurationMayHaveChanged() {
        assertUnimplemented()
    }
    
    func _leadingSwipeActionsConfiguration() -> UISwipeActionsConfiguration? {
        assertUnimplemented()
    }
    
    var _popupMenuButton: UIButton? {
        assertUnimplemented()
    }
    
    func _preferredContainerHoverStyle() -> UIHoverStyle? {
        assertUnimplemented()
    }
    
    func _preferredTrailingSeparatorInset() -> CGFloat {
        assertUnimplemented()
    }
    
    func _trailingSwipeActionsConfiguration() -> UISwipeActionsConfiguration? {
        assertUnimplemented()
    }
    
    override func layoutMarginsDidChange() {
        assertUnimplemented()
    }
    
    override func layoutSubviews() {
        assertUnimplemented()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        assertUnimplemented()
    }
    
    func appendViewGraphFeatures() {
        assertUnimplemented()
    }
    
    func defaultStyling() -> ListContentStyling {
        assertUnimplemented()
    }
    
    func makeRootView() -> ModifiedContent<Content, HostingContentViewRootModifier> {
        assertUnimplemented()
    }
    
    func updateHostedViews() {
        assertUnimplemented()
    }
    
    func updateBackgroundHostIfNeeded(_: (() -> Void)?) {
        assertUnimplemented()
    }
    
    func makeBackgroundHost() -> UIHostingBackgroundView<Background> {
        assertUnimplemented()
    }
    
    func setupSizeInvalidationHandler(_: _ProposedSize) {
        assertUnimplemented()
    }
    
    func roundSize(_: CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    func updateViewGraphForDisplay(isHidden: Bool) {
        assertUnimplemented()
    }
}

fileprivate final class UIHostingBackgroundView<Background : View> : _UIHostingView<Background> {
    override var frame: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override var bounds: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension UIHostingContentView : PlatformContentViewHoverStyleProviding {
}

extension UIHostingContentView : UIHostingViewDelegate {
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didMoveTo window: UIWindow?) {
        assertUnimplemented()
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, willUpdate environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didUpdate environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, willUpdate properties: inout ViewGraphBridgeProperties) {
        assertUnimplemented()
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didChangePreferences preferences: PreferenceValues) {
        assertUnimplemented()
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didChangePlatformItemList list: PlatformItemList) {
        assertUnimplemented()
    }
    
    func hostingView<T : View>(_ T: _UIHostingView<T>, willModifyViewInputs inputs: inout _ViewInputs) {
        assertUnimplemented()
    }
}

extension UIHostingContentView : UIContentView {
    var configuration: UIContentConfiguration {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

fileprivate struct HostingContentViewRootModifier : UnaryViewModifier {
    private(set) var defaultStyling: ListContentStyling
    private(set) var margins: OptionalEdgeInsets
    private(set) var minSize: (CGFloat?, CGFloat?)
    private(set) var listEnvironment: UIListEnvironment
    private(set) var configurationState: UICellConfigurationState?
    
    var effectivePadding: EdgeInsets {
        assertUnimplemented()
    }
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}

struct BridgedPopUpButtonPreferenceKey : HostPreferenceKey {
    static let defaultValue: WeakBox<UIButton>? = nil
    
    static func reduce(value: inout WeakBox<UIButton>?, nextValue: () -> WeakBox<UIButton>?) {
        assertUnimplemented()
    }
}

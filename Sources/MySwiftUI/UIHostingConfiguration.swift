// 57D99A1BF35446A09F91A1066009F644
@_spi(Internal) public import MySwiftUICore
public import UIKit
private import _UIKitPrivate
private import UIFoundation
internal import AttributeGraph

@available(iOS 16.0, tvOS 16.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIHostingConfiguration<Content, Background> : UIContentConfiguration where Content : View, Background : View {
    fileprivate private(set) var rootView: Content
    fileprivate private(set) var backgroundView: Background
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
    
    var delegate: (any UIHostingViewDelegate)? {
        return self.storage.delegate
    }
    
    func animatedSizeInvalidationDisabled() -> UIHostingConfiguration<Content, Background> {
        assertUnimplemented()
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
    private(set) var disablesAnimatedSizeInvalidation: Bool = false // 0x20 (offset field)
    var lastState: UICellConfigurationState? = nil // 0x24 (offset field)
    private(set) var wantsPlatformItemList: Bool = false // 0x28 (offset field)
    private(set) weak var delegate: (any UIHostingViewDelegate)? = nil // 0x2c (offset field)
}

fileprivate final class UIHostingContentViewWithoutInteractions<Content : View, Background : View> : UIHostingContentView<Content, Background> {
}

fileprivate class UIHostingContentView<Content : View, Background : View> : _UIHostingView<ModifiedContent<Content, HostingContentViewRootModifier>>, _UIContentViewContainerBackgroundViewProviding, _UIContentViewContainerDisplayTracking, _UIContentViewSwipeActionsConfigurationProviding, _UIContentViewSeparatorInsetProviding, _UIContentViewPopupMenuButtonProviding, _UIContentViewDefaultStylingObtaining, _UIContentViewHoverStyleProviding {
    private var listEnvironment: UIListEnvironment = .none {
        didSet {
            guard oldValue != self.listEnvironment else {
                return
            }
            
            if let graph = unsafe self.viewGraph[HostingContentViewGraph.self] {
                unsafe graph.pointee.listEnvironment = self.listEnvironment
            }
            
            guard self.viewGraph.isInstantiated else {
                return
            }
            
            Update.ensure {
                // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC15listEnvironmentSo06UIListN0VvWyyXEfU_TA
                self.viewGraph.uninstantiate()
            }
        }
    }
    
    private var _configuration: UIHostingConfiguration<Content, Background> {
        didSet {
            // self -> x20 -> x24
            guard oldValue.storage.lastState != self._configuration.storage.lastState else {
                // <+1416>
                self.updateHostedViews()
                return
            }
           
            // <+988>
            self.invalidateProperties([.environment], mayDeferUpdate: true)
            
            guard let backgroundHost else {
                // <+1416>
                self.updateHostedViews()
                return
            }
            
            backgroundHost.invalidateProperties([.environment], mayDeferUpdate: true)
            
            // <+1416>
            self.updateHostedViews()
        }
    }
    
    final var _containerBackgroundViewDidChangeHandler: (() -> Void)? = nil
    private var backgroundHost: _UIHostingView<Background>? = nil
    
    final var _defaultListContentConfigurationProvider: (() -> __UIListContentConfiguration?)? = nil {
        didSet {
            updateHostedViews()
        }
    }
    
    final var _popupMenuButtonDidChangeHandler: (() -> Void)? = nil
    private var popUpButton: WeakBox<UIButton>? = nil
    private var popUpButtonSeed = VersionSeedTracker<BridgedPopUpButtonPreferenceKey>(seed: .invalid)
    private var lastObservedSize: _ProposedSize? = nil
    private var lastSizeThatFits: CGSize? = nil
    private var hasBeenVisible: Bool = false
    final var _preferredContainerHoverStyleDidChangeHandler: (() -> Void)? = nil
    
    private var hoverEffectConfiguration: ListRowHoverEffectConfiguration? = nil {
        didSet {
            /*
             self -> x20
             oldValue -> x0 -> x29 - 0x70
             */
            // <+240>
            if
                !(self.hoverEffectConfiguration == oldValue),
                let handler = self._preferredContainerHoverStyleDidChangeHandler
            {
                handler()
            }
        }
    }
    
    final var _preferredSeparatorInsetsDidChangeHandler: (() -> Void)? = nil
    
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
        fatalError()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override final var bounds: CGRect {
        didSet {
            if oldValue.size != self.bounds.size {
                self.base.allowUIKitAnimationsForNextUpdate = true
            }
        }
    }
    
    override final var frame: CGRect {
        get {
            return super.frame
        }
        set {
            let oldBounds = self.bounds
            super.frame = newValue
            let newBounds = self.bounds
            
            if oldBounds.size != newBounds.size {
                self.base.allowUIKitAnimationsForNextUpdate = true
            }
        }
    }
    
    final func _containerViewIsHidden(forReuse hidden: Bool) {
        self.updateViewGraphForDisplay(isHidden: hidden)
    }
    
    func _preferredLeadingSeparatorInset() -> CGFloat {
        assertUnimplemented()
    }
    
    final var _containerBackgroundView: UIView? {
        self.updateBackgroundHostIfNeeded(nil)
        return self.backgroundHost
    }
    
    final func _defaultListContentConfigurationMayHaveChanged() {
        self.updateHostedViews()
    }
    
    final func _leadingSwipeActionsConfiguration() -> UISwipeActionsConfiguration? {
        // inlined
        guard let actions = self.viewGraph.swipeActions() else {
            return nil
        }
        
        // <+384>
        guard let configuration = actions.leading else {
            return nil
        }
        
        let result = UISwipeActionsConfiguration(
            configuration: configuration,
            graphHost: nil,
            performDestructiveAction: { handler in
                // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC33_leadingSwipeActionsConfigurationSo07UISwipeoP0CSgyFAgA0nO0O0P0VXEfU_yySbccfU_
                handler(true)
            }
        )
        
        return result
    }
    
    final var _popupMenuButton: UIButton? {
        if let popUpButton {
            return popUpButton.base
        } else {
            return nil
        }
    }
    
    final func _preferredContainerHoverStyle() -> UIHoverStyle? {
        guard let hoverEffectConfiguration else {
            return nil
        }
        
        return hoverEffectConfiguration.hoverStyle
    }
    
    func _preferredTrailingSeparatorInset() -> CGFloat {
        assertUnimplemented()
    }
    
    final func _trailingSwipeActionsConfiguration() -> UISwipeActionsConfiguration? {
        // inlined
        guard let actions = self.viewGraph.swipeActions() else {
            return nil
        }
        
        // <+404>
        guard let configuration = actions.trailing else {
            return nil
        }
        
        let block: (SwipeActions.Configuration) -> UISwipeActionsConfiguration? = { configuration in
            // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC34_trailingSwipeActionsConfigurationSo07UISwipeoP0CSgyFAgA0nO0O0P0VXEfU_
            return UISwipeActionsConfiguration(
                configuration: configuration,
                graphHost: self.viewGraph,
                performDestructiveAction: { [weak self = self] handler in
                    // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC34_trailingSwipeActionsConfigurationSo07UISwipeoP0CSgyFAgA0nO0O0P0VXEfU_yySbccfU_TA
                    guard self != nil else {
                        handler(false)
                        return
                    }
                    
                    guard let resultToken = configuration.resultToken else {
                        handler(true)
                        return
                    }
                    
                    resultToken.wrappedValue = SwipeActionResultToken(
                        role: .destructive,
                        completion: handler,
                        performDestructiveAction: nil
                    )
                }
            )
        }
        
        return block(configuration)!
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        
        self.base.allowUIKitAnimationsForNextUpdate = true
        
        if let backgroundHost {
            backgroundHost.base.allowUIKitAnimationsForNextUpdate = true
        }
        
        self.updateHostedViews()
    }
    
    override final func layoutSubviews() {
        super.layoutSubviews()
        
        if let handler = self._preferredSeparatorInsetsDidChangeHandler {
            handler()
        }
    }
    
    override final func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
        var size = _ProposedSize(width: nil, height: nil)
        
        if horizontalFittingPriority == .required {
            size.width = targetSize.width
        }
        
        if verticalFittingPriority == .required {
            size.height = targetSize.height
        }
        
        // <+216>
        self.setupSizeInvalidationHandler(size)
        
        let sizeThatFits = self.sizeThatFits(size)
        let rounded = self.roundSize(sizeThatFits)
        
        self.lastSizeThatFits = rounded
        return rounded
    }
    
    func appendViewGraphFeatures() {
        assertUnimplemented()
    }
    
    final func defaultStyling() -> ListContentStyling {
        var insets = EdgeInsets.zero
        let minHeight: CGFloat
        let font: Font?
        let foregroundStyle: Color?
        let isUppercase: Bool
        let labelIconToTitleSpacing: CGFloat
        let tint: ListItemTint?
        
        var margins: NSDirectionalEdgeInsets
        if
            let provider = self._defaultListContentConfigurationProvider,
            let configuration = provider()
        {
            // <+340>
            margins = configuration.directionalLayoutMargins
            let otherMargins = self.directionalLayoutMargins
            if !(otherMargins.leading <= margins.leading) {
                margins.leading = otherMargins.leading
            }
            if !(otherMargins.trailing <= margins.trailing) {
                margins.trailing = otherMargins.trailing
            }
            
            let textProperties = configuration.textProperties
            
            if let adjustedFont = unsafe textProperties
                .font
                ._fontAdjustedForContentSizeCategory(compatibleWith: self.traitCollection)
            {
                font = unsafe Font(adjustedFont.takeUnretainedValue())
            } else {
                font = nil
            }
            
            // <+564>
            foregroundStyle = Color(
                _platformColor: textProperties.resolvedColor(),
                definition: UIKitPlatformColorDefinition.self
            )
            
            minHeight = configuration._minimumHeight(for: self.traitCollection)
            isUppercase = textProperties.transform == .uppercase
            labelIconToTitleSpacing = configuration.imageToTextPadding
            
            if let tintColor = configuration.imageProperties.tintColor {
                tint = .fixed(
                    Color(
                        _platformColor: tintColor,
                        definition: UIKitPlatformColorDefinition.self
                    )
                )
            } else {
                tint = nil
            }
        } else {
            // <+504>
            margins = self.directionalLayoutMargins
            minHeight = 0
            font = nil
            foregroundStyle = nil
            isUppercase = false
            labelIconToTitleSpacing = 10
            tint = nil
        }
        
        insets = EdgeInsets(
            top: margins.top,
            leading: margins.leading,
            bottom: margins.bottom,
            trailing: margins.trailing
        )

        // <+808>
        if isLinkedOnOrAfter(.v5) && self.insetsLayoutMarginsFromSafeArea {
            // <+832>
            // x19 + 0x8, d14, x19, d15
            let safeAreaInsets = self.safeAreaInsets
            let layoutDirection = LayoutDirection(self.traitCollection.layoutDirection) ?? .leftToRight
            let directionalSafeAreaInsets: EdgeInsets
            
            if layoutDirection == .leftToRight {
                directionalSafeAreaInsets = EdgeInsets(
                    top: safeAreaInsets.top,
                    leading: safeAreaInsets.left,
                    bottom: safeAreaInsets.bottom,
                    trailing: safeAreaInsets.right
                )
            } else {
                directionalSafeAreaInsets = EdgeInsets(
                    top: safeAreaInsets.top,
                    leading: safeAreaInsets.right,
                    bottom: safeAreaInsets.bottom,
                    trailing: safeAreaInsets.left
                )
            }
            
            insets = directionalSafeAreaInsets.negatedInsets.adding(insets)
        }
        
        return ListContentStyling(
            insets: insets,
            minHeight: minHeight,
            font: font,
            foregroundStyle: foregroundStyle,
            isUppercase: isUppercase,
            labelIconToTitleSpacing: labelIconToTitleSpacing,
            tint: tint
        )
    }
    
    final func makeRootView() -> ModifiedContent<Content, HostingContentViewRootModifier> {
        return self._configuration.rootView
            .modifier(
                HostingContentViewRootModifier(
                    defaultStyling: self.defaultStyling(),
                    margins: self._configuration.storage.margins,
                    minSize: self._configuration.storage._minSize,
                    listEnvironment: self.listEnvironment,
                    configurationState: self._configuration.storage.lastState
                )
        )
    }
    
    final func updateHostedViews() {
        self.listEnvironment = self.traitCollection.listEnvironment
        self.rootView = self.makeRootView()
        
        if let handler = self._containerBackgroundViewDidChangeHandler {
            self.updateBackgroundHostIfNeeded(handler)
        }
    }
    
    final func updateBackgroundHostIfNeeded(_ handler: (() -> Void)?) {
        if self._configuration.storage.wantsBackground {
            // <+236>
            if let backgroundHost {
                // <+240>
                backgroundHost.rootView = self._configuration.backgroundView
            } else {
                // <+356>
                let backgroundHost = self.makeBackgroundHost()
                self.backgroundHost = backgroundHost
                
                if let handler {
                    handler()
                }
            }
        } else {
            // <+324>
            if self.backgroundHost != nil {
                self.backgroundHost = nil
                if let handler {
                    handler()
                }
            }
        }
    }
    
    func makeBackgroundHost() -> UIHostingBackgroundView<Background> {
        assertUnimplemented()
    }
    
    final func setupSizeInvalidationHandler(_ size: _ProposedSize) {
        /*
         self -> x20
         size -> x0 -> x26
         */
        // <+364>
        guard !(self.lastObservedSize == size) else {
            return
        }
        
        // <+856>
        self.lastObservedSize = size
        
        self.viewGraph.sizeThatFitsObservers.addObserver(for: size) { [weak self] lhs, rhs in
            // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC28setupSizeInvalidationHandleryyAA09_ProposedN0VFySo6CGSizeV_AItcfU_TA
            /*
             lhs -> x0 -> x23
             rhs -> x1 -> x22
             */
            let d8 = lhs.width
            let d9 = lhs.height
            var d10 = rhs.width
            var d11 = rhs.height
            
            guard let self else {
                return
            }
            
            var d0: CGFloat
            var d1: CGFloat
            
            do {
                let rounded = self.roundSize(CGSize(width: d10, height: d11))
                d0 = rounded.width
                d1 = rounded.height
            }
            
            d11 = d0
            d10 = d1
            self.lastSizeThatFits = CGSize(width: d0, height: d1)
            
            do {
                let invalidValue = CGSize.invalidValue
                d0 = invalidValue.width
                d1 = invalidValue.height
            }
            
            guard !((d8 == d0) && (d9 == d1)) else {
                return
            }
            
            do {
                let rounded = self.roundSize(CGSize(width: d8, height: d9))
                d0 = rounded.width
                d1 = rounded.height
            }
            
            guard !((d0 == d11) && (d1 == d10)) else {
                return
            }
            
            // <+252>
            if self._configuration.storage.disablesAnimatedSizeInvalidation {
                // <+308>
                UIView.performWithoutAnimation {
                    self.invalidateIntrinsicContentSize()
                }
            } else {
                // <+568>
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    final func roundSize(_ incoming: CGSize) -> CGSize {
        let d8 = incoming.height
        let d9 = incoming.width
        let d10 = self.viewGraph.environment.pixelLength
        var d0: CGFloat = 1
        var d1: CGFloat
        
        if d10 != d0 {
            // <+164>
            d0 = d9 / d10
            d0 = ceil(d0)
            d0 = d10 * d0
            d1 = d8 / d10
            d1 = ceil(d1)
            d1 = d10 * d1
        } else {
            d0 = ceil(d9)
            d1 = ceil(d8)
        }
        
        return CGSize(width: d0, height: d1)
    }
    
    final func updateViewGraphForDisplay(isHidden: Bool) {
        guard self.isHiddenForReuse != isHidden else {
            return
        }
        
        self.isHiddenForReuse = isHidden
        self.focusBridge.canAcceptFocus = !isHidden
        
        if !isHidden && self.hasBeenVisible && isLinkedOnOrAfter(.v6) {
            // <+344>
            Update.ensure { 
                // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC06updateE15GraphForDisplay8isHiddenySb_tFyyXEfU_TA
                self.viewGraph.incrementPhase()
            }
        }
        
        // <+412>
        self.invalidateProperties([.focusStore], mayDeferUpdate: true)
        
        if
            !isHidden,
            let lastObservedSize,
            let lastSizeThatFits
        {
            let sizeThatFits = self.sizeThatFits(lastObservedSize)
            let roundedSize = self.roundSize(sizeThatFits)
            
            if lastSizeThatFits != roundedSize {
                self.lastObservedSize = nil
                self.lastSizeThatFits = nil
                
                UIView.performWithoutAnimation {
                    // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC06updateE15GraphForDisplay8isHiddenySb_tFyyXEfU0_TA
                    self.invalidateIntrinsicContentSize()
                }
            }
            
            // <+1072>
        } else {
            // <+1072>
        }
        
        // <+1072>
        if let backgroundHost {
            backgroundHost.isHiddenForReuse = isHidden
        }
        
        if !isHidden {
            self.hasBeenVisible = true
        }
    }
    
    final func shouldEmitBridgedHoverStyle(for preferences: PreferenceValues) -> Bool {
        if preferences[ListRowHoverEffectPreferenceKey.self].value != nil {
            return true
        } else {
            return preferences[ListRowHoverEffectDisabledPreferenceKey.self].value
        }
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
        if let delegate = self._configuration.delegate {
            delegate.hostingView(hostingView, didMoveTo: window)
        }
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, willUpdate environment: inout EnvironmentValues) {
        /*
         self -> x20 -> x22
         hostingView -> x0 -> x21
         environment -> x1 -> x19
         */
        hostingView.focusBridge.canAcceptFocus = !self.isHiddenForReuse
        
        if let delegate = self._configuration.storage.delegate {
            delegate.hostingView(hostingView, willUpdate: &environment)
        }
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didUpdate environment: EnvironmentValues) {
        if let delegate = self._configuration.storage.delegate {
            delegate.hostingView(hostingView, didUpdate: environment)
        }
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, willUpdate properties: inout ViewGraphBridgeProperties) {
        if let delegate = self._configuration.storage.delegate {
            delegate.hostingView(hostingView, willUpdate: &properties)
        }
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didChangePreferences preferences: PreferenceValues) {
        /*
         self -> x20
         hostingView -> x0 -> x29 - 0xe8
         preferences -> x1 -> x28
         */
        // <+952>
        if let handler = self._popupMenuButtonDidChangeHandler {
            let currentSeed = self.popUpButtonSeed
            let value = preferences[BridgedPopUpButtonPreferenceKey.self]
            
            if !currentSeed.seed.matches(value.seed) {
                self.popUpButtonSeed = VersionSeedTracker(seed: value.seed)
                
                let block: ((WeakBox<UIButton>?) -> Void) = { button in
                    // $s7SwiftUI20UIHostingContentView33_57D99A1BF35446A09F91A1066009F644LLC07hostingE0_20didChangePreferencesyAA01_cE0Cyqd__G_AA16PreferenceValuesVtAA0E0Rd__lFyAA7WeakBoxVySo8UIButtonCGSgXEfU_
                    self.popUpButton = button
                    handler()
                }
                
                block(value.value)
            }
        }
        
        // <+1264>
        if self.shouldEmitBridgedHoverStyle(for: preferences) {
            // <+1296>
            var configuration: ListRowHoverEffectConfiguration
            if let _configuration = self.hoverEffectConfiguration {
                configuration = _configuration
            } else {
                // <+1392>
                configuration = ListRowHoverEffectConfiguration(
                    hoverStyle: nil,
                    isEnabled: true,
                    effect: SystemHoverEffect.Info(.automatic),
                    path: nil
                )
            }
            
            // <+1608>
            configuration.updateEffect(with: preferences)
            
            if
                let backgroundHost,
                hostingView == backgroundHost
            {
                // <+1740>
                configuration.path = preferences[ListRowHoverEffectContentShapeKey.self].value
                
                let uiShape: UIShape?
                if let shape = configuration.path {
                    // <+2008>
                    uiShape = UIShape(shape)
                } else {
                    uiShape = nil
                }
                
                // <+2152>
                let hoverStyle = UIHoverStyle.style(
                    for: configuration.effect,
                    shape: uiShape
                )
                
                hoverStyle.isEnabled = configuration.isEnabled
                configuration.hoverStyle = hoverStyle
            }
            
            // <+2292>
            self.hoverEffectConfiguration = configuration
            // <+2368>
        } else {
            // <+1560>
            self.hoverEffectConfiguration = nil
            // <+2368>
        }
        
        // <+2368>
        if let delegate = self._configuration.delegate {
            delegate.hostingView(hostingView, didChangePreferences: preferences)
        }
    }
    
    @MainActor func hostingView<T : View>(_ hostingView: _UIHostingView<T>, didChangePlatformItemList list: PlatformItemList) {
        if let delegate = self._configuration.storage.delegate {
            delegate.hostingView(hostingView, didChangePlatformItemList: list)
        }
    }
    
    func hostingView<T : View>(_ hostingView: _UIHostingView<T>, willModifyViewInputs inputs: inout _ViewInputs) {
        if let delegate = self._configuration.storage.delegate {
            delegate.hostingView(hostingView, willModifyViewInputs: &inputs)
        }
    }
}

extension UIHostingContentView : UIContentView {
    var configuration: any UIContentConfiguration {
        get {
            return self._configuration
        }
        set {
            guard let casted = newValue as? UIHostingConfiguration<Content, Background> else {
                fatalError("The type of the new configuration does not match the type of the UIHostingConfiguration that the content view was initially created with. Make a new content view from the new configuration instead.\nNew configuration type: \(newValue)\nExisting configuration type: \(self._configuration)")
            }
            
            self._configuration = casted
        }
    }
}

fileprivate struct HostingContentViewRootModifier : UnaryViewModifier {
    private(set) var defaultStyling: ListContentStyling // 0x0
    private(set) var margins: OptionalEdgeInsets // 0x14 (offset field)
    private(set) var minSize: (CGFloat?, CGFloat?) // 0x18 (offset field)
    private(set) var listEnvironment: UIListEnvironment // 0x1c (offset field)
    private(set) var configurationState: UICellConfigurationState? // 0x20 (offset field)
    
    var effectivePadding: EdgeInsets {
        return EdgeInsets(
            top: self.margins.top ?? self.defaultStyling.insets.top,
            leading: self.margins.leading ?? self.defaultStyling.insets.leading,
            bottom: self.margins.bottom ?? self.defaultStyling.insets.bottom,
            trailing: self.margins.trailing ?? self.defaultStyling.insets.trailing
        )
    }
    
    func body(content: Content) -> some View {
        content
            .padding(self.effectivePadding)
            .modifier(
                ContentConfigurationBasedRootEnvironment(
                    defaultStyling: self.defaultStyling,
                    isEnabled: true,
                    state: self.configurationState
                )
            )
            .frame(
                minWidth: self.minSize.0,
                idealWidth: nil,
                maxWidth: self.maxWidth,
                minHeight: self.minSize.1 ?? (self.defaultStyling.minHeight > 0 ? self.defaultStyling.minHeight : nil),
                idealHeight: nil,
                maxHeight: nil,
                alignment: self.alignment
            )
            .modifier(
                AccessibilityAttachmentModifier(
                    storage: MutableBox(self.accessibilityAttachment),
                    behavior: nil
                )
            )
            .input(IsInHostingConfiguration.self)
    }
    
    @inline(always) // 원래 없음
    private var maxWidth: CGFloat? {
        switch self.listEnvironment {
        case .unspecified, .none:
            return nil
        default:
            return CGFloat.infinity
        }
    }
    
    @inline(always) // 원래 없음
    private var alignment: Alignment {
        switch self.listEnvironment {
        case .unspecified, .none:
            return .center
        default:
            return .leading
        }
    }
    
    @inline(always) // 원래 없음
    private var accessibilityAttachment: AccessibilityAttachment {
        var traits = AccessibilityTraits()
        
        if
            let configurationState,
            configurationState.isSelected
        {
            traits.formUnion(.isSelected)
        }
        
        let options = AccessibilityNullableOptionSet<AccessibilityTraitSet>(adding: traits)
        var properties = AccessibilityProperties()
        properties.traits = options
        
        let attachment = AccessibilityAttachment.properties(properties)
        return attachment
    }
}

struct BridgedPopUpButtonPreferenceKey : HostPreferenceKey {
    static let defaultValue: WeakBox<UIButton>? = nil
    
    static func reduce(value: inout WeakBox<UIButton>?, nextValue: () -> WeakBox<UIButton>?) {
        assertUnimplemented()
    }
}

fileprivate struct HostingContentViewGraph : ViewGraphFeature {
    var listEnvironment: UIListEnvironment
    
    func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        assertUnimplemented()
    }
}

struct ContentConfigurationBasedRootEnvironment : EnvironmentModifier, PrimitiveViewModifier {
    fileprivate private(set) var defaultStyling: ListContentStyling
    fileprivate private(set) var isEnabled: Bool
    fileprivate private(set) var state: UICellConfigurationState?
    
    static func makeEnvironment(
        modifier: Attribute<ContentConfigurationBasedRootEnvironment>,
        environment: inout EnvironmentValues
    ) {
        let value = modifier.value
        
        if value.isEnabled {
            environment.configureListStyling(value.defaultStyling, state: value.state)
        }
    }
}

extension EnvironmentValues {
    mutating func configureListStyling(_ styling: ListContentStyling, state: UICellConfigurationState?) {
        /*
         self -> x20 -> x19
         styling -> x0 -> x27
         state -> x1 -> x29 - 0x88
         */
        // <+372>
        self.defaultFont = styling.font
        
        if let foregroundStyle = styling.foregroundStyle {
            self.defaultForegroundStyle = foregroundStyle.copyStyle(in: self, foregroundStyle: nil)
        } else {
            self.defaultForegroundStyle = nil
        }
        
        self.defaultLabelIconToTitleSpacing = styling.labelIconToTitleSpacing
        
        // <+600>
        self.listRowInsets = styling.insets
        self.listItemTint = styling.tint
        
        if styling.isUppercase {
            self.textCase = .uppercase
        }
        
        // <+768>
        guard let state else {
            return
        }
        
        if state.isSelected && state.isFocused {
            self.backgroundProminence = .increased
        } else {
            self.backgroundProminence = .standard
        }
        
        // <+908>
        self.uiKitCellState = UIKitCellState(
            isEditing: state.isEditing,
            isSelected: state.isSelected,
            isPinned: state.isPinned,
            isFocused: state.isFocused
        )
    }
}

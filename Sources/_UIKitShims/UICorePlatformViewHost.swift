@_spi(Internal) public import MySwiftUICore
public import UIKit
public import _UIKitPrivate

@_spi(Internal) open class UICorePlatformViewHost<Representable: CoreViewRepresentable>: _UIConstraintBasedLayoutHostingView, CoreViewRepresentableHost {
    private var environment: EnvironmentValues // 0x210
    private var viewPhase: ViewGraphHost.Phase // 0x220
    public let coreRepresentedViewProvider: Representable.PlatformViewProvider // 0x228
    weak var host: ViewGraphRootValueUpdater? = nil // 0x230
    private var viewHierarchyMode: UICorePlatformViewHost.ViewControllerParentingMode? = nil // 0x240
    private var isInitialSafeAreaUpdate: Bool = true // 0x241
    let safeAreaHelper = UICoreSafeAreaHelper() // 0x248
    
    private var _safeAreaInsets = UIEdgeInsets(
        top: .greatestFiniteMagnitude,
        left: .greatestFiniteMagnitude,
        bottom: .greatestFiniteMagnitude,
        right: .greatestFiniteMagnitude
    ) // 0x250
    
    weak private var vc: UIViewController? = nil // 0x270
    private var inLayoutSizeThatFits: Bool = false // 0x278
    private var cachedImplementsFittingSize: Bool? = nil // 0x279
    public var coreLayoutInvalidator: ViewGraphHost.LayoutInvalidator? = nil // 0x280
    private var invalidationPending: Bool = false // 0x291
    private var separatedThicknessRegistration: UICorePlatformViewHost.SeparatedThicknessRegistration? = nil // 0x298
    private var cachedLayoutTraits: _LayoutTraits? = nil // 0x2a0
    
    open override var intrinsicContentSize: CGSize {
        fatalError("TODO")
    }
    
    open override func removeFromSuperview() {
        fatalError("TODO")
    }
    
    open override func didMoveToWindow() {
        fatalError("TODO")
    }
    
    open override func _layoutMetricsInvalidatedForHostedView() {
        fatalError("TODO")
    }
    
    open override func _layoutSizeThatFits(_ size: CGSize, fixedAxes axes: UIAxis) -> CGSize {
        fatalError("TODO")
    }
    
    open override func _priorityForEngineHostConstraints() -> UILayoutPriority {
        fatalError("TODO")
    }
    
    open override func _setHostsLayoutEngine(_ hostsLayoutEngine: Bool) {
        fatalError("TODO")
    }
    
    open override func _traitCollection(forChildEnvironment environment: any UITraitEnvironment) -> UITraitCollection {
        fatalError("TODO")
    }
    
    open override func _updateSafeAreaInsets() {
        fatalError("TODO")
    }
    
    open override var alignmentRectInsets: UIEdgeInsets {
        fatalError("TODO")
    }
    
    open override func contentCompressionResistancePriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority {
        fatalError("TODO")
    }
    
    open override func contentHuggingPriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority {
        fatalError("TODO")
    }
    
    open override func didAddSubview(_ subview: UIView) {
        fatalError("TODO")
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        fatalError("TODO")
    }
    
    open override var hostedView: UIView? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    open override func layoutSubviews() {
        fatalError("TODO")
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        fatalError("TODO")
    }
    
    open override var safeAreaInsets: UIEdgeInsets {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    open override func updateConstraints() {
        fatalError("TODO")
    }
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        fatalError("TODO")
    }
    
    public typealias Content = Representable
    
    public required init(_ coreRepresentedViewProvider: Representable.PlatformViewProvider, host: (any MySwiftUICore.ViewGraphRootValueUpdater)?, environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        // <+536>
        self.environment = environment
        self.viewPhase = viewPhase
        self.coreRepresentedViewProvider = coreRepresentedViewProvider
        self.host = host
        super.init(hostedView: nil)
        
        // <+768>
        fatalError("TODO")
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func coreLayoutTraits() -> _LayoutTraits {
        fatalError("TODO")
    }
    
    open func coreUpdateEnvironment(_ environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        fatalError("TODO")
    }
    
    open func coreLayoutSizeThatFits(_ size: CGSize, fixedAxes: Axis.Set) -> CGSize {
        fatalError("TODO")
    }
    
    open func coreBaselineOffsets(at size: CGSize) -> CoreBaselineOffsetPair {
        fatalError("TODO")
    }
    
    open func coreUpdateSafeAreaInsets(_ insets: EdgeInsets) {
        fatalError("TODO")
    }
    
    open func makeEnvironmentWrapper(_ environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) -> ViewGraphHostEnvironmentWrapper {
        fatalError("TODO")
    }
    
    open func resolvedTraitCollection(baseTraitCollection: UITraitCollection, environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) -> UITraitCollection {
        fatalError("TODO")
    }
    
    func enqueueLayoutInvalidation() {
        fatalError("TODO")
    }
    
    func updateNestedHosts(_: ViewGraphRootValues, colorSchemeChanged: Bool) {
        fatalError("TODO")
    }
}

final class UICoreSafeAreaHelper {
    private var pendingSafeAreaInsets: UIEdgeInsets?
    private var lastParentSafeAreaInsets: UIEdgeInsets?
}

extension UICorePlatformViewHost {
    fileprivate enum ViewControllerParentingMode {
        case unknown0
        case unknown1
    }
    
    // _TtCGC5UIKit22UICorePlatformViewHostGV7SwiftUIP10$1d3103ab432PlatformViewRepresentableAdaptorV16NativePlaygroundP10$100b57f7c19MyViewRepresentable__P10$186ef5ecc30SeparatedThicknessRegistration
    fileprivate final class SeparatedThicknessRegistration: NSObject {
        private var hostedView: Representable.PlatformViewProvider // 0x8
        // TODO
        private var observation: NSKeyValueObservation? // 0x10
        private var traitChangeRegistration: (any UITraitChangeRegistration)? // 0x18
        private var separatedThickness: CGFloat // 0x20
        private var displayScale: CGFloat // 0x28
        private var onChange: () -> Void // 0x30
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            fatalError("TODO")
        }
        
        override init() {
            fatalError("TODO")
            super.init()
        }
    }
}

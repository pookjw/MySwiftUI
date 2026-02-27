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
        guard UICoreUnifiedLayout.isEnabled else {
            return
        }
        
        super._setHostsLayoutEngine(hostsLayoutEngine)
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
            super.hostedView = newValue
            /*
             self -> x20 -> x19
             newValue -> x0 -> x21
             */
            if let separatedThicknessRegistration {
                // <+64>
                // x20
                let oldValue = separatedThicknessRegistration.hostedView
                
                if oldValue === newValue {
                    // <+180>
                    return
                } else {
                    // <+108>
                    // <+128>
                }
            } else {
                // <+104>
                if let newValue {
                    // <+128>
                } else {
                    // <+180>
                    return
                }
            }
            
            // <+128>
            if let separatedThicknessRegistration {
                separatedThicknessRegistration.invalidate()
            }
            
            // <+168>
            if let newValue {
                // <+204>
                self.separatedThicknessRegistration = UICorePlatformViewHost.SeparatedThicknessRegistration(
                    hostedView: unsafeBitCast(newValue, to: Representable.PlatformViewProvider.self), // FIXME
                    onChange: { [weak self] in
                        guard let self else {
                            return
                        }
                        
                        guard self.hostedView != nil else {
                            return
                        }
                        
                        self.onChange()
                    }
                )
            } else {
                self.separatedThicknessRegistration = nil
            }
        }
    }
    
    private func onChange() {
        // self -> x20
        // <+172>
        guard self.coreLayoutInvalidator == nil else {
            self.cachedLayoutTraits = nil
            return
        }
        
        guard !self.invalidationPending else {
            return
        }
        
        self.invalidationPending = true
        
        ViewGraphHostUpdate.enqueueAction { [weak self] in
            guard let self else {
                return
            }
            
            onInvalidation()
        }
    }
    
    private func onInvalidation() {
        // self -> x20 -> x19
        // <+200>
        self.cachedLayoutTraits = nil
        
        if let invalidator = self.coreLayoutInvalidator {
            invalidator.invalidate()
        }
        
        self.invalidationPending = false
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
        if Representable.isViewController {
            if isLinkedOnOrAfter(.v6) {
                viewHierarchyMode = .unknown0
            } else {
                viewHierarchyMode = .unknown1
            }
        }
        
        // <+828>
        if isLinkedOnOrAfter(.v6) {
            self.layer.allowsGroupOpacity = false
            self.layer.allowsGroupBlending = false
        }
        
        // <+904>
        if Representable.isViewController {
            // <+924>
            fatalError("TODO")
        } else {
            // <+1028>
            fatalError("TODO")
        }
        
        // <+1052>
        fatalError("TODO")
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        fatalError("TODO")
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
    
    fileprivate final class SeparatedThicknessRegistration: NSObject {
        private(set) var hostedView: Representable.PlatformViewProvider // 0x8
        private var observation: NSKeyValueObservation? = nil // 0x10
        private var traitChangeRegistration: (any UITraitChangeRegistration)? = nil // 0x18
        private var separatedThickness: CGFloat = 0 // 0x20
        private var displayScale: CGFloat = 0 // 0x28
        private var onChange: () -> Void // 0x30
        
        @MainActor init(hostedView: Representable.PlatformViewProvider, onChange: @escaping () -> Void) {
            self.hostedView = hostedView
            self.onChange = onChange
            super.init()
            
            // <+184>
            let view = unsafeBitCast(hostedView, to: UIView.self) // FIXME
            
            self.traitChangeRegistration = view._register(forTraitTokenChanges: [DisplayScaleToken()!]) { [weak self] (traitEnvironment: any UITraitEnvironment, previousTraitCollection: UITraitCollection) in
                // ___lldb_unnamed_symbol_291f1c
                guard let self else {
                    return
                }
                
                let view = unsafeBitCast(self.hostedView, to: UIView.self) // FIXME
                let newDisplayScale = view.traitCollection.displayScale
                
                guard self.displayScale != newDisplayScale else {
                    return
                }
                
                self.displayScale = newDisplayScale
                onChange()
            }
            
            view.layer.addObserver(self, forKeyPath: "separatedOptions.separatedThickness", options: [.new], context: nil)
        }
        
        deinit {
            // 없을 수도 있음 아니면 View에서 invalidate를 호출하거나
            fatalError("TODO")
        }
        
        @MainActor func invalidate() {
            guard let traitChangeRegistration else {
                return
            }
            
            let view = unsafeBitCast(self.hostedView, to: UIView.self) // FIXME
            view.layer.removeObserver(self, forKeyPath: "separatedOptions.separatedThickness", context: nil)
            view.unregisterForTraitChanges(traitChangeRegistration)
            // self.traitChangeRegistration = nil은 안 보임
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            fatalError("TODO")
        }
    }
}

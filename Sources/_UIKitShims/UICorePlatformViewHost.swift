@_spi(Internal) public import MySwiftUICore
public import UIKit
public import _UIKitPrivate

@_spi(Internal) @MainActor open class UICorePlatformViewHost<Representable: CoreViewRepresentable>: _UIConstraintBasedLayoutHostingView, CoreViewRepresentableHost {
    private var environment: EnvironmentValues // 0x210
    private var viewPhase: ViewGraphHost.Phase // 0x220
    @safe public nonisolated(unsafe) let coreRepresentedViewProvider: Representable.PlatformViewProvider // 0x228
    package weak var host: ViewGraphRootValueUpdater? = nil // 0x230
    private var viewHierarchyMode: UICorePlatformViewHost.ViewControllerParentingMode? = nil // 0x240
    private var isInitialSafeAreaUpdate: Bool = true // 0x241
    let safeAreaHelper = UICoreSafeAreaHelper() // 0x248
    
    private var _safeAreaInsets = UIEdgeInsets(
        top: .greatestFiniteMagnitude,
        left: .greatestFiniteMagnitude,
        bottom: .greatestFiniteMagnitude,
        right: .greatestFiniteMagnitude
    ) // 0x250
    
    private weak var vc: UIViewController? = nil // 0x270
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
        guard let vc else {
            super.removeFromSuperview()
            return
        }
        
        // vc -> x19
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
        
        super.removeFromSuperview()
        
        if
            let host,
            let provider = host.as(UICoreViewControllerProvider.self),
            let coreUIViewController = provider.coreUIViewController
        {
            coreUIViewController.setOverrideTraitCollection(nil, forChild: vc)
        }
    }
    
    open override func didMoveToWindow() {
        // self -> x20 -> x19
        if
            self.window != nil,
            let vc // x21
        {
            // x22
            let vcView = vc.view
            if let provider = host?.as(UICoreViewControllerProvider.self) {
                // <+212>
                let hostingController: UIViewController?
                if isLinkedOnOrAfter(.v6_4) {
                    // <+340>
                    hostingController = (provider as! UIView)._viewControllerForAncestor()
                } else {
                    // <+356>
                    hostingController = provider.coreUIViewController
                }
                
                if let hostingController {
                    // <+272>
                    switch viewHierarchyMode {
                    case .unknown0:
                        // <+388>
                        // hostingController -> x23
                        if vc.parent !== hostingController {
                            hostingController.addChild(vc)
                        }
                        // <+456>
                        let w28: Bool
                        if let presentedViewController = vc.presentedViewController {
                            w28 = presentedViewController.modalPresentationStyle != .currentContext
                        } else {
                            w28 = true
                        }
                        
                        // <+508>
                        let w24: Bool
                        if let presentedViewController = vc.presentedViewController {
                            w24 = presentedViewController.isBeingDismissed
                        } else {
                            w24 = false
                        }
                        
                        // <+552>
                        if self.hostedView == nil && (w28 || w24) {
                            self.hostedView = vcView
                            vc.didMove(toParent: hostingController)
                        }
                        
                        // <+608>
                    case .unknown1:
                        // <+328>
                        hostingController.addChild(vc)
                        self.hostedView = vcView
                        vc.didMove(toParent: hostingController)
                        // <+608>
                    case nil:
                        // <+376>
                        // <+608>
                        break
                    }
                    // <+608>
                } else {
                    // <+608>
                }
            } else {
                // <+608>
            }
        }
        
        super.didMoveToWindow()
    }
    
    open override func _layoutMetricsInvalidatedForHostedView() {
        // self -> x20 -> x19
        super._layoutMetricsInvalidatedForHostedView()
        
        guard 
            Representable.layoutOptions(coreRepresentedViewProvider).isSuperset(of: .invalidatesSizeOnConstraintChanges),
            !inLayoutSizeThatFits,
            hostedView != nil
        else {
            return
        }
        
        onChange()
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
        /*
         self -> x20 -> x19
         envrionment -> x0 -> x29 - 0x88
         */
        if
            Representable.isViewController,
            let host,
            let provider = host.as(UICoreViewControllerProvider.self),
            provider.coreUIViewController != nil
        {
            // <+196>
            return super._traitCollection(forChildEnvironment: environment)
        } else {
            // <+384>
            let wrapper = self.makeEnvironmentWrapper(self.environment, viewPhase: self.viewPhase)
            // x23
            return resolvedTraitCollection(baseTraitCollection: self.traitCollection, environment: self.environment, wrapper: wrapper)
        }
    }
    
    open override func _updateSafeAreaInsets() {
        // self -> x20 -> x19
        let oldSafeAreaInsets = self.msui_safeAreaInsets
        
        // w24
        let shouldEagerlyUpdateSafeArea = Representable.shouldEagerlyUpdateSafeArea(coreRepresentedViewProvider)
        
        safeAreaHelper.prepareForSafeAreaPropagation(_safeAreaInsets: &self._safeAreaInsets, containerView: self, shouldEagerlyUpdate: shouldEagerlyUpdateSafeArea)
        
        // <+232>
        super._updateSafeAreaInsets()
        
        let newSafeAreaInsets = self.msui_safeAreaInsets
        guard oldSafeAreaInsets != newSafeAreaInsets else {
            return
        }
        
        // <+308>
        if Representable.isViewController {
            representedView._viewDelegateContentOverlayInsetsAreClean = false
        }
        
        // <+352>
        if isInitialSafeAreaUpdate {
            let old = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            representedView._updateSafeAreaInsets()
            UIView.setAnimationsEnabled(old)
        } else {
            representedView._updateSafeAreaInsets()
        }
        
        // <+472>
        self.isInitialSafeAreaUpdate = false
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
    
    // ___lldb_unnamed_symbol_29101c
    open override func didAddSubview(_ subview: UIView) {
        /*
         self -> x20
         subview -> x0 -> x19
         */
        super.didAddSubview(subview)
        
        guard let vc else {
            return
        }
        
        // x21
        let viewControllerView = vc.view
        let hostedView = self.hostedView
        
        if hostedView == nil, let viewControllerView, subview === viewControllerView {
            self.hostedView = viewControllerView
        }
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if isLinkedOnOrAfter(.v6) {
            // <+84>
            let result = super.hitTest(point, with: event)
            if self === result {
                return nil
            } else {
                return result
            }
        } else {
            // <+148>
            return super.hitTest(point, with: event)
        }
    }
    
    open override var hostedView: UIView? {
        get {
            return super.hostedView
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
        super.layoutSubviews()
        
        // w19
        let isEnabled = UICoreUnifiedLayout.isEnabled
        // sp + 0x8
        guard let hostedView else {
            return
        }
        
        let wantsConstraintBasedLayout = hostedView._wantsConstraintBasedLayout
        
        guard !(wantsConstraintBasedLayout && isEnabled) else {
            return
        }
        
        guard bounds.width != 0 && bounds.height != 0 else {
            return
        }
        
        let frame = hostedView.frame(forAlignmentRect: bounds)
        hostedView.frame = frame
    }
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        /*
         self -> x20
         event -> x0 -> x19
         */
        let d8 = point.y
        let d9 = point.x
        
        guard isLinkedOnOrAfter(.v7), let hostedView else {
            return super.point(inside: point, with: event)
        }
        
        // <+84>
        // hostedView -> x21
        var d0 = d9
        var d1 = d8
        
        do {
            let point = hostedView.convert(CGPoint(x: d0, y: d1), from: self)
            d0 = point.x
            d1 = point.y
        }
        
        return hostedView.point(inside: CGPoint(x: d0, y: d1), with: event)
    }
    
    open override var msui_safeAreaInsets: UIEdgeInsets {
        get {
            let fromOwn = self._safeAreaInsets
            var d9 = fromOwn.top
            var d10 = fromOwn.left
            var d11 = fromOwn.bottom
            var d8 = fromOwn.right
            
            let fromSuper = super.safeAreaInsets
            var d0 = fromSuper.top
            var d1 = fromSuper.left
            var d2 = fromSuper.bottom
            var d3 = fromSuper.right
            
            let d7 = Double.greatestFiniteMagnitude
            
            if (d9 == d7) && (d10 == d7) && (d11 == d7) {
                // <+120>
                let d6 = d2
                let d2 = Double.greatestFiniteMagnitude
                d9 = (d8 == d2) ? d0 : d2
                d10 = (d8 == d2) ? d1 : d2
                d11 = (d8 == d2) ? d6 : d2
                d8 = (d8 == d2) ? d3 : d8
            }
            
            // <+148>
            return UIEdgeInsets(top: d9, left: d10, bottom: d11, right: d8)
        }
        set {
            super.msui_safeAreaInsets = newValue
        }
    }
    
    open override func updateConstraints() {
        fatalError("TODO")
    }
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        /*
         self -> x20 -> x21
         newSuperview -> x0 -> x19
         */
        // <+168>
        if let newSuperview, let vc {
            // vc -> x23
            // x29 - 0x80
            let vcView = vc.view
            let flag: Bool // true -> <+448> / false -> <+740>
            var hostingController: UIViewController!
            
            if let host, let provider = host.as(UICoreViewControllerProvider.self) {
                // vc -> x23 -> x29 - 0x88
                // provider -> x24
                if isLinkedOnOrAfter(.v6_4) {
                    // <+340>
                    hostingController = (provider as! UIView)._viewControllerForAncestor()
                } else {
                    // <+356>
                    hostingController = provider.coreUIViewController
                }
                
                // <+372>
                if let hostingController {
                    switch viewHierarchyMode {
                    case .unknown0:
                        // <+604>
                        /*
                         viewController -> x29 - 0xa8
                         provider -> x29 - 0xa0
                         */
                        if vc.parent !== hostingController {
                            hostingController.addChild(vc)
                        }
                        // <+740>
                        flag = false
                    case .unknown1:
                        // <+544>
                        /*
                         viewController -> x29 - 0xa8
                         provider -> x29 - 0xa0
                         */
                        if vc.parent !== hostingController, self.window != nil {
                            hostingController.addChild(vc)
                            self.hostedView = vcView
                        }
                        // <+740>
                        flag = false
                    case nil:
                        // <+448>
                        flag = true
                    }
                } else {
                    flag = true
                }
            } else {
                flag = true
            }
            
            if flag {
                // <+448>
                self.hostedView = vcView
            } else {
                // <+740>
                let wrapper = makeEnvironmentWrapper(self.environment, viewPhase: self.viewPhase)
                let traitCollection = UITraitCollection()
                let resolved = resolvedTraitCollection(baseTraitCollection: traitCollection, environment: self.environment, wrapper: wrapper)
                hostingController.setOverrideTraitCollection(resolved, forChild: vc)
                // <+468>
            }
        }
        
        // <+476>
        super.willMove(toSuperview: newSuperview)
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
            self.vc = representedViewController
        } else {
            // <+1028>
            self.hostedView = representedView
        }
        
        // <+1052>
        if Representable.isViewController {
            self.hostedView = representedView
        }
        
        // <+1096>
        update(newEnvironment: environment, newViewPhase: viewPhase)
        
        // 아마 Invalidation하는 코드가 있는데 Production Build에서 제거된 것으로 추정
        _ = ViewGraphRootValues.environment
        
        updateColorScheme(needsStatusBarAppearanceUpdate: false)
    }
    
    private func update(newEnvironment: EnvironmentValues, newViewPhase: ViewGraphHost.Phase) {
        /*
         self -> x20 -> x19
         newEnvironment -> x0 -> x21
         newViewPhase -> x1 -> x29 - 0x58
         */
        // x22
        let oldColorScheme = environment.colorScheme
        // x28
        let newColorScheme = newEnvironment.colorScheme
        // x29 - 0x7c
        let isEqual = oldColorScheme == newColorScheme
        // x22
        let isIdentical = environment.isIdentical(to: newEnvironment)
        
        self.environment = newEnvironment
        self.viewPhase = newViewPhase
        
        if !isIdentical {
            updateColorScheme(needsStatusBarAppearanceUpdate: !isEqual)
        }
        
        // <+516>
        updateView(environment: newEnvironment, view: representedView)
    }
    
    private func updateColorScheme(needsStatusBarAppearanceUpdate: Bool) {
        /*
         self -> x20 -> x21
         force -> x0 -> x25
         */
        if let vc {
            // <+188>
            // vc -> x29 - 0x68
            guard let host else {
                return
            }
            
            // force -> x25 -> x29 - 0x6c
            guard let provider = host.as(UICoreViewControllerProvider.self) else {
                return
            }
            
            // x29 - 0x78
            guard let coreUIViewController = provider.coreUIViewController else {
                return
            }
            
            // x25
            let wrapper = makeEnvironmentWrapper(environment, viewPhase: viewPhase)
            // x20
            let resolvedTraitCollection = resolvedTraitCollection(baseTraitCollection: self.traitCollection, environment: self.environment, wrapper: wrapper)
            
            // <+496>
            ViewGraphHostUpdate.enqueueAction { [weak coreUIViewController] in
                /*
                 coreUIViewController -> x0
                 resolvedTraitCollection -> x1
                 vc -> x2
                 force -> w3
                 */
                coreUIViewController?.setOverrideTraitCollection(resolvedTraitCollection, forChild: vc)
                vc.updateTraitsIfNeeded()
                
                if needsStatusBarAppearanceUpdate {
#if os(visionOS)
                    coreUIViewController?.msui_setNeedsStatusBarAppearanceUpdate()
#else
                    coreUIViewController?.setNeedsStatusBarAppearanceUpdate()
#endif
                }
            }
        } else {
            // <+672>
            self._noteTraitsDidChangeRecursively()
        }
    }
    
    private func updateView(environment: EnvironmentValues, view: UIView) {
        /*
         self -> x20 -> x19
         environment -> x0 -> x20
         view -> x1 -> x24
         */
        let isEnabled = environment.isEnabled
        
        ViewGraphHostUpdate.enqueueAction {
            /*
             self -> x0 -> x21
             isEnabled -> w1 -> w19 -> w22
             view -> x2 -> x20
             */
            if isEnabled != self.isUserInteractionEnabled {
                self.isUserInteractionEnabled = isEnabled
            }
            
            if let control = view as? UIControl, isEnabled != control.isEnabled {
                control.isEnabled = isEnabled
            }
        }
        
        // <+220>
        // w25
        let isRTL = environment.layoutDirection == .rightToLeft
        // x21
        let semanticContentAttribute: UISemanticContentAttribute = (isRTL ? .forceRightToLeft : .forceLeftToRight)
        
        if view.semanticContentAttribute != semanticContentAttribute {
            view.semanticContentAttribute = semanticContentAttribute
        }
        
        // <+340>
        let tintColor: UIColor?
        if let effectiveTintColor = environment.effectiveTintColor {
            // effectiveTintColor -> x21
            let resolved = effectiveTintColor.resolve(in: environment)
            tintColor = Color.uiColorCache[resolved]
        } else {
            tintColor = nil
        }
        
        self.tintColor = tintColor
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func coreLayoutTraits() -> _LayoutTraits {
        fatalError("TODO")
    }
    
    open func coreUpdateEnvironment(_ environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        /*
         self -> x20 -> x19
         environment -> x0 -> x21
         viewPhase -> x1 -> x29 - 0x58
         */
        // <+248>
        // x29 - 0x7c
        let isEqual = self.environment.colorScheme == environment.colorScheme
        // <+352>
        // w22
        let isIdentical = self.environment.isIdentical(to: environment)
        
        self.environment = environment
        self.viewPhase = viewPhase
        
        if !isIdentical {
            // <+492>
            updateNestedHosts(.environment, colorSchemeChanged: !isEqual)
        }
        
        // <+516>
        updateView(environment: environment, view: representedView)
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
    
    final func updateNestedHosts(_ values: ViewGraphRootValues, colorSchemeChanged: Bool) {
        // values는 안 쓰임
        /*
         self -> x20 -> x21
         colorSchemeChanged -> x0 -> x25
         */
        // <+152>
        // x29 - 0x68
        guard let vc else {
            self._noteTraitsDidChangeRecursively()
            return
        }
        
        // <+188>
        // x20
        guard
            let host,
            let provider = host.as(UICoreViewControllerProvider.self),
            // colorSchemeChanged -> x29 - 0x6c
            let coreUIViewController = provider.coreUIViewController
        else {
            return
        }
        
        // <+312>
        // coreUIViewController -> x29 - 0x78
        // <+336>
        // x25
        let wrapper = self.makeEnvironmentWrapper(self.environment, viewPhase: self.viewPhase)
        // x20
        let resolved = self.resolvedTraitCollection(baseTraitCollection: self.traitCollection, environment: self.environment, wrapper: wrapper)
        
        ViewGraphHostUpdate.enqueueAction { [weak coreUIViewController] in
            /*
             self -> x0 -> x19
             resolved -> x1 -> x22
             vc -> x2 -> x21
             colorSchemeChanged -> w3 -> w20
             */
            // x23
            if let coreUIViewController {
                coreUIViewController.setOverrideTraitCollection(resolved, forChild: vc)
            }
            
            // <+92>
            vc.updateTraitsIfNeeded()
            
            if colorSchemeChanged, let coreUIViewController {
#if os(visionOS)
                coreUIViewController.msui_setNeedsStatusBarAppearanceUpdate()
#else
                coreUIViewController.setNeedsStatusBarAppearanceUpdate()
#endif
            }
        }
    }
    
    package final var representedView: UIView {
        return Representable.platformView(for: coreRepresentedViewProvider) as! UIView
    }
    
    private final nonisolated var representedViewController: UIViewController {
        return coreRepresentedViewProvider as! UIViewController
    }
}

@MainActor final class UICoreSafeAreaHelper {
    private var pendingSafeAreaInsets: UIEdgeInsets?
    private var lastParentSafeAreaInsets: UIEdgeInsets?
    
    func resolvedSafeAreaInsets(_safeAreaInsets: UIEdgeInsets, defaultSafeAreaInsets: UIEdgeInsets) -> UIEdgeInsets {
        fatalError("TODO")
    }
    
    func updateSafeAreaInsets(_: UIEdgeInsets?, _safeAreaInsets: inout UIEdgeInsets, containerView: UIView, shouldEagerlyUpdate: Bool) {
        fatalError("TODO")
    }
    
    func prepareForSafeAreaPropagation(_safeAreaInsets: inout UIEdgeInsets, containerView: UIView, shouldEagerlyUpdate: Bool) {
        _prepareForSafeAreaPropagation(_safeAreaInsets: &_safeAreaInsets, containerView: containerView, shouldEagerlyUpdate: shouldEagerlyUpdate)
        
        if let pendingSafeAreaInsets {
            _safeAreaInsets = pendingSafeAreaInsets
            self.pendingSafeAreaInsets = nil
        }
    }
    
    private func _prepareForSafeAreaPropagation(_safeAreaInsets: inout UIEdgeInsets, containerView: UIView, shouldEagerlyUpdate: Bool) {
        /*
         _safeAreaInsets -> x0 -> x21
         containerView -> x1 -> x22
         shouldEagerlyUpdate -> w2 -> w23
         */
        // x19
        guard let superview = containerView.superview else {
            return
        }
        
        // d11, d10, d9, d8
        let safeAreaInsets = superview.safeAreaInsets
        
        if shouldEagerlyUpdate, let lastParentSafeAreaInsets {
            // <+168>
            fatalError("TODO")
        }
        
        // <+112>
        self.lastParentSafeAreaInsets = safeAreaInsets
    }
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

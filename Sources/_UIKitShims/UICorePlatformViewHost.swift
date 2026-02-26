@_spi(Internal) public import MySwiftUICore
public import UIKit
public import _UIKitPrivate

@_spi(Internal) open class UICorePlatformViewHost<Representable: CoreViewRepresentable>: _UIConstraintBasedLayoutHostingView, CoreViewRepresentableHost {
    private var environment: EnvironmentValues // 0x210
    private var viewPhase: ViewGraphHost.Phase // 0x220
    public let coreRepresentedViewProvider: Representable.PlatformViewProvider // 0x228
    weak var host: ViewGraphRootValueUpdater? // 0x230
    private var viewHierarchyMode: UICorePlatformViewHost.ViewControllerParentingMode? // 0x240
    private var isInitialSafeAreaUpdate: Bool // 0x241
    let safeAreaHelper: UICoreSafeAreaHelper // 0x248
    private var _safeAreaInsets: UIEdgeInsets // 0x250
    weak private var vc: UIViewController? // 0x270
    private var inLayoutSizeThatFits: Bool // 0x278
    private var cachedImplementsFittingSize: Bool? // 0x279
    public var coreLayoutInvalidator: ViewGraphHost.LayoutInvalidator? // 0x280
    private var invalidationPending: Bool // 0x291
    private var separatedThicknessRegistration: UICorePlatformViewHost.SeparatedThicknessRegistration? // 0x298
    private var cachedLayoutTraits: _LayoutTraits? // 0x2a0
    
    public typealias Content = Representable
    
    public required init(_ coreRepresentedViewProvider: Representable.PlatformViewProvider, host: (any MySwiftUICore.ViewGraphRootValueUpdater)?, environment: MySwiftUICore.EnvironmentValues, viewPhase: MySwiftUICore.ViewGraphHost.Phase) {
        fatalError("TODO")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func coreLayoutTraits() -> MySwiftUICore._LayoutTraits {
        fatalError("TODO")
    }
    
    public func coreUpdateEnvironment(_ environment: MySwiftUICore.EnvironmentValues, viewPhase: MySwiftUICore.ViewGraphHost.Phase) {
        fatalError("TODO")
    }
    
    public func coreLayoutSizeThatFits(_ size: CGSize, fixedAxes: MySwiftUICore.Axis.Set) -> CGSize {
        fatalError("TODO")
    }
    
    public func coreBaselineOffsets(at size: CGSize) -> MySwiftUICore.CoreBaselineOffsetPair {
        fatalError("TODO")
    }
    
    public func coreUpdateSafeAreaInsets(_ insets: MySwiftUICore.EdgeInsets) {
        fatalError("TODO")
    }
}

final class UICoreSafeAreaHelper {
    private var pendingSafeAreaInsets: UIEdgeInsets?
    private var lastParentSafeAreaInsets: UIEdgeInsets?
}

extension UICorePlatformViewHost {
    fileprivate enum ViewControllerParentingMode {
        // TODO
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

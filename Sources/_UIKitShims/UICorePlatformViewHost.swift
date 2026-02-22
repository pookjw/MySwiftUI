@_spi(Internal) public import MySwiftUICore
public import UIKit
public import _UIKitPrivate

@_spi(Internal) open class UICorePlatformViewHost<Representable: CoreViewRepresentable>: _UIConstraintBasedLayoutHostingView {
    private var environment: EnvironmentValues // 0x210
    private var viewPhase: ViewGraphHost.Phase // 0x220
    let coreRepresentedViewProvider: Representable.PlatformViewProvider // 0x228
    weak private var host: ViewGraphRootValueUpdater? // 0x230
    private var viewHierarchyMode: UICorePlatformViewHost.ViewControllerParentingMode? // 0x240
    private var isInitialSafeAreaUpdate: Bool // 0x241
    let safeAreaHelper: UICoreSafeAreaHelper // 0x248
    private var _safeAreaInsets: UIEdgeInsets // 0x250
    weak private var vc: UIViewController? // 0x270
    private var inLayoutSizeThatFits: Bool // 0x278
    private var cachedImplementsFittingSize: Bool? // 0x279
    private var coreLayoutInvalidator: ViewGraphHost.LayoutInvalidator? // 0x280
    private var invalidationPending: Bool // 0x291
    private var separatedThicknessRegistration: UICorePlatformViewHost.SeparatedThicknessRegistration? // 0x298
    private var cachedLayoutTraits: _LayoutTraits? // 0x2a0
    
    public init() {
        fatalError("TODO")
    }
    
    public required init?(coder: NSCoder) {
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

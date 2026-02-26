@_spi(Internal) internal import _UIKitShims
@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class UIKitPlatformViewHost<Representable: CoreViewRepresentable>: UICorePlatformViewHost<Representable> {
    private var importer: MRUIPreferenceImporter? // 0x2d8
    private var focusedValues: FocusedValues // 0x2e0
    private var responder: UIViewResponder? // 0x300
    
    override init() {
        fatalError("TODO")
    }
    
    required init?(coder: NSCoder) {
        fatalError("TODO")
    }
}

extension UIKitPlatformViewHost: CoreViewRepresentableHost {
    var coreRepresentedViewProvider: Representable.PlatformViewProvider {
        fatalError("TODO")
    }
    
    var coreLayoutInvalidator: MySwiftUICore.ViewGraphHost.LayoutInvalidator? {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    func coreLayoutTraits() -> MySwiftUICore._LayoutTraits {
        fatalError("TODO")
    }
    
    func coreUpdateEnvironment(_ environment: MySwiftUICore.EnvironmentValues, viewPhase: MySwiftUICore.ViewGraphHost.Phase) {
        fatalError("TODO")
    }
    
    func coreLayoutSizeThatFits(_ size: CGSize, fixedAxes: MySwiftUICore.Axis.Set) -> CGSize {
        fatalError("TODO")
    }
    
    func coreBaselineOffsets(at size: CGSize) -> MySwiftUICore.CoreBaselineOffsetPair {
        fatalError("TODO")
    }
    
    func coreUpdateSafeAreaInsets(_ insets: MySwiftUICore.EdgeInsets) {
        fatalError("TODO")
    }
    
    typealias Content = Representable
}

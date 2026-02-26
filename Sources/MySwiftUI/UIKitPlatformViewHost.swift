@_spi(Internal) internal import _UIKitShims
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import MRUIKit

final class UIKitPlatformViewHost<Representable: CoreViewRepresentable>: UICorePlatformViewHost<Representable> {
    private var importer: MRUIPreferenceImporter? = nil // 0x2d8
    var focusedValues = FocusedValues() // 0x2e0
    private(set) weak var responder: UIViewResponder? = nil // 0x300
    
    required init(_ coreRepresentedViewProvider: Representable.PlatformViewProvider, host: (any ViewGraphRootValueUpdater)?, environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        /*
         coreRepresentedViewProvider -> x0 -> x29 - 0x98
         host -> x1 -> x29 - 0x60
         environment -> x2 -> x29 - 0x58
         viewPhase -> x3 -> x29 - 0x68
         */
        super.init(coreRepresentedViewProvider, host: host, environment: environment, viewPhase: viewPhase)
    }
    
    override var parentPreferenceHost: (any MRUIPreferenceHostProtocol)? {
        fatalError("TODO")
    }
    
    override var _parentGestureRecognizerContainer: (any _UIGestureRecognizerContainer)? {
        fatalError("TODO")
    }
    
    var isPlatformFocusContainerHost: Bool {
        fatalError("TODO")
    }
    
    var focusView: UIView {
        fatalError("TODO")
    }
    
    override func makeEnvironmentWrapper(_ environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) -> ViewGraphHostEnvironmentWrapper {
        fatalError("TODO")
    }
    
    override func resolvedTraitCollection(baseTraitCollection: UITraitCollection, environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) -> UITraitCollection {
        fatalError("TODO")
    }
}

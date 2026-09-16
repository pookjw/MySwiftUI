internal import UIKit
internal import MySwiftUICore

final class PresentationHostingController<Content : View>: UIHostingController<Content> {
    // TODO
    private(set) var presentingBridgeKind: PresentationHostingControllerPresenterKind?
    var didPresenterLoseModifierRecursively: Bool
    var lastInteractiveDismissDisabled: Bool?
    var isDelayingRemotePresentation: Bool
    
    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}

extension PresentationHostingController where Content == AnyView {
    func setupSheet(for kind: PresentationHostingControllerPresenterKind, presenter: UIViewController, placement: SheetPreference.Placement) {
        assertUnimplemented()
    }
    
    func updateSheet(with preference: PresentationOptionsPreference) {
        assertUnimplemented()
    }
    
    func setBackgroundTransparency(preferenceValue: ContainerBackgroundKeys.Transparency?) {
        assertUnimplemented()
    }
}

enum PresentationHostingControllerPresenterKind {
    case sheetBridge
    case popoverInspectorBridge
    case inspectorRepresentable
}

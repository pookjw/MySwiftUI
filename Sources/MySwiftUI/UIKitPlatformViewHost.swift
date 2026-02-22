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

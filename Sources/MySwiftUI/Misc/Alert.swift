#warning("TODO")
internal import MySwiftUICore
internal import CoreGraphics

public struct Alert {
    
}

extension Alert {
    struct Presentation {
        let alert: Alert
        let onDismiss: (() -> Void)?
        let viewID: ViewIdentity
        let itemID: AnyHashable?
        let sourceRect: CGRect
    }
}

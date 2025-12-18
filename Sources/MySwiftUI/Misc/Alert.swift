internal import MySwiftUICore
internal import CoreGraphics

public struct Alert {
    
}

extension Alert {
    struct Presentation: AlertControllerConvertible {
        let alert: Alert
        let onDismiss: (() -> Void)?
        let viewID: ViewIdentity
        let itemID: AnyHashable?
        let sourceRect: CGRect
    }
}

extension Alert.Presentation {
    struct Key: HostPreferenceKey {
        typealias Value = Never? // TODO
        
        static func reduce(value: inout Never?, nextValue: () -> Never?) {
            fatalError("TODO")
        }
    }
}

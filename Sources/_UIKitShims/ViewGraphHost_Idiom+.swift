#warning("TODO")
internal import MySwiftUICore
internal import UIKit

extension ViewGraphHost.Idiom {
    init?(_uiIdiom idiom: UIUserInterfaceIdiom) {
        switch idiom {
        case .unspecified:
            return nil
        case .phone:
            self.init(.phone)
        case .pad:
            self.init(.pad)
        case .tv:
            self.init(.tv)
        case .carPlay:
            self.init(.carPlay)
        case .mac:
            self.init(.mac)
        case .vision:
            self.init(.vision)
        @unknown default:
            return nil
        }
    }
}

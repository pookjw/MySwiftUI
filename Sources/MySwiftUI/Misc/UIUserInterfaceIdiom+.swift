@_spi(Internal) internal import MySwiftUICore
internal import UIKit

extension UIUserInterfaceIdiom {
    var viewGraphIdiom: ViewGraphHost.Idiom? {
        guard let idiom else {
            return nil
        }
        return ViewGraphHost.Idiom(idiom.interfaceIdiom)
    }
    
    var idiom: AnyInterfaceIdiom? {
        switch self {
        case .unspecified:
            return nil
        case .phone:
            return AnyInterfaceIdiom(.phone)
        case .pad:
            return AnyInterfaceIdiom(.pad)
        case .tv:
            return AnyInterfaceIdiom(.tv)
        case .carPlay:
            return AnyInterfaceIdiom(.carPlay)
        case .mac:
            return AnyInterfaceIdiom(.mac)
        case .vision:
            return AnyInterfaceIdiom(.vision)
        @unknown default:
            return nil
        }
    }
}

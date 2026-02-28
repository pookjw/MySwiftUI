internal import MySwiftUICore
internal import UIKit

extension UIUserInterfaceSizeClass {
    init(_sizeClass: UserInterfaceSizeClass?) {
        guard let sizeClass = _sizeClass else {
            self = .unspecified
            return
        }
        
        switch sizeClass {
        case .compact:
            self = .compact
        case .regular:
            self = .regular
        @unknown default:
            self = .unspecified
        }
    }
}

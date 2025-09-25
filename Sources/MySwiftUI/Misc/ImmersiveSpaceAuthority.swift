#warning("TODO")
internal import UIKit

class ImmersiveSpaceAuthority {
    static let didChangeCurrentImmersiveSpace = Notification.Name(rawValue: "ImmersiveSpaceAuthorityDidChangeCurrentImmersiveSpace")
    static let didChangeImmersion = Notification.Name(rawValue: "ImmersiveSpaceAuthorityDidChangeImmersion")
    
    // TODO: Properties
    
    weak var immersiveSpaceScene: UIScene?
    var _immersion: Immersion
    
    init() {
        fatalError("TODO")
    }
}

internal import UIKit
private import MRUIKit

extension UIWindowScene {
    var windowProxy: WindowProxy? {
        guard !_MRUISceneSessionRoleRepresentsImmersiveSpace(self.session.role) else {
            return nil
        }
        
        guard let casted = self.delegate as? AppSceneDelegate else {
            return nil
        }
        
        let id: String?
        switch casted.sceneItemID {
        case .string(let _id):
            id = _id
        default:
            id = nil
        }
        
        return WindowProxy(id: id, backingScene: self)
    }
}

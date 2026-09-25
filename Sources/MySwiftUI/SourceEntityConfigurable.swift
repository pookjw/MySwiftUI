internal import UIKit
internal import _UIKitPrivate
private import Spatial

protocol SourceEntityConfigurable : AnyObject {
    var _sourceEntityId: UInt64 { get set }
    var _sourceEntitySize: UISize3D { get set }
}

extension SourceEntityConfigurable {
    func configureSourceEntity(with context: EntityPresentationContext?) {
        if let context {
            self._sourceEntityId = context.entityId
        } else {
            self._sourceEntityId = 0
        }
        
        if let context {
            self._sourceEntitySize = UISize3D(
                width: context.contentSize.width,
                height: context.contentSize.height,
                depth: context.contentSize.depth
            )
        } else {
            self._sourceEntitySize = .zero
        }
    }
}

extension UIPopoverPresentationController : SourceEntityConfigurable {
}

extension UISheetPresentationController : SourceEntityConfigurable {
}

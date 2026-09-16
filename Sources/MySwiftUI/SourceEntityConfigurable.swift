internal import UIKit
internal import _UIKitPrivate

protocol SourceEntityConfigurable : AnyObject {
    var _sourceEntityId: UInt64 { get set }
    var _sourceEntitySize: UISize3D { get set }
}

extension SourceEntityConfigurable {
    func configureSourceEntity(with context: EntityPresentationContext?) {
        assertUnimplemented()
    }
}

extension UIPopoverPresentationController : SourceEntityConfigurable {
    var _sourceEntityId: UInt64 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var _sourceEntitySize: UISize3D {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension UISheetPresentationController : SourceEntityConfigurable {
    var _sourceEntityId: UInt64 {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var _sourceEntitySize: UISize3D {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

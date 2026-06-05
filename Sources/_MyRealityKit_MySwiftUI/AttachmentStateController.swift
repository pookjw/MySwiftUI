@_spi(Reality) internal import MySwiftUI

class AttachmentStateControllerBase {
    init() {}
    
    func initialize<T : EntityRepresentable>(with: EntityRepresentableContext<T>) {
        preconditionFailure() // abstract
    }
}

final class AttachmentStateController<U> : AttachmentStateControllerBase {
    private var statesByID: [AnyHashable : AttachmentStateController<U>.AttachmentState]
    
    override init() {
        assertUnimplemented()
    }
    
    override func initialize<V>(with: EntityRepresentableContext<V>) {
        assertUnimplemented()
    }
    
    func updateAttachmentList<V: Sequence>(_: V, with environment: EnvironmentValues) where V.Element == U {
        assertUnimplemented()
    }
}

extension AttachmentStateController {
    final class AttachmentState {
        private var entity: ViewAttachmentEntity
        private var attachment: U
        
        init(attachment: U) {
            assertUnimplemented()
        }
        
        // TODO
    }
}

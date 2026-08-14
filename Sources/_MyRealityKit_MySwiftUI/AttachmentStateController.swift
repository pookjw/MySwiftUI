internal import MySwiftUI

class AttachmentStateControllerBase {
    init() {}
    
    func initialize<T : EntityRepresentable>(with context: EntityRepresentableContext<T>) {
        preconditionFailure() // abstract
    }
}

final class AttachmentStateController<U : AttachmentProtocol> : AttachmentStateControllerBase {
    private var statesByID: [AnyHashable : AttachmentStateController<U>.AttachmentState]
    
    var entities: RealityViewAttachments {
        let entities: [AnyHashable : ViewAttachmentEntity] = self.statesByID.mapValues { value in
            // $s19_RealityKit_SwiftUI25AttachmentStateControllerC8entitiesAA0A15ViewAttachmentsVvgAA0iE6EntityCAC0eF0Cyx_GXEfU_TA
            assertUnimplemented()
        }
        
        return RealityViewAttachments(
            entities: entities,
            children: nil
        )
    }
    
    override func initialize<V>(with context: EntityRepresentableContext<V>) {
        for state in self.statesByID.values {
            state.initialize(with: context)
        }
    }
    
    func updateAttachmentList<V: Sequence>(
        _ attachmentList: V,
        with environmentValues: EnvironmentValues
    ) where V.Element == U {
        /*
         self -> x20 -> x22
         attachmentList -> x0 -> x29 - 0x138
         environmentValues -> x1 -> x29 - 0x1b8
         */
        // <+616>
        // self.statesByID -> x28
        // x29 - 0x120 / x29 - 0x60
        var ids = Set(self.statesByID.keys)
        
        for attachment in attachmentList {
            // <+1292>
            if let state = self.statesByID[AnyHashable(attachment.id)] {
                // <+1504>
                state.attachment = attachment
            } else {
                // <+1608>
                self.statesByID[AnyHashable(attachment.id)] = Self.AttachmentState(attachment: attachment)
            }
            
            // <+1840>
            if let state = self.statesByID[AnyHashable(attachment.id)] {
                state.update(with: environmentValues)
            }
            
            // <+1016>
            ids.remove(attachment.id)
        }
        
        // <+1996>
        for id in ids {
            let existing = self.statesByID[AnyHashable(id)]
            self.statesByID[AnyHashable(id)] = nil
            
            if let existing {
                existing.willDestroy()
            }
        }
    }
    
    override init() {
        self.statesByID = Dictionary(minimumCapacity: 0)
        super.init()
    }
}

extension AttachmentStateController {
    final class AttachmentState/* : HostingEntityDelegate*/ {
        private var entity: ViewAttachmentEntity
        var attachment: U
        
        init(attachment: U) {
            assertUnimplemented()
        }
        
        func willDestroy() {
            assertUnimplemented()
        }
        
        func initialize<T : EntityRepresentable>(with context: EntityRepresentableContext<T>) {
            assertUnimplemented()
        }
        
        func update(with environmentValues: EnvironmentValues) {
            assertUnimplemented()
        }
    }
}

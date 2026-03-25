internal import UIKit

class AnyDragAndDropBridge: NSObject {
    func outermostDropResponder() -> (DragDropDefaultPreviewResponder & DropPayloadProvider)? {
        preconditionFailure() // abstract
    }
    
    func itemsInListForSession(_ session: UIDragSession) -> [UIDragItem] {
        preconditionFailure() // abstract
    }
}

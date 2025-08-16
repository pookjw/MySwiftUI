internal import UIKit

class AnyDragAndDropBridge: NSObject {
    func outermostDropResponder() -> (DragDropDefaultPreviewResponder & DropPayloadProvider)? {
        fatalError() // abstract
    }
    
    func itemsInListForSession(_ session: UIDragSession) -> [UIDragItem] {
        fatalError() // abstract
    }
}

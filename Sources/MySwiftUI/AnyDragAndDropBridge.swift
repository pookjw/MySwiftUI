internal import UIKit
private import MySwiftUICore

@MainActor
class AnyDragAndDropBridge : NSObject {
    func outermostDropResponder() -> (DragDropDefaultPreviewResponder & DropPayloadProvider)? {
        fatalError() // abstract
    }
    
    func itemsInListForSession(_ session: UIDragSession) -> [UIDragItem] {
        fatalError() // abstract
    }
}

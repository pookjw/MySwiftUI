#warning("TODO")
internal import UIKit

struct DropDestination {
    weak var responder: (DragDropDefaultPreviewResponder & DropPayloadProvider)? = nil
    var delegate: DropDelegate? = nil
    var operation: UIDropOperation = .cancel
    private let dropTargetStore: DropInfoTargetStore = DropInfoTargetStore()
    var hasGeneratedPreview: Bool = false
}

public protocol DropDelegate {
    
}

class DragDropDefaultPreviewResponder {
    
}

protocol DropPayloadProvider {
    
}

fileprivate class DropInfoTargetStore {
    var locations: [UIDragItem: CGPoint] = [:]
    var transforms: [UIDragItem: CGAffineTransform] = [:]
}

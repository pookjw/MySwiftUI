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
    var hasSeparatePreview: Bool {
        assertUnimplemented()
    }
    
    var previewSize: CGSize {
        assertUnimplemented()
    }
    
    var snapsBackOnCancellation: Bool {
        assertUnimplemented()
    }
    
    var previewParameters: UIDragPreviewParameters {
        assertUnimplemented()
    }
    
    func extendPrintTree(string: inout String) {
        assertUnimplemented()
    }
}

protocol DropPayloadProvider {
    var delegate: DropDelegate? { get }
}

fileprivate class DropInfoTargetStore {
    var locations: [UIDragItem: CGPoint] = [:]
    var transforms: [UIDragItem: CGAffineTransform] = [:]
}

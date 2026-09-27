internal import UIKit
internal import _UIKitShims

enum PresentationDimmingBehavior {
    case undimmedUpThrough(MySheetPresentationControllerDetentIdentifier)
    case always
    case backgroundInteractionEnabled
    
#if os(visionOS)
    func setLargestUndimmedDetentIdentifier(of sheet: UISheetPresentationController, detents: [MySheetPresentationControllerDetent]) {
        assertUnimplemented()
    }
#else
    func setLargestUndimmedDetentIdentifier(of sheet: UISheetPresentationController, detents: [UISheetPresentationController.Detent]) {
        assertUnimplemented()
    }
#endif
}

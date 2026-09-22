internal import UIKit
internal import _UIKitShims

enum PresentationDimmingBehavior {
    case undimmedUpThrough(MySheetPresentationControllerDetentIdentifier)
    case always
    case backgroundInteractionEnabled
}

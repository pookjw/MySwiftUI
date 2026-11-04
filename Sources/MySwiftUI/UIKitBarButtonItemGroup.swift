internal import UIKit
internal import MySwiftUICore
private import _MySwiftUICoreShims

final class UIKitBarButtonItemGroup : UIBarButtonItemGroup {
    private var groupItem: ToolbarStorage.GroupItem?
    private var edge: HorizontalEdge?
    private var viewController: UIViewController?

    override class func _isFromMySwiftUI() -> Bool {
        assertUnimplemented()
    }

    override init(barButtonItems: [UIBarButtonItem], representativeItem: UIBarButtonItem?) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    func didChangeGroupItem(from oldGroupItem: ToolbarStorage.GroupItem?) {
        assertUnimplemented()
    }
}

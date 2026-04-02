internal import MySwiftUICore
internal import UIKit

final class UIWindowLayoutHostingController<Content : View>: UIHostingController<Content> {
    override init(_hostingView: _UIHostingView<Content>) {
        assertUnimplemented()
    }
    
    @MainActor public dynamic required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    func setLayout(_ layout: AnyWindowLayout) {
        assertUnimplemented()
    }
    
    // TODO
}

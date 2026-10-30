// 97044434BF355299D05CCAF67303A1CB
internal import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

final class NavigationStackHostingController<Content : View>: UIHostingController<Content> {
    // TODO

    override init(rootView: Content) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override func _canShowWhileLocked() -> Bool {
        assertUnimplemented()
    }

    override func viewDidLoad() {
        assertUnimplemented()
    }
}

extension NavigationStackHostingController : UIHostingViewDelegate {
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, didMoveTo window: UIWindow?) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, willUpdate environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, didUpdate environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, willUpdate properties: inout ViewGraphBridgeProperties) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, didChangePreferences preferences: PreferenceValues) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, didChangePlatformItemList list: PlatformItemList) {
        assertUnimplemented()
    }
    
    func hostingView<Content1>(_ hostingView: _UIHostingView<Content1>, willModifyViewInputs inputs: inout _ViewInputs) {
        assertUnimplemented()
    }
}

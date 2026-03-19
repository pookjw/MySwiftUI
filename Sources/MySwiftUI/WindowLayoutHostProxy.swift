internal import MySwiftUICore

final class WindowLayoutHostProxy {
    private var host: ViewRendererHost
    private var viewType: View.Type
    
    init<Content: View>(rootView: Content) {
        assertUnimplemented()
    }
    
    func setLayout(_ layout: AnyWindowLayout) {
        assertUnimplemented()
    }
    
    func appendFeatures(volumetric: Bool) {
        assertUnimplemented()
    }
    
    static func removePendingLayoutHostProxy(id: SceneID) {
        assertUnimplemented()
    }
    
    static func pendingHost<Content: View>(item: SceneList.Item, rootViewType: Content.Type) -> UIHostingController<Content>? {
        assertUnimplemented()
    }
}

// 82134DA72AFD2B3FD1D089B9E66F9033
internal import MySwiftUICore

final class WindowLayoutHostProxy {
    fileprivate static nonisolated(unsafe) var layoutProxiesAwaitingConnection: [SceneID: WindowLayoutHostProxy] = [:]
    
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
    
    @_specialize(exported: true, where Content == ModifiedContent<AnyView, RootModifier>)
    static func pendingHost<Content: View>(item: SceneList.Item, rootViewType: Content.Type) -> UIHostingController<Content>? {
        assert(Content.self == ModifiedContent<AnyView, RootModifier>.self, "나머지는 검증이 필요함")
        
        guard let pending = WindowLayoutHostProxy.layoutProxiesAwaitingConnection.removeValue(forKey: item.id) else {
            return nil
        } 
        
        guard pending.viewType == Content.self else {
            return nil
        }
        
        guard let windowLayoutProvider = item.windowLayoutProvider else {
            return nil
        }
        
        let hostingView = unsafeBitCast(pending, to: _UIHostingView<Content>.self)
        hostingView.base.isHiddenForReuse = false
        
        return UIWindowLayoutHostingController(_hostingView: hostingView)
    }
}

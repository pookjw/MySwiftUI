// 82134DA72AFD2B3FD1D089B9E66F9033
internal import MySwiftUICore

final class WindowLayoutHostProxy {
    nonisolated(unsafe) fileprivate static var layoutProxiesAwaitingConnection: [SceneID: WindowLayoutHostProxy] = [:]
    
    private(set) var host: any ViewRendererHost
    private var viewType: any View.Type
    
    init<Content : View>(rootView: Content) {
        assertUnimplemented()
    }
    
    func setLayout(_ layout: AnyWindowLayout) {
        Update.ensure { 
            // $s7SwiftUI21WindowLayoutHostProxyC03setD0yyAA03AnycD0VFyyXEfU_TA
            assertUnimplemented()
        }
    }
    
    func appendFeatures(volumetric: Bool) {
        assertUnimplemented()
    }
    
    static func removePendingLayoutHostProxy(id: SceneID) {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    static func appendPendingLayoutHostProxy(id: SceneID, proxy: WindowLayoutHostProxy) {
        WindowLayoutHostProxy.layoutProxiesAwaitingConnection[id] = proxy
    }
    
    @specialized(where Content == ModifiedContent<AnyView, RootModifier>)
    static func pendingHost<Content : View>(item: SceneList.Item, rootViewType: Content.Type) -> UIHostingController<Content>? {
        assert(Content.self == ModifiedContent<AnyView, RootModifier>.self, "나머지는 검증이 필요함")
        
        guard let pending = unsafe WindowLayoutHostProxy.layoutProxiesAwaitingConnection.removeValue(forKey: item.id) else {
            return nil
        } 
        
        guard pending.viewType == Content.self else {
            return nil
        }
        
        guard let windowLayoutProvider = item.windowLayoutProvider else {
            return nil
        }
        
        let hostingView = unsafe unsafeBitCast(pending, to: _UIHostingView<Content>.self)
        hostingView.base.isHiddenForReuse = false
        
        return UIWindowLayoutHostingController(_hostingView: hostingView)
    }
}

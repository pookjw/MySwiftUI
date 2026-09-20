// F3616A22CCA61D36D2410A420C18D22D
internal import AttributeGraph
internal import MySwiftUICore

extension _GraphInputs {
    @inline(always) // 원래 없음
    var splitViewControllerProxy: WeakAttribute<UISplitViewControllerProxyStorage>? {
        get {
            return self[UISplitViewControllerProxyKey.self]
        }
        set {
            self[UISplitViewControllerProxyKey.self] = newValue
        }
    }
}

fileprivate struct UISplitViewControllerProxyKey : GraphInput {
    static var defaultValue: WeakAttribute<UISplitViewControllerProxyStorage>? {
        return nil
    }
}

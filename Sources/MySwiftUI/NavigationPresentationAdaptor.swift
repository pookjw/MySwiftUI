// 2B171006C45775298E4B361AC14E0DA3
internal import MySwiftUICore
internal import AttributeGraph

struct UINavigationPresentationAdaptorContext {
    // TODO
}

extension _GraphInputs {
    @inline(always) // 원래 없음
    var navigationPresentationAdaptorContext: OptionalAttribute<UINavigationPresentationAdaptorContext> {
        get {
            return self[_GraphInputs.NavigationPresentationAdaptorKey.self]
        }
        set {
            self[_GraphInputs.NavigationPresentationAdaptorKey.self] = newValue
        }
    }
    
    fileprivate struct NavigationPresentationAdaptorKey : GraphInput {
        static let defaultValue = OptionalAttribute<UINavigationPresentationAdaptorContext>() 
    }
}

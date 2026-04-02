internal import Combine
private import MySwiftUICore

struct MakeObservableObjectDelegateBox : ObservableObjectTypeVisitor {
    var value: Any
    var box: AnyFallbackDelegateBox?
    
    func visit<T>(type: T.Type) where T : ObservableObject {
        assertUnimplemented()
    }
}

protocol ObservableObjectTypeVisitor {
    func visit<T : ObservableObject>(type: T.Type)
}

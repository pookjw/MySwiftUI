public import MySwiftUICore

@preconcurrency @MainActor public struct DismissWindowAction {
    private var namespace: SceneList.Namespace = .app
    var presentationMode: Binding<PresentationMode>? = nil
    
    public func callAsFunction() {
        fatalError("TODO")
    }
    
    public func callAsFunction(id: String) {
        fatalError("TODO")
    }
    
    public func callAsFunction<D>(value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError("TODO")
    }
    
    public func callAsFunction<D>(id: String, value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    public var dismissWindow: DismissWindowAction {
        get {
            return self[DismissWindowActionKey.self]
        }
        set {
            self[DismissWindowActionKey.self] = newValue
        }
    }
}

fileprivate struct DismissWindowActionKey: EnvironmentKey {
    static let defaultValue = DismissWindowAction()
}

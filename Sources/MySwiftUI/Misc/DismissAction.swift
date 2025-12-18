public import MySwiftUICore

@MainActor @preconcurrency public struct DismissAction {
    public func callAsFunction() {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    public var dismiss: DismissAction {
        fatalError("TODO")
    }
    
    public var isPresented: Bool {
        fatalError("TODO")
    }
}

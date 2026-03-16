public import MySwiftUICore

@MainActor @preconcurrency public struct DismissAction {
    public func callAsFunction() {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    public var dismiss: DismissAction {
        assertUnimplemented()
    }
    
    public var isPresented: Bool {
        assertUnimplemented()
    }
}

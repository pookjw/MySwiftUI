public import MySwiftUICore

public struct Button<Label> : View where Label : View {
    @preconcurrency public init(action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var body: some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension Button : Sendable {
}

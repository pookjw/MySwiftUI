public import MySwiftUICore

@MainActor @preconcurrency public struct DismissAction {
    @Binding fileprivate private(set) var presentationMode: PresentationMode
    
    public func callAsFunction() {
        self.presentationMode.dismiss()
    }
}

extension EnvironmentValues {
    public var dismiss: DismissAction {
        return DismissAction(presentationMode: self.presentationMode)
    }
    
    public var isPresented: Bool {
        return self.presentationMode.wrappedValue.isPresented
    }
}

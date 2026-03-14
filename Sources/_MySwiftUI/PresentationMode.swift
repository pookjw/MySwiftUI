public import MySwiftUICore

public struct PresentationMode {
    public private(set) var isPresented: Bool
    
    init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    public mutating func dismiss() {
        fatalError("TODO")
    }
}

extension PresentationMode: Sendable {}

extension EnvironmentValues {
    public internal(set) var presentationMode: Binding<PresentationMode> {
        get {
            return self[PresentationModeKey.self]
        }
        set {
            self[PresentationModeKey.self] = newValue
        }
    }
}

fileprivate struct PresentationModeKey: EnvironmentKey {
    static let defaultValue = Binding<PresentationMode>.constant(PresentationMode(isPresented: false))
}

public import MySwiftUICore

public struct PresentationMode {
    public private(set) var isPresented: Bool
    
    init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    public mutating func dismiss() {
        assertUnimplemented()
    }
}

extension PresentationMode : Sendable {}

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

fileprivate struct PresentationModeKey : EnvironmentKey {
    static let defaultValue = Binding<PresentationMode>.constant(PresentationMode(isPresented: false))
}

extension PresentationMode {
    struct FromIsPresented : Projection {
        typealias Base = Bool
        typealias Projected = PresentationMode
        
        func get(base: Bool) -> PresentationMode {
            return PresentationMode(isPresented: base)
        }
        
        func set(base: inout Bool, newValue: PresentationMode) {
            base = newValue.isPresented
        }
    }
}

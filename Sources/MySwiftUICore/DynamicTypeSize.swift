#warning("TODO")

public enum DynamicTypeSize : Hashable, Comparable, CaseIterable, Sendable {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    case xxxLarge
    case accessibility1
    case accessibility2
    case accessibility3
    case accessibility4
    case accessibility5
    
    public var isAccessibilitySize: Bool {
        fatalError("TODO")
    }
    
    static var systemDefault: DynamicTypeSize {
        fatalError()
    }
}

extension EnvironmentValues {
    public var dynamicTypeSize: DynamicTypeSize {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}

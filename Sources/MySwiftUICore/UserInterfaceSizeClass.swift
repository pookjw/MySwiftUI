public enum UserInterfaceSizeClass: Sendable, Hashable {
    case compact
    case regular
}

extension EnvironmentValues {
    public var horizontalSizeClass: UserInterfaceSizeClass? {
        get {
            return self[HorizontalUserInterfaceSizeClassKey.self]
        }
        set {
            self[HorizontalUserInterfaceSizeClassKey.self] = newValue
        }
    }
    
    @usableFromInline
    var realHorizontalSizeClass: UserInterfaceSizeClass? {
        get {
            return horizontalSizeClass
        }
        set {
            horizontalSizeClass = newValue
        }
    }
    
    public var verticalSizeClass: UserInterfaceSizeClass? {
        get {
            return self[VerticalUserInterfaceSizeClassKey.self]
        }
        set {
            self[VerticalUserInterfaceSizeClassKey.self] = newValue
        }
    }
    
    @usableFromInline
    var realVerticalSizeClass: UserInterfaceSizeClass? {
        get {
            return verticalSizeClass
        }
        set {
            verticalSizeClass = newValue
        }
    }
}

fileprivate struct HorizontalUserInterfaceSizeClassKey: EnvironmentKey {
    static var defaultValue: UserInterfaceSizeClass? {
        return nil
    }
}

fileprivate struct VerticalUserInterfaceSizeClassKey: EnvironmentKey {
    static var defaultValue: UserInterfaceSizeClass? {
        return nil
    }
}

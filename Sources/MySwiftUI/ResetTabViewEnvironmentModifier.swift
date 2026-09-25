// 46AF493CB757ED2F6F4798255A451BB8
public import MySwiftUICore
private import AttributeGraph

extension View {
    func resetTabViewEnvironment() -> some View {
        self.modifier(ResetTabViewEnvironmentModifier())
    }
}

fileprivate struct ResetTabViewEnvironmentModifier : EnvironmentModifier, PrimitiveViewModifier {
    static func makeEnvironment(modifier: Attribute<ResetTabViewEnvironmentModifier>, environment: inout EnvironmentValues) {
        environment.tabBarPlacement = nil
        environment.isTabBarShowingSections = false
    }
}

extension EnvironmentValues {
    public fileprivate(set) var tabBarPlacement: TabBarPlacement? {
        get {
            return self[TabBarPlacementKey.self]
        }
        set {
            self[TabBarPlacementKey.self] = newValue
        }
    }
    
    public fileprivate(set) var isTabBarShowingSections: Bool {
        get {
            return self[IsTabBarShowingSectionsKey.self]
        }
        set {
            self[IsTabBarShowingSectionsKey.self] = newValue
        }
    }
}

fileprivate struct TabBarPlacementKey : EnvironmentKey {
    static var defaultValue: TabBarPlacement? {
        return nil
    }
}

fileprivate struct IsTabBarShowingSectionsKey : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}

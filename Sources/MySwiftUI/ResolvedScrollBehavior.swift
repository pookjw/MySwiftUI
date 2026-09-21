// FAAD6984F31E64B6B32B1CA0954A3C9B
private import AttributeGraph
private import MySwiftUICore

struct ResolvedScrollBehavior : Equatable {
    private var base: any ScrollTargetBehavior
    private var baseSeed: UInt32
    private var axes: Axis.Set?
    @WeakAttribute private var collections: [ScrollableCollection]?
    @WeakAttribute private var targets: [ScrollableCollection]?
    @WeakAttribute private var environment: EnvironmentValues?
    
    static func == (lhs: ResolvedScrollBehavior, rhs: ResolvedScrollBehavior) -> Bool {
        assertUnimplemented()
    }
}

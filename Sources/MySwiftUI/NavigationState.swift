// D6901E90061344656248AB2898527223
internal import MySwiftUICore

struct NavigationState {
    // TODO
}

extension NavigationState {
    struct SelectionSeed {
        static let invalid: NavigationState.SelectionSeed = {
            assertUnimplemented()
        }()
        
        static let empty: NavigationState.SelectionSeed = {
            assertUnimplemented()
        }()
        
        private var storage: VersionSeed
    }
}

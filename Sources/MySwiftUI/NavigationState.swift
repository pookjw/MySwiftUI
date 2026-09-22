// D6901E90061344656248AB2898527223
internal import MySwiftUICore

struct NavigationState {
    // TODO
}

extension NavigationState {
    struct Seeds {
        // TODO
    }
    
    struct StackContent {
        // TODO
    }
    
    struct ListKey {
        // TODO
    }
    
    struct SelectionSeed {
        static let invalid = NavigationState.SelectionSeed(storage: .invalid)
        static let empty = NavigationState.SelectionSeed(storage: .empty)
        
        private var storage: VersionSeed
    }
}

extension NavigationState.StackContent {
    struct Key {
        // TODO
    }
}

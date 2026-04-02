struct UpdateScrollStateRequestKey : PreferenceKey {
    static var defaultValue: [ScrollStateRequest] {
        return []
    }
    
    static func reduce(value: inout [any ScrollStateRequest], nextValue: () -> [any ScrollStateRequest]) {
        assertUnimplemented()
    }
}

protocol ScrollStateRequest {
    // TODO
}

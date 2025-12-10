struct ScrollablePreferenceKey: PreferenceKey {
    static func reduce(value: inout [any Scrollable], nextValue: () -> [any Scrollable]) {
        fatalError("TODO")
    }
    
    static var defaultValue: [any Scrollable] {
        return []
    }
}

protocol Scrollable {
    // TODO
}

protocol ScrollableCollection: Scrollable {
    // TODO
}

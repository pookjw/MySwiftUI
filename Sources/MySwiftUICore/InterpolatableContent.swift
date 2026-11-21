protocol InterpolatableContent {
    static var defaultTransition: ContentTransition { get }
    func requiresTransition(to other: Self) -> Bool
    var appliesTransitionsForSizeChanges: Bool { get }
    var addsDrawingGroup: Bool { get }
    func modifyTransition(state: inout ContentTransition.State, to other: Self)
    func defaultAnimation(to other: Self) -> Animation?
}

extension InterpolatableContent {
    static var defaultTransition: ContentTransition {
        assertUnimplemented()
    }
    
    func defaultAnimation(to other: Self) -> Animation? {
        assertUnimplemented()
    }
}

extension InterpolatableContent where Self : Equatable {
    func requiresTransition(to other: Self) -> Bool {
        assertUnimplemented()
    }
    
    var appliesTransitionsForSizeChanges: Bool {
        assertUnimplemented()
    }
    
    var addsDrawingGroup: Bool {
        assertUnimplemented()
    }
}

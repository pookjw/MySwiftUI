
struct AnyNavigationLinkPresentedValue {
    private var storage: any AnyNavigationLinkPresentedValueStorageProtocol
}

fileprivate protocol AnyNavigationLinkPresentedValueStorageProtocol {
    
}

extension AnyNavigationLinkPresentedValue : Hashable, CustomStringConvertible {
    static func == (lhs: AnyNavigationLinkPresentedValue, rhs: AnyNavigationLinkPresentedValue) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}

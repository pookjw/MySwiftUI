internal import MySwiftUICore

struct UpdateViewDestinationRequest {
//    private var navigationAuthority: NavigationAuthority?
//    private var request: NavigationRequest?
}

extension UpdateViewDestinationRequest {
    struct UpdateViewDestinationRequestKey: HostPreferenceKey {
        static nonisolated(unsafe) let defaultValue: [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest] = [:]
        
        static func reduce(value: inout [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest], nextValue: () -> [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest]) {
            assertUnimplemented()
        }
        
        static var _isReadableByHost: Bool {
            assertUnimplemented()
        }
        
        static var _includesRemovedValues: Bool {
            assertUnimplemented()
        }
    }
}

struct NavigationLinkSelectionIdentifier: Hashable {
    static func == (lhs: NavigationLinkSelectionIdentifier, rhs: NavigationLinkSelectionIdentifier) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    private var navigationLinkValue: AnyNavigationLinkPresentedValue?
    private var viewListID: _ViewList_ID.Canonical?
    private var namespace: Namespace.ID
}

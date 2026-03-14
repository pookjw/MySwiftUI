internal import MySwiftUICore

struct UpdateViewDestinationRequest {
//    private var navigationAuthority: NavigationAuthority?
//    private var request: NavigationRequest?
}

extension UpdateViewDestinationRequest {
    struct UpdateViewDestinationRequestKey: HostPreferenceKey {
        static nonisolated(unsafe) let defaultValue: [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest] = [:]
        
        static func reduce(value: inout [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest], nextValue: () -> [NavigationLinkSelectionIdentifier: UpdateViewDestinationRequest]) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}

struct NavigationLinkSelectionIdentifier: Hashable {
    static func == (lhs: NavigationLinkSelectionIdentifier, rhs: NavigationLinkSelectionIdentifier) -> Bool {
        fatalError("TODO")
    }
    
    func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
    
    private var navigationLinkValue: AnyNavigationLinkPresentedValue?
    private var viewListID: _ViewList_ID.Canonical?
    private var namespace: Namespace.ID
}

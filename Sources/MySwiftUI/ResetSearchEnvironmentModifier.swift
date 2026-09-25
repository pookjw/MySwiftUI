// 366134F59E114783B313E1ABD2826F8F
internal import MySwiftUICore
private import AttributeGraph

extension View {
    func resetSearchEnvironment() -> some View {
        self.modifier(ResetSearchEnvironmentModifier())
    }
}

fileprivate struct ResetSearchEnvironmentModifier : EnvironmentModifier, PrimitiveViewModifier {
    static func makeEnvironment(modifier: Attribute<ResetSearchEnvironmentModifier>, environment: inout EnvironmentValues) {
        if case .toolbarPrincipal = environment.searchFieldPlacement {
            environment.toolbarRole = nil
        }
        
        // <+100>
        environment.searchFieldPlacement = .none
        environment.searchFieldToolbarItemPlacement = nil
        environment.searchStorage = nil
        environment.isSearching = false
        environment.searchScopeActivation = .automatic
        environment.searchFocusContext = nil
        environment.searchTextClearAction = nil
    }
}

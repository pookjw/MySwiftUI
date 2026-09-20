// 7806EB54B6D0C9EA7E02D9216014E5DD
internal import MySwiftUICore
internal import AttributeGraph

struct NavigationAuthority {
    // TODO
}

extension NavigationAuthority {
    fileprivate struct SeedInputs : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.Seeds>? {
            return nil
        }
    }
    
    struct DepthKey {
        // TODO
    }
    
    struct ViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationAuthority>? {
            return nil
        }
    }
    
    struct StackKeyViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.StackContent.Key>? {
            return nil
        }
    }
    
    fileprivate struct ListKeyViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.ListKey>? {
            return nil
        }
    }
    
    fileprivate struct ListSelectionCanonicalIDKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<_ViewList_ID.Canonical>? {
            return nil
        }
    }
    
    enum RequestError {
        case presentationTypeMismatch(presented: String, expected: String)
        case listSelectionTypeMismatch(presented: String)
        case noDestinationInScope(presented: String)
        case noSubsequentColumn(presented: String)
        case noSubsequentColumnForItem(presented: String)
        case noSubsequentColumnForView
        case stackPresentedOntoColumn
    }
}

struct IsInNavigationV4Context : PropertyKey, ViewInputBoolFlag {
}

extension View {
    func clearNavigationContext() -> some View {
        self
            .modifier(ClearNavigationContextModifier())
            .environment(\.isNavigationEnabledInternal, .unknown)
            .environment(\.navigationSelectionSeed, .invalid)
    }
}

struct ClearNavigationContextModifier : PrimitiveViewModifier, ViewInputsModifier {
    nonisolated static func _makeViewInputs(modifier: _GraphValue<ClearNavigationContextModifier>, inputs: inout _ViewInputs) {
        // inputs -> x1 -> x19
        inputs[NavigationAuthority.StackKeyViewInputKey.self] = nil
        inputs[NavigationAuthority.ListKeyViewInputKey.self] = nil
        inputs[NavigationAuthority.ViewInputKey.self] = nil
        inputs[IsInNavigationV4Context.self] = false
        inputs[NavigationAuthority.SeedInputs.self] = nil
        
        inputs.base.resetCurrentStyleableView()
        
        // <+236>
        inputs[NavigationAuthority.ListSelectionCanonicalIDKey.self] = nil
        inputs.base.splitViewControllerProxy = nil
        inputs.base.navigationPresentationAdaptorContext = OptionalAttribute()
    }
}

// 7806EB54B6D0C9EA7E02D9216014E5DD
internal import MySwiftUICore
internal import AttributeGraph

struct NavigationAuthority {
    // TODO
}

extension NavigationAuthority {
    fileprivate struct SeedInputs : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.Seeds> {
            return WeakAttribute()
        }
    }
    
    struct DepthKey {
        // TODO
    }
    
    struct ViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationAuthority?> {
            return WeakAttribute()
        }
    }
    
    struct StackKeyViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.StackContent.Key?> {
            return WeakAttribute()
        }
    }
    
    fileprivate struct ListKeyViewInputKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<NavigationState.ListKey?> {
            return WeakAttribute()
        }
    }
    
    fileprivate struct ListSelectionCanonicalIDKey : ViewInput, PropertyKey {
        static var defaultValue: WeakAttribute<_ViewList_ID.Canonical?> {
            return WeakAttribute()
        }
    }
    
    enum RequestError : Error {
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
        inputs[NavigationAuthority.StackKeyViewInputKey.self] = WeakAttribute()
        inputs[NavigationAuthority.ListKeyViewInputKey.self] = WeakAttribute()
        inputs[NavigationAuthority.ViewInputKey.self] = WeakAttribute()
        inputs[IsInNavigationV4Context.self] = false
        inputs[NavigationAuthority.SeedInputs.self] = WeakAttribute()
        
        inputs.base.resetCurrentStyleableView()
        
        // <+236>
        inputs[NavigationAuthority.ListSelectionCanonicalIDKey.self] = WeakAttribute()
        inputs.base.splitViewControllerProxy = WeakAttribute()
        inputs.base.navigationPresentationAdaptorContext = OptionalAttribute()
    }
}

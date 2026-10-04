@_spi(Internal) internal import MySwiftUICore
private import AttributeGraph

enum SwipeActions {
    struct Feature : ViewGraphFeature {
        private var swipeActions: WeakAttribute<SwipeActions.Value>?
        
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            inputs.preferences.add(SwipeActions.Key.self)
        }
        
        mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            self.swipeActions = WeakAttribute(outputs[SwipeActions.Key.self])
        }
    }
    
    struct Key : PreferenceKey {
        static let defaultValue = SwipeActions.Value(leading: nil, trailing: nil)
        
        static func reduce(value: inout SwipeActions.Value, nextValue: () -> SwipeActions.Value) {
            assertUnimplemented()
        }
    }
    
    struct Value {
        fileprivate private(set) var leading: SwipeActions.Configuration?
        fileprivate private(set) var trailing: SwipeActions.Configuration?
    }
    
    struct Configuration {
        // TODO
    }
}

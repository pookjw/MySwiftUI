@_spi(Internal) internal import MySwiftUICore

enum SwipeActions {
    struct Feature : ViewGraphFeature {
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            inputs.preferences.add(SwipeActions.Key.self)
        }
        
        func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            assertUnimplemented()
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

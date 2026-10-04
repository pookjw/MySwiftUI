@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph
internal import CoreGraphics

enum SwipeActions {
    struct Feature : ViewGraphFeature {
        private(set) var swipeActions: WeakAttribute<SwipeActions.Value>?
        
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            inputs.preferences.add(SwipeActions.Key.self)
        }
        
        mutating func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            self.swipeActions = WeakAttribute(outputs[SwipeActions.Key.self])
        }
    }
    
    struct Key : PreferenceKey {
        @safe static nonisolated(unsafe) let defaultValue = SwipeActions.Value(leading: nil, trailing: nil)
        
        static func reduce(value: inout SwipeActions.Value, nextValue: () -> SwipeActions.Value) {
            assertUnimplemented()
        }
    }
    
    struct Value {
        private(set) var leading: SwipeActions.Configuration?
        private(set) var trailing: SwipeActions.Configuration?
    }
    
    struct Configuration {
        private var allowsFullSwipe: Bool // 0x0
        private var edge: HorizontalEdge // 0x1
        private var style: SwipeActionsStyle // 0x8
        private var itemList: PlatformItemList // 0x18
        private var isPresented: Binding<Bool>? // 0x20
        private(set) var resultToken: Binding<SwipeActionResultToken?>? // 0x38
    }
}

struct SwipeActionsStyle {
    private var storage: SwipeActionsStyle.Storage
}

extension SwipeActionsStyle {
    enum Storage {
        case rounded(radius: CGFloat?)
        case automatic
        case standard
    }
}

struct SwipeActionResultToken {
    let role: ButtonRole
    private(set) var completion: ((Bool) -> Void)?
    private(set) var performDestructiveAction: (() -> Void)?
}

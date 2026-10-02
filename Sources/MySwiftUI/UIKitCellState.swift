// 66E45C4729D0D0FEA1B1BE7BA175BEC8
internal import MySwiftUICore

struct UIKitCellState : Equatable {
    private(set) var isEditing: Bool
    private(set) var isSelected: Bool
    private(set) var isPinned: Bool
    private(set) var isFocused: Bool
}

extension EnvironmentValues {
    var uiKitCellState: UIKitCellState {
        get {
            return self[UIKitCellStateKey.self]
        }
        set {
            self[UIKitCellStateKey.self] = newValue
        }
    }
}

fileprivate struct UIKitCellStateKey : EnvironmentKey {
    static var defaultValue: UIKitCellState {
        return UIKitCellState(isEditing: false, isSelected: false, isPinned: false, isFocused: false)
    }
}

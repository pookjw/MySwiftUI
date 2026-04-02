// 254C3FE5924A018B482F2F0C0D49154F
internal import MySwiftUICore

public struct KeyboardShortcut : Sendable {
//    private var key: KeyEquivalent
//    private var modifiers: EventModifiers
//    private var localization: KeyboardShortcut.Localization
}

extension KeyboardShortcut : Hashable {
    
}

extension EnvironmentValues {
    var sceneKeyboardShortcuts: [SceneID: KeyboardShortcut] {
        get {
            return self[EnvironmentValues.SceneKeyboardShortcutsKey.self]
        }
        set {
            self[EnvironmentValues.SceneKeyboardShortcutsKey.self] = newValue
        }
    }
    
    fileprivate struct SceneKeyboardShortcutsKey : EnvironmentKey {
        static var defaultValue: [SceneID: KeyboardShortcut] {
            assertUnimplemented()
        }
    }
}

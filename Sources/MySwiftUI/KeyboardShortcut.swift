// 254C3FE5924A018B482F2F0C0D49154F
internal import MySwiftUICore

public struct KeyboardShortcut : Sendable {
    private var key: KeyEquivalent
    private var modifiers: EventModifiers
    private var localization: KeyboardShortcut.Localization
}

extension KeyboardShortcut {
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct Localization : Sendable {
        public static let automatic = KeyboardShortcut.Localization(style: .automatic)
        public static let withoutMirroring = KeyboardShortcut.Localization(style: .withoutMirroring)
        public static let custom = KeyboardShortcut.Localization(style: .custom)
        
        private let style: KeyboardShortcut.Localization.Style
    }
}

extension KeyboardShortcut.Localization {
    enum Style {
        case automatic
        case withoutMirroring
        case custom
    }
}

extension KeyboardShortcut : Hashable {
    public static func == (lhs: KeyboardShortcut, rhs: KeyboardShortcut) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
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

// 254C3FE5924A018B482F2F0C0D49154F
internal import MySwiftUICore
internal import UIKit

public struct KeyboardShortcut : Sendable {
    public var key: KeyEquivalent
    public var modifiers: EventModifiers
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var localization: KeyboardShortcut.Localization
    
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command) {
        self.key = key
        self.modifiers = modifiers
        self.localization = .automatic
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization) {
        self.key = key
        self.modifiers = modifiers
        self.localization = localization
    }
    
    init?(_ command: UIKeyCommand) {
        assertUnimplemented()
    }
}

extension KeyboardShortcut {
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var cancelAction: KeyboardShortcut {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var defaultAction: KeyboardShortcut {
        assertUnimplemented()
    }
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
    enum Style : Hashable {
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

extension EnvironmentValues {
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var keyboardShortcut: KeyboardShortcut? {
        return self[ButtonKeyboardShortcutKey.self]
    }
}

fileprivate struct ButtonKeyboardShortcutKey : EnvironmentKey {
    static var defaultValue: KeyboardShortcut? {
        return nil
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {
    nonisolated public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> some View {
        assertUnimplemented()
    }
    
    nonisolated public func keyboardShortcut(_ shortcut: KeyboardShortcut) -> some View {
        assertUnimplemented()
    }
    
    @available(iOS 15.4, macOS 12.3, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func keyboardShortcut(_ shortcut: KeyboardShortcut?) -> some View {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    nonisolated public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization) -> some View {
        assertUnimplemented()
    }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension View {
    @_spi(Internal) nonisolated public func pickerKeyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command) -> some View {
        assertUnimplemented()
    }
    
    @_spi(Internal) nonisolated public func pickerKeyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization) -> some View {
        assertUnimplemented()
    }
    
    @_spi(Internal) nonisolated public func pickerKeyboardShortcut(_ shortcut: KeyboardShortcut?) -> some View {
        assertUnimplemented()
    }
}

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension Scene {
    nonisolated public func keyboardShortcut(_ key: KeyEquivalent, modifiers: EventModifiers = .command, localization: KeyboardShortcut.Localization = .automatic) -> some Scene {
        assertUnimplemented()
    }
    
    nonisolated public func keyboardShortcut(_ shortcut: KeyboardShortcut?) -> some Scene {
        assertUnimplemented()
    }
}

internal import Foundation
internal import MySwiftUICore
private import UIKit

class KeyboardShortcutBridge: NSObject {
    private var currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f0
    private var updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f8
    private var shortcutMap: [KeyboardShortcut: KeyboardShortcutBridge.Shortcut] = [:] // 0xdb0
    private var isObservingPreferences: Bool = false // 0x608
    
    override init() {
        super.init()
    }
    
    final func flushKeyCommands(_: KeyboardShortcutSource?) {
        fatalError("TODO")
    }
    
    @inline(__always)
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        guard isObservingPreferences else {
            return
        }
        
        self.updatedBindings = preferences[KeyboardShortcutBindingsKey.self]
    }
    
    // TODO
}

extension KeyboardShortcutBridge {
    struct Shortcut {
        private var uiKeyCommand: UIKeyCommand
        private var action: () -> Void
    }
}

struct KeyboardShortcutBinding {
    // TODO
}

struct KeyboardShortcutBindingsKey: HostPreferenceKey {
    static var defaultValue: [KeyboardShortcutBinding] {
        fatalError("TODO")
    }
    
    static func reduce(value: inout [KeyboardShortcutBinding], nextValue: () -> [KeyboardShortcutBinding]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

protocol KeyboardShortcutSource {
    // TODO
}

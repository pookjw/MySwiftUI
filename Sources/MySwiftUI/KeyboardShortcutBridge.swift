internal import Foundation
internal import MySwiftUICore
private import UIKit

final class KeyboardShortcutBridge: NSObject {
    private var currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f0
    private var updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f8
    private var shortcutMap: [KeyboardShortcut: KeyboardShortcutBridge.Shortcut] = [:] // 0xdb0
    private var isObservingPreferences: Bool = false // 0x608
    
    override init() {
        super.init()
    }
    
    func flushKeyCommands(_ source: KeyboardShortcutSource?) {
        /*
         self -> x20
         source -> x0 -> x29 - 0xa0
         */
        // <+176>
        // self -> x20 -> x29 - 0xb0
        if !self.shortcutMap.isEmpty {
            fatalError("TODO")
        }
        
        // <+528>
        self.shortcutMap = [:]
        self.currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
        self.updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
    }
    
    @inline(__always)
    func preferencesDidChange(_ preferences: PreferenceValues) {
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

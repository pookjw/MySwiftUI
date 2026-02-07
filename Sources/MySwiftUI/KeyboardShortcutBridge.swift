internal import Foundation
private import MySwiftUICore
private import UIKit

class KeyboardShortcutBridge: NSObject {
    private var currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
    private var updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
    private var shortcutMap: [KeyboardShortcut: KeyboardShortcutBridge.Shortcut] = [:]
    private var isObservingPreferences: Bool = false
    
    override init() {
        super.init()
    }
    
    final func flushKeyCommands(_: KeyboardShortcutSource?) {
        fatalError("TODO")
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
    static var defaultValue: Never {
        fatalError("TODO")
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
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

internal import Foundation
@_spi(Internal) internal import MySwiftUICore
private import UIKit

@MainActor
final class KeyboardShortcutBridge : NSObject {
    private var currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f0
    var updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid) // 0x5f8
    private var shortcutMap: [KeyboardShortcut: KeyboardShortcutBridge.Shortcut] = [:] // 0xdb0
    var isObservingPreferences: Bool = false // 0x608
    
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
            assertUnimplemented()
        }
        
        // <+528>
        self.shortcutMap = [:]
        self.currentBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
        self.updatedBindings = PreferenceValues.Value<[KeyboardShortcutBinding]>(value: [], seed: .invalid)
    }
    
    @inline(always)
    func preferencesDidChange(_ preferences: PreferenceValues) {
        guard isObservingPreferences else {
            return
        }
        
        self.updatedBindings = preferences[KeyboardShortcutBindingsKey.self]
    }
    
    func updateKeyCommands(_ source: KeyboardShortcutSource?) {
        /*
         self -> x20 -> x28
         source -> x0 -> x29 - 0x178
         */
        // <+532>
        guard !self.updatedBindings.seed.matches(self.currentBindings.seed) else {
            return
        }
        
        for change in CollectionChanges(from: self.currentBindings.value, to: self.updatedBindings.value) {
            // <+1172>
            switch change {
            case .removed(let indices):
                // <+1552>
                for index in indices.reversed() {
                    let binding = self.currentBindings.value[index]
                    
                    if let shortcut = self.shortcutMap[binding.shortcut] {
                        if let source {
                            source.removeShortcut(shortcut)
                        }
                        
                        self.shortcutMap.removeValue(forKey: binding.shortcut)
                    }
                }
            case .inserted(let indices):
                // <+2324>
                for index in indices {
                    let binding = self.updatedBindings.value[index]
                    let command = UIKeyCommand(binding)
                    
                    if self.shortcutMap[binding.shortcut] == nil {
                        let shortcut = KeyboardShortcutBridge.Shortcut(uiKeyCommand: command, action: binding.action)
                        
                        if let source {
                            source.addShortcut(shortcut)
                        }
                        
                        self.shortcutMap[binding.shortcut] = shortcut
                    }
                }
            case .matched(_, let indices):
                // <+3248>
                for index in indices {
                    let binding = self.updatedBindings.value[index]
                    
                    if var shortcut = self.shortcutMap[binding.shortcut] {
                        shortcut.action = binding.action
                        self.shortcutMap[binding.shortcut] = shortcut
                    } else {
                        let command = UIKeyCommand(binding)
                        let shortcut = KeyboardShortcutBridge.Shortcut(uiKeyCommand: command, action: binding.action)
                        
                        if let source {
                            source.addShortcut(shortcut)
                        }
                        
                        self.shortcutMap[binding.shortcut] = shortcut
                    }
                }
            }
        }
        
        self.currentBindings = self.updatedBindings
    }
    
    // TODO
}

extension KeyboardShortcutBridge {
    struct Shortcut {
        fileprivate private(set) var uiKeyCommand: UIKeyCommand
        fileprivate var action: () -> Void
    }
}

struct KeyboardShortcutBinding {
    fileprivate private(set) var shortcut: KeyboardShortcut
    fileprivate private(set) var action: () -> Void
    private var title: String?
}

struct KeyboardShortcutBindingsKey : HostPreferenceKey {
    static var defaultValue: [KeyboardShortcutBinding] {
        return []
    }
    
    static func reduce(value: inout [KeyboardShortcutBinding], nextValue: () -> [KeyboardShortcutBinding]) {
        assertUnimplemented()
    }
    
    static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    static var _includesRemovedValues: Bool {
        assertUnimplemented()
    }
}

protocol KeyboardShortcutSource {
    func addShortcut(_ shortcut: KeyboardShortcutBridge.Shortcut)
    func removeShortcut(_ shortcut: KeyboardShortcutBridge.Shortcut)
}

extension KeyboardShortcutBinding : Hashable {
    static func == (lhs: KeyboardShortcutBinding, rhs: KeyboardShortcutBinding) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension UIKeyCommand {
    convenience init(_: KeyboardShortcutBinding) {
        assertUnimplemented()
    }
}

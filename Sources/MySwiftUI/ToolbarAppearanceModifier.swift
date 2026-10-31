// 3D0A5FA8455C04EDCEBBD3CEA14D2692
@_spi(Internal) internal import MySwiftUICore

struct ToolbarAppearanceModifier : MultiViewModifier, PrimitiveViewModifier {
    // TODO

    nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension BarAppearanceBridge {
    func updateAllowedBars(_ roles: Set<ToolbarPlacement.Role>, viewGraph: ViewGraph) {
        /*
         self -> x20
         roles -> x0 -> x19
         viewGraph -> x1 -> x21
         */
        // x22
        let subtracting1 = self.allowedBars.subtracting(roles)
        // x24
        let subtracting2 = roles.subtracting(self.allowedBars)
        
        subtracting1.updatePreferences(viewGraph: viewGraph, tracker: &self.seedTracker, isAdding: false)
        subtracting2.updatePreferences(viewGraph: viewGraph, tracker: &self.seedTracker, isAdding: true)
        
        // <+232>
        self.allowedBars = roles
    }
    
    @inline(always) // 원래 없음
    func updateBarConfigurations(role: ToolbarPlacement.Role, preferences: PreferenceValues) -> Bool {
        // self.updateContext -> x24 -> x19 + 0x40
        // self -> x26 -> x19 + 0xa8
        
        /*
         self -> x20 -> x26
         preferenceValues -> x0 -> x19 + 0x70
         */
        // self.updateContext -> x24
        // self.updateContext -> x24 -> x19 + 0x40
        // roles -> x23, x19 + 0x38
        // self -> x26 -> x19 + 0xa8
        // role -> x29 - 0x98
        
        // x29 - 0xf0
        let copy_1 = self.updateContext
        // x24 -> x19 + 0xd0
        var newConfiguration = preferences.configuration(toolbarPlacement: role).value
        
        // <+1116>
        if role == .navigationBar, let copy_2 = copy_1 {
            // <+1156>
            // copy_2 -> x19 + 0xd8
            // x19 + 0x130
            let copy_3 = copy_2
            if !copy_3.navigationAdaptor.adaptors.isEmpty {
                // <+1216>
                var options: UINavigationItemAdaptorOptions = []
                
                for adaptor in copy_3.navigationAdaptor.adaptors {
                    options.formUnion(adaptor.base.options)
                }
                
                if options.contains(.disableUpdates) {
                    newConfiguration.allowsUpdates = false
                }
                
                // <+1508>
                // <+1520>
            } else {
                // <+1464>
                // <+1520>
            }
        } else {
            // <+1372>/<+1396>
            // <+1436>
            // <+1520>
        }
        
        // <+1520>
        // x19 + 0xc8
        let oldConfiguration: ToolbarAppearanceConfiguration? = barConfigurations[role]
        // <+1712>
        // x19 + 0x88
        if oldConfiguration != newConfiguration {
            // <+1808>
            self.barConfigurations[role] = newConfiguration
            // <+2280>
            // x19 + 0x130
            self.toUpdateBars.update(with: role)
            return true
        } else {
            // <+2548>
            return false
        }
    }
}

extension Set where Element == ToolbarPlacement.Role {
    fileprivate func updatePreferences(viewGraph: ViewGraph, tracker: inout VersionSeedSetTracker, isAdding: Bool) {
        /*
         self -> x3 -> x19
         viewGraph -> x0 -> x23
         tracker -> x1 -> x22
         isAdding -> x2 -> x21
         */
        for role in self {
            role.updatePreference(viewGraph: viewGraph, tracker: &tracker, isAdding: isAdding)
        }
    }
}

extension ToolbarPlacement.Role {
    fileprivate func updatePreference(viewGraph: ViewGraph, tracker: inout VersionSeedSetTracker, isAdding: Bool) {
        switch self {
        case .accessoryBar(_):
            if isAdding {
                viewGraph.addPreference(AccessoryBarAppearanceKey.self)
                tracker.addPreference(AccessoryBarAppearanceKey.self)
            } else {
                viewGraph.removePreference(AccessoryBarAppearanceKey.self)
                tracker.removePreference(AccessoryBarAppearanceKey.self)
            }
        case .navigationBar:
            if isAdding {
                viewGraph.addPreference(NavigationBarAppearanceKey.self)
                tracker.addPreference(NavigationBarAppearanceKey.self)
            } else {
                viewGraph.removePreference(NavigationBarAppearanceKey.self)
                tracker.removePreference(NavigationBarAppearanceKey.self)
            }
        case .windowToolbarItems:
            if isAdding {
                viewGraph.addPreference(WindowToolbarItemsAppearanceKey.self)
                tracker.addPreference(WindowToolbarItemsAppearanceKey.self)
            } else {
                viewGraph.removePreference(WindowToolbarItemsAppearanceKey.self)
                tracker.removePreference(WindowToolbarItemsAppearanceKey.self)
            }
        case .windowToolbar:
            if isAdding {
                viewGraph.addPreference(WindowToolbarAppearanceKey.self)
                tracker.addPreference(WindowToolbarAppearanceKey.self)
            } else {
                viewGraph.removePreference(WindowToolbarAppearanceKey.self)
                tracker.removePreference(WindowToolbarAppearanceKey.self)
            }
        case .bottomBar:
            if isAdding {
                viewGraph.addPreference(BottomBarAppearanceKey.self)
                tracker.addPreference(BottomBarAppearanceKey.self)
            } else {
                viewGraph.removePreference(BottomBarAppearanceKey.self)
                tracker.removePreference(BottomBarAppearanceKey.self)
            }
        case .keyboardBar:
            fatalError("Unsupported toolbar")
        case .tabBar:
            if isAdding {
                viewGraph.addPreference(TabBarAppearanceKey.self)
                tracker.addPreference(TabBarAppearanceKey.self)
            } else {
                viewGraph.removePreference(TabBarAppearanceKey.self)
                tracker.removePreference(TabBarAppearanceKey.self)
            }
        case .bottomOrnament:
            if isAdding {
                viewGraph.addPreference(BottomOrnamentAppearanceKey.self)
                tracker.addPreference(BottomOrnamentAppearanceKey.self)
            } else {
                viewGraph.removePreference(BottomOrnamentAppearanceKey.self)
                tracker.removePreference(BottomOrnamentAppearanceKey.self)
            }
        }
    }
}

protocol ToolbarAppearanceKey : HostPreferenceKey where Value == [ToolbarPlacement.Role : ToolbarAppearanceConfiguration] {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        get
    }
    
    static var isAccessoryBarPlacement: Bool {
        get
    }
}

extension ToolbarAppearanceKey {
    static var defaultValue: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] {
        return [:]
    }
    
    static func reduce(value: inout [ToolbarPlacement.Role: ToolbarAppearanceConfiguration], nextValue: () -> [ToolbarPlacement.Role: ToolbarAppearanceConfiguration]) {
        assertUnimplemented()
    }
}

struct BottomBarAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        return .bottomBar
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
}

struct BottomOrnamentAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        return .bottomOrnament
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
}

struct NavigationBarAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        assertUnimplemented()
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
}

struct WindowToolbarItemsAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        assertUnimplemented()
    }
    
    static var isAccessoryBarPlacement: Bool {
        assertUnimplemented()
    }
}

struct WindowToolbarAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        assertUnimplemented()
    }
    
    static var isAccessoryBarPlacement: Bool {
        assertUnimplemented()
    }
}

struct TabBarAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        assertUnimplemented()
    }
    
    static var isAccessoryBarPlacement: Bool {
        assertUnimplemented()
    }
}

struct AccessoryBarAppearanceKey : ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        assertUnimplemented()
    }
    
    static var isAccessoryBarPlacement: Bool {
        assertUnimplemented()
    }
}


extension PreferenceValues {
    fileprivate func configuration(toolbarPlacement: ToolbarPlacement.Role) -> PreferenceValues.Value<ToolbarAppearanceConfiguration> {
        switch toolbarPlacement {
        case .accessoryBar(_):
            return configurationValue(key: AccessoryBarAppearanceKey.self, placement: toolbarPlacement)
        case .navigationBar:
            return configurationValue(key: NavigationBarAppearanceKey.self, placement: toolbarPlacement)
        case .windowToolbarItems:
            return configurationValue(key: WindowToolbarItemsAppearanceKey.self, placement: toolbarPlacement)
        case .windowToolbar:
            return configurationValue(key: WindowToolbarAppearanceKey.self, placement: toolbarPlacement)
        case .bottomBar:
            return configurationValue(key: BottomBarAppearanceKey.self, placement: toolbarPlacement)
        case .keyboardBar:
            return PreferenceValues.Value(value: ToolbarAppearanceConfiguration(), seed: .invalid)
        case .tabBar:
            return configurationValue(key: TabBarAppearanceKey.self, placement: toolbarPlacement)
        case .bottomOrnament:
            return configurationValue(key: BottomOrnamentAppearanceKey.self, placement: toolbarPlacement)
        }
    }
    
    fileprivate func configurationValue<Key : ToolbarAppearanceKey>(key: Key.Type, placement: ToolbarPlacement.Role?) -> PreferenceValues.Value<ToolbarAppearanceConfiguration> {
        let value = self[key.self]
        // x23
        let configuration = placement!.effectiveConfiguration(value.value)
        return PreferenceValues.Value(value: configuration, seed: value.seed)
    }
}

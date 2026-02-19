// 3D0A5FA8455C04EDCEBBD3CEA14D2692
@_spi(Internal) internal import MySwiftUICore

struct ToolbarAppearanceModifier {
    // TODO
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
    
    @inline(__always)
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
        let newConfiguration = preferences.configuration(toolbarPlacement: role).value
        
        // <+1116>
        if role == .navigationBar, let copy_2 = copy_1 {
            // <+1156>
            // copy_2 -> x19 + 0xd8
            // x19 + 0x130
            let copy_3 = copy_2
            if !copy_3.navigationAdaptor.adaptors.isEmpty {
                // <+1216>
                fatalError("TODO")
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
        // x19 + 0x88
        let copy_2: ToolbarAppearanceConfiguration? = newConfiguration
        // <+1712>
        // x19 + 0x60
        let copy_3 = oldConfiguration
        // <+1756>
        // *(x19 + 0x60) + 0x50 (x26 + x20)
        let copy_4 = copy_2
        
        if let copy_3 {
            // <+1876>
            fatalError("TODO")
        } else {
            // <+1808>
            if let copy_4 {
                // <+1956>
                // x29 - 0xf0
                let copy_5 = role
                // x19 + 0x28
                let copy_6: ToolbarAppearanceConfiguration? = newConfiguration
                // x19 + 0x30
                let copy_7 = copy_6
                
                if let copy_7 {
                    // <+2180>
                    // x19 + 0x8
                    let copy_8 = copy_7
                    self.barConfigurations[copy_5] = copy_8
                    // <+2272>
                } else {
                    // <+2100>
                    self.barConfigurations.removeValue(forKey: copy_5)
                    // <+2272>
                }
                
                // <+2280>
                // x19 + 0x130
                let copy_8 = role
                self.toUpdateBars.update(with: copy_8)
                return true
            } else {
                // <+2548>
                return false
            }
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
        /*
         self -> x20
         isAdding -> x2 -> x27
         viewGraph -> x0 -> x29 - 0x88
         tracker -> x1 -> x29 - 0x80
         */
        // <+268>
        // x29 - 0x78
        let copy_1 = self
        
        switch copy_1 {
        case .accessoryBar(_):
            // <+1472>
            fatalError("TODO")
        case .navigationBar:
            // <+920>
            if isAdding {
                // <+924>
                viewGraph.addPreference(NavigationBarAppearanceKey.self)
                tracker.addPreference(NavigationBarAppearanceKey.self)
            } else {
                // <+1304>
                fatalError("TODO")
            }
        case .windowToolbarItems:
            // <+1072>
            fatalError("TODO")
        case .windowToolbar:
            // <+312>
            fatalError("TODO")
        case .bottomBar:
            // <+632>
            if isAdding {
                // <+636>
                viewGraph.addPreference(BottomBarAppearanceKey.self)
                tracker.addPreference(BottomBarAppearanceKey.self)
            } else {
                // <+1344>
                fatalError("TODO")
            }
        case .keyboardBar:
            // <+1464>
            fatalError("TODO")
        case .tabBar:
            // <+776>
            fatalError("TODO")
        case .bottomOrnament:
            // <+480>
            if isAdding {
                // <+484>
                viewGraph.addPreference(BottomOrnamentAppearanceKey.self)
                tracker.addPreference(BottomOrnamentAppearanceKey.self)
            } else {
                // <+1264>
                fatalError("TODO")
            }
        }
    }
}

protocol ToolbarAppearanceKey: HostPreferenceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        get
    }
    
    static var isAccessoryBarPlacement: Bool {
        get
    }
    
    typealias Value = [ToolbarPlacement.Role: ToolbarAppearanceConfiguration]
}

struct BottomBarAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
    static var defaultValue: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] {
        return .init()
    }
    
    static func reduce(value: inout [ToolbarPlacement.Role: ToolbarAppearanceConfiguration], nextValue: () -> [ToolbarPlacement.Role: ToolbarAppearanceConfiguration]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

struct BottomOrnamentAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
    static var defaultValue: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] {
        return .init()
    }
    
    static func reduce(value: inout [ToolbarPlacement.Role: ToolbarAppearanceConfiguration], nextValue: () -> [ToolbarPlacement.Role: ToolbarAppearanceConfiguration]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

struct NavigationBarAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
    static var defaultValue: [ToolbarPlacement.Role: ToolbarAppearanceConfiguration] {
        return .init()
    }
    
    static func reduce(value: inout [ToolbarPlacement.Role: ToolbarAppearanceConfiguration], nextValue: () -> [ToolbarPlacement.Role: ToolbarAppearanceConfiguration]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}


extension PreferenceValues {
    fileprivate func configuration(toolbarPlacement: ToolbarPlacement.Role) -> PreferenceValues.Value<ToolbarAppearanceConfiguration> {
        /*
         toolbarPlacement -> x0 -> x22
         return pointer -> x8 -> x19
         */
        switch toolbarPlacement {
        case .accessoryBar(_):
            // <+464>
            fatalError("TODO")
        case .navigationBar:
            // <+432>
            return configurationValue(key: NavigationBarAppearanceKey.self, placement: toolbarPlacement)
        case .windowToolbarItems:
            // <+636>
            fatalError("TODO")
        case .windowToolbar:
            // <+336>
            fatalError("TODO")
        case .bottomBar:
            // <+556>
            return configurationValue(key: BottomBarAppearanceKey.self, placement: toolbarPlacement)
        case .keyboardBar:
            // <+188>
            fatalError("TODO")
        case .tabBar:
            // <+596>
            fatalError("TODO")
        case .bottomOrnament:
            // <+392>
            return configurationValue(key: BottomOrnamentAppearanceKey.self, placement: toolbarPlacement)
        }
    }
    
    fileprivate func configurationValue<Key: ToolbarAppearanceKey>(key: Key.Type, placement: ToolbarPlacement.Role?) -> PreferenceValues.Value<ToolbarAppearanceConfiguration> {
        let value = self[key.self]
        // x23
        let configuration = placement!.effectiveConfiguration(value.value)
        return PreferenceValues.Value(value: configuration, seed: value.seed)
    }
}

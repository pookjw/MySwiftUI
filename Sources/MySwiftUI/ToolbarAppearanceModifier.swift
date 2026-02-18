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
}

struct BottomBarAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
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

struct BottomOrnamentAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
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

struct NavigationBarAppearanceKey: ToolbarAppearanceKey {
    static var toolbarPlacement: ToolbarPlacement.Role? {
        fatalError("TODO")
    }
    
    static var isAccessoryBarPlacement: Bool {
        return false
    }
    
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


internal import MySwiftUICore

public struct ToolbarItemPlacement {
    private(set) var role: ToolbarItemPlacement.Role
    
    @safe public static nonisolated(unsafe) let automatic = ToolbarItemPlacement(role: .automatic)
    
    @available(watchOS, unavailable)
    @safe public static nonisolated(unsafe) let principal = ToolbarItemPlacement(role: .principal)
    
    @available(watchOS, unavailable)
    @safe public static nonisolated(unsafe) let navigation = ToolbarItemPlacement(role: .navigation)
    
    @safe public static nonisolated(unsafe) let primaryAction = ToolbarItemPlacement(role: .primaryAction(.automatic))
    
    static func primaryAction(initialVisibility: Visibility) -> ToolbarItemPlacement {
        return ToolbarItemPlacement(role: .primaryAction(initialVisibility))
    }
    
    @available(iOS 16.0, macOS 13.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @safe public static nonisolated(unsafe) let secondaryAction = ToolbarItemPlacement(role: .secondaryAction)
    
    @available(tvOS 18.0, *)
    @available(watchOS, unavailable)
    @safe public static nonisolated(unsafe) let status = ToolbarItemPlacement(role: .status)
    
    @safe public static nonisolated(unsafe) let confirmationAction = ToolbarItemPlacement(role: .confirmationAction)
    
    @safe public static nonisolated(unsafe) let cancellationAction = ToolbarItemPlacement(role: .cancellationAction)
    
    @safe public static nonisolated(unsafe) let destructiveAction = ToolbarItemPlacement(role: .destructiveAction)
    
    @available(iOS 15.0, macOS 12.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @safe public static nonisolated(unsafe) let keyboard = ToolbarItemPlacement(role: .keyboard)
    
    @available(iOS 14.0, tvOS 14.0, watchOS 10.0, *)
    @backDeployed(before: iOS 17.0, tvOS 17.0)
    @available(macOS, unavailable)
    public static var topBarLeading: ToolbarItemPlacement {
        return ToolbarItemPlacement(role: .navigationBarLeading)
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 10.0, *)
    @backDeployed(before: iOS 17.0, tvOS 17.0)
    @available(macOS, unavailable)
    public static var topBarTrailing: ToolbarItemPlacement {
        return ToolbarItemPlacement(role: .navigationBarTrailing)
    }
    
    @available(macOS 13.0, *)
    @backDeployed(before: macOS 14.0)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static func accessoryBar<ID>(id: ID) -> ToolbarItemPlacement where ID : Hashable {
        return ToolbarItemPlacement(role: .accessoryBar(AnyHashable(id)))
    }
    
    @available(macOS 14.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @usableFromInline
    internal static func backDeployable_accessoryBar<ID>(id: ID) -> ToolbarItemPlacement where ID : Hashable {
        return accessoryBar(id: id)
    }
    
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "use topBarLeading instead")
    @available(tvOS, introduced: 14.0, deprecated: 100000.0, message: "use topBarLeading instead")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use topBarLeading instead")
    @safe public static nonisolated(unsafe) let navigationBarLeading: ToolbarItemPlacement = .topBarLeading
    
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "use topBarTrailing instead")
    @available(tvOS, introduced: 14.0, deprecated: 100000.0, message: "use topBarTrailing instead")
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use topBarTrailing instead")
    @safe public static nonisolated(unsafe) let navigationBarTrailing: ToolbarItemPlacement = .topBarTrailing
    
    @available(iOS 14.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @_alwaysEmitIntoClient public static var title: ToolbarItemPlacement {
        get {
            if #available(iOS 26.0, *) {
                ._title
            } else {
                .principal
            }
        }
    }
    
    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @usableFromInline
    @safe internal static nonisolated(unsafe) let _title = ToolbarItemPlacement(role: .title)
    
    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @safe public static nonisolated(unsafe) let largeTitle = ToolbarItemPlacement(role: .largeTitle)
    
    @safe static nonisolated(unsafe) let largeNavigationTitleAccessory = ToolbarItemPlacement(role: .largeNavigationTitleAccessory)
    
    @available(tvOS 18.0, watchOS 10.0, *)
    @available(macOS, unavailable)
    @safe public static nonisolated(unsafe) let bottomBar = ToolbarItemPlacement(role: .bottomBar)
    
    @safe static nonisolated(unsafe) let _bottomBar = ToolbarItemPlacement(role: .bottomBar)
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @safe public static nonisolated(unsafe) let bottomOrnament = ToolbarItemPlacement(role: .bottomOrnament)
    
    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @safe public static nonisolated(unsafe) let subtitle = ToolbarItemPlacement(role: .subtitle)
    
    @available(iOS 26.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @safe public static nonisolated(unsafe) let largeSubtitle = ToolbarItemPlacement(role: .largeTitle)
    
    @safe static nonisolated(unsafe) let tabSidebar = ToolbarItemPlacement(role: .automatic)
}

@available(*, unavailable)
extension ToolbarItemPlacement : Sendable {
}

@available(macOS 13.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension ToolbarItemPlacement {
    @available(macOS, introduced: 13.0, deprecated: 14.0, renamed: "accessoryBar")
    public init<ID>(id: ID) where ID : Hashable {
        role = .accessoryBar(id)
    }
}

extension ToolbarItemPlacement {
    /*
     - Associated Values가 없을 경우
     x8 -> case (automatic = 0, principal = 1...)
     x8 + 0x8~0x20 -> 0
     x8 + 0x28 -> 0x2
     
     - primaryAction
     x8 -> Visibility
     x8 + 0x28 -> 0x0
     
     - accessoryBar
     x8 -> AnyHashable
     x8 + 0x28 -> 0x1
     */
    enum Role: Hashable {
        case primaryAction(Visibility)
        case accessoryBar(AnyHashable)
        case automatic
        case principal
        case navigation
        case secondaryAction
        case status
        case confirmationAction
        case cancellationAction
        case destructiveAction
        case keyboard
        case navigationBarLeading
        case navigationBarTrailing
        case title
        case largeTitle
        case bottomBar
        case largeNavigationTitleAccessory
        case subtitle
        case largeSubtitle
        case tabBarLeading
        case tabBarTrailing
        case bottomOrnament
        case navigationBarTitle
        case defaultNavigationBarLeading
        case _implicitNavigation
        case _implicitSidebarLeading
        case _implicitSidebarTrailing
        case _navigationBarTrailing
        case _navigationBarLeading
        case _navigationSplitViewLeading
        case _navigationSplitViewTrailing
        case search
        case _tabViewSidebarOverflowMenu
        case _tabViewSidebarBottomBar
        case marker
    }
}

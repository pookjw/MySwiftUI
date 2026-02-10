// 0E31079E853BF37F2F0477B683D77398
internal import UIKit
internal import MySwiftUICore
internal import Foundation
internal import MRUIKit

enum Toolbar {}

extension Toolbar {
    struct UpdateContext {
        private var overrides = HostingControllerOverrides() // 0x0
        private weak var navigationController: UINavigationController? = nil // 0x38
        private weak var targetController: UIViewController? = nil // 0x40
        private weak var sceneSession: UISceneSession? = nil // 0x48
        var horizontalSizeClass: UserInterfaceSizeClass? = .regular // 0x20 (offset field)
        var verticalSizeClass: UserInterfaceSizeClass? = .regular // 0x24 (offset field)
        var accessoryBarLocations: [Toolbar.BarLocation] = [] // 0x28 (offset field)
        
        init<Content: View>(hostingController: UIHostingController<Content>) {
            // <+280>
            // hostingController -> x20
            self.overrides = hostingController.overrides
            self.navigationController = hostingController.navigationController
            self.targetController = hostingController
            
            if
                let window = hostingController.host.window,
                let windowScene = window.windowScene
            {
                self.sceneSession = windowScene.session
            } else {
                self.sceneSession = nil
            }
        }
    }
    
    enum BarLocation: Hashable, CaseIterable, CustomStringConvertible {
        static var allCases: [Toolbar.BarLocation] {
            // $s7SwiftUI7ToolbarO11BarLocationO8allCasesSayAEGvgZTf4d_n
            // 아마 Platform 마다 다른 것 같음
            var results: [Toolbar.BarLocation] = []
            
            results.append(
                contentsOf: [
                    .navigationBarTitle,
                    .navigationBarTrailing,
                    .navigationBarLeading
                ]
            )
            
            results.append(
                contentsOf: [
                    .navigationBarLargeTitle,
                    .navigationBarCenter,
                    .navigationBarAccessory,
                    .navigationBarSubtitle,
                    .navigationBarLargeSubtitle,
                    .navigationSplitViewLeading,
                    .navigationSplitViewTrailing,
                    .bottomBar,
                    .keyboardBar,
                    ._tabViewSidebarOverflowMenu,
                    ._tabViewSidebarBottomBar
                ]
            )
            
            results.append(.search)
            results.append(.bottomOrnament)
            
            return results
        }
        
        case accessoryBar(AnyHashable)
        case navigationBarTitle // 0
        case navigationBarLargeTitle // 1
        case navigationBarCenter // 2
        case navigationBarTrailing // 3
        case navigationBarSubtitle // 4
        case navigationBarLargeSubtitle // 5
        case navigationBarLeading // 6
        case navigationBarPalette // 7
        case navigationBarAccessory // 8
        case navigationSplitViewLeading // 9
        case navigationSplitViewTrailing // 10
        case tabBarLeading // 11
        case tabBarTrailing // 12
        case _tabViewSidebarOverflowMenu // 13
        case _tabViewSidebarBottomBar // 14
        case search // 15
        case bottomBar // 16
        case keyboardBar // 17
        case toolbar // 18
        case touchBar // 19
        case bottomOrnament // 20
        
        var description: String {
            fatalError("TODO")
        }
    }
    
    struct Updates {
        var set: Set<Toolbar.BarLocation>
        var flag1: Bool
        var flag2: Bool
        var flag3: Bool
        var flag4: Bool
    }
    
    struct PlatformVended {
        private var platformDelegate: ToolbarPlatformDelegate? = nil // 0x0
        private(set) var uiNavigationItem: UINavigationItem = {
            return MainActor.assumeIsolated { 
                return UINavigationItem()
            }
        }() // 0x8
        private var uiToolbarItems: [UIBarButtonItem] = [] // 0x10
        private var uiToolbar: UIKitToolbar? = nil // 0x18
        var uiSearchController: SwiftUISearchController? = nil // 0x20
        private lazy var uiSafeAreaTransitionState: ToolbarSafeAreaTransitionState = {
            fatalError("TODO")
        }() // 0x28
        private var uiTabViewSidebarOverflowItems: [UIKitBarButtonItem] = [] // 0x30
        private var uiTabViewSidebarBottomBarItem: ToolbarStorage.Item? = nil // 0x2c (offset field)
        private var uiInputAccessoryGenerator: InputAccessoryGenerator? // 0x30 (offset field)
        private var uiSplitControllerNavigationItem: UINavigationItem = {
            return MainActor.assumeIsolated { 
                return UINavigationItem()
            }
        }() // 0x34 (offset field)
        private var ornamentItems: [ToolbarStorage.Item] = [] // 0x38 (offset field)
        private var bottomOrnament: ToolbarOrnament? = nil // 0x3c (offset field)
        
        init() {}
    }
    
    struct BarContext {
        // TODO
    }
    
    struct LocationStorage {
        // TODO
    }
    
    enum VendedItem {
        case spacer(UIBarButtonItem)
        case barItem(UIKitBarButtonItem)
        case barItemGroup(UIKitBarButtonItemGroup)
        case hostView(UIKitBarItemHost<BarItemView>)
        case paletteView(UIKitBarPaletteHost)
    }
}

extension Toolbar.Updates {
    struct NavigationProperties {
        // TODO (descriptor 없음)
    }
}

extension EnvironmentValues {
    var toolbarUpdateContext: Toolbar.UpdateContext? {
        get {
            return self[ToolbarUpdateContextKey.self]
        }
        set {
            self[ToolbarUpdateContextKey.self] = newValue
        }
    }
}

fileprivate struct ToolbarUpdateContextKey: EnvironmentKey {
    static nonisolated(unsafe) let defaultValue: Toolbar.UpdateContext? = nil
}

class ToolbarPlatformDelegate: NSObject {
    private weak var provider: ToolbarBridgeProvider?
    
    override init() {
        fatalError("TODO")
    }
    
    // TODO
}

protocol ToolbarBridgeProvider: AnyObject {
    // TODO
}

class UIKitToolbar: UIToolbar {
    // TODO
}

class SwiftUISearchController: UISearchController {
    // TODO
}

class ToolbarSafeAreaTransitionState {
    private var count: Int
    
    init() {
        fatalError("TODO")
    }
    
    // TODO
}

class UIKitBarButtonItem: UIBarButtonItem {
    // TODO
}

struct ToolbarStorage {
    private(set) var identifier: String? // 0x8
    private(set) var selection: Binding<Int>? // 0x18
    private(set) var isAnimated: Bool // 0x28
    private(set) var entries: [ToolbarStorage.Entry] // 0x30
    private(set) var shouldPlaceDefaultNavigationItems: Bool // 0x38
    private(set) var requestedRemovedDefaultItems: Set<ToolbarDefaultItemKind.Kind> // 0x40
}

extension ToolbarStorage {
    struct Item {
        // TODO
    }
    
    struct SearchItem {
//        @Binding var state: SearchFieldState
//        var platformTokens: PlatformItemList?
//        var platformScopes: PlatformItemCollection?
//        var platformSuggestions: PlatformItemCollection?
//        var prompt: Text
        private(set) var environment: EnvironmentValues // 0x24 (offset field)
//        var suggestions: BoundInputsView?
//        var customScopeBar: BoundInputsView?
//        var customScopeBarVisibility: Visibility
//        var customAccessory: BoundInputsView?
        private(set) var allowsGlobalSearch: Bool
    }
    
    struct NavigationProperties {
        // TODO
    }
    
    struct Entry {
        // TODO
    }
}

struct ToolbarDefaultItemKind {
    // TODO
}

extension ToolbarDefaultItemKind {
    enum Kind {
        case sidebarToggle
        case title
        case navigationBackButton
        case search
        case inspectorToggle
    }
}

class InputAccessoryGenerator {
    // TODO
}

class ToolbarOrnament: MRUIPlatterOrnament {
    // TODO
}

struct ToolbarRoleKey: HostPreferenceKey {
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

struct NavigationTitleKey: HostPreferenceKey {
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

struct NavigationSubtitleKey: HostPreferenceKey {
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

struct NavigationBarBackButtonHiddenKey: HostPreferenceKey {
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

struct UINavigationItemAdaptorStorage {
    private(set) var adaptors: [UINavigationItemAdaptorStorage.Adaptor] = []
    // TODO
}

extension UINavigationItemAdaptorStorage {
    struct Adaptor {
        private var base: UINavigationItemAdaptor
        private var seed: UInt32
    }
}

protocol UINavigationItemAdaptor {
    // TODO
}

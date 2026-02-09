// F345616596EA75D1F4200D7666E5E588
internal import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

class UIKitNavigationBridge {
    weak var host: ViewRendererHost? = nil // 0x10
    private lazy var presentationModeLocation = LocationBox<UIKitNavigationBridgePresentationModeLocation>(location: UIKitNavigationBridgePresentationModeLocation(bridge: self)) // 0x18
    private var activePresentation: BridgedPresentation? = nil // 0x20
    private var navigationDestinationSeed: VersionSeed = .invalid // 0x920
    private var destinations: [Namespace.ID: NavigationDestinationPresentation] = .init() // 0x928
    var hasSearch: Bool = false // 0xdd8
    private var lastEnvironment = EnvironmentValues() // 0xc40
    private var environmentOverride: EnvironmentValues? = nil // 0xc48
    private weak var containingSplitControllerOverride: UISplitViewController? = nil // 0xc50
    
    init() {
    }
    
    @MainActor final func update(environment: inout EnvironmentValues) {
        /*
         self -> x20 -> x21
         environment -> x0 -> x19
         */
        self.lastEnvironment = environment
        self.lastEnvironment.preferenceBridge = nil
        
        let isRepresentingSheetNavigationView = self.lastEnvironment[IsRepresentingSheetNavigationView.self]
        
        if isRepresentingSheetNavigationView {
            // <+176>
            environment[IsRepresentingSheetNavigationView.self] = false
        } else {
            // <+200>
            let binding = Binding(value: PresentationMode(isPresented: isBeingPresented), location: presentationModeLocation)
            environment.presentationMode = binding
        }
        
        // <+284>
        if !environment.internalNavigationEnabled {
            // <+320>
            if pushTargetComponents(isDetail: true).navController != nil {
                environment.internalNavigationEnabled = true
            }
        }
        
        // <+388>
        if
            isLinkedOnOrAfter(.v5),
            !environment.isInExpandedSplitView,
            let host,
            let uiContainingViewController = host.uiContainingViewController,
            let splitViewController = uiContainingViewController.splitViewController
        {
            // <+400>
            environment.isInExpandedSplitView = !splitViewController.isCollapsed
        }
        
        // <+592>
    }
    
    @MainActor final var isBeingPresented: Bool {
        // self -> x20 -> x21
        // x19
        guard let uiContainingViewController = host?.uiContainingViewController else {
            return false
        }
        
        // x20
        let target: UIViewController
        
        // x21
        if let splitViewController = host?.uiContainingViewController?.splitViewController {
            // <+180>
            if let casted = splitViewController as? NotificationSendingSplitViewController {
                target = casted
                // <+228>
            } else if let casted = splitViewController as? NotifyingMulticolumnSplitViewController {
                target = casted
                // <+228>
            } else {
                return false
            }
        } else {
            // <+368>
            guard let navigationController = uiContainingViewController.navigationController else {
                return false
            }
            
            guard navigationController.childViewControllersCount >= 2 else {
                return false
            }
            
            guard let topViewController = navigationController.topViewController else {
                return false
            }
            
            target = topViewController
            // <+228>
        }
        
        // <+228>
        // x22
        let view_1 = uiContainingViewController.view!
        // x23
        let view_2 = target.view!
        
        return view_1.isDescendant(of: view_2)
    }
    
    @MainActor func pushTargetComponents(isDetail: Bool) -> (navController: UINavigationController?, replaceRoot: Bool, column: UISplitViewController.Column?) {
        let navController: UINavigationController?
        if let host {
            let _navigation = host.hostingControllerOverrides.navigation
            navController = _navigation ?? containingNavController
        } else {
            navController = containingNavController
        }
        
        return (navController, false, nil)
    }
    
    final var containingNavController: UINavigationController? {
        fatalError("TODO")
    }
    
    @inline(__always)
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        let destinations = preferences[NavigationDestinationsKey.self]
        updateNavigationDestinationsIfNeeded(preference: destinations)
    }
    
    fileprivate final func updateNavigationDestinationsIfNeeded(preference: PreferenceValues.Value<[Namespace.ID: NavigationDestinationPresentation]>) {
        fatalError("TODO")
    }
    
    // TODO
}

final class NavigationBridge_PhoneTV: UIKitNavigationBridge {
    @MainActor override func pushTargetComponents(isDetail: Bool) -> (navController: UINavigationController?, replaceRoot: Bool, column: UISplitViewController.Column?) {
        /*
         self -> x20 -> x21
         isDetail -> x0 -> x22
         */
        let v2 = _SemanticFeature<Semantics_v2>.isEnabled
        guard v2 else {
            // <+268>
            // inlined
            return super.pushTargetComponents(isDetail: isDetail)
        }
        
        // <+116>
        // x19
        var navController: UINavigationController?
        if let host {
            navController = host.hostingControllerOverrides.navigation
        }
        if navController == nil {
            // <+188>
            if let host {
                navController = host.uiContainingViewController?.navigationController
            } else {
                navController = nil
            }
        }
        
        // <+356>
        let uiContainingViewController: UIViewController?
        if let host {
            // <+368>
            uiContainingViewController = host.uiContainingViewController
        } else {
            // <+408>
            uiContainingViewController = nil
        }
        
        // <+412>
        // x20
        let splitViewController = uiContainingViewController?.splitViewController
        
        guard let splitViewController else {
            return (navController, false, nil)
        }
        
        // x21
        let casted: UISplitViewController
        if let _casted = splitViewController as? NotificationSendingSplitViewController {
            casted = _casted
        } else if let _casted = splitViewController as? NotifyingMulticolumnSplitViewController {
            casted = _casted
        } else {
            return (nil, false, nil)
        }
        
        // <+492>
        if casted.style == .unspecified || !isDetail {
            return (nil, false, nil)
        }
        
        // <+516>
        // navController -> x22
        // x23
        let result: UINavigationController?
        if casted.style != .unspecified, let viewController = casted.viewController(for: .primary) as? UINavigationController {
            result = viewController
        } else {
            result = nil
        }
        
        // <+672>
        let flag: Bool // true -> <+724> / false -> <+860>
        if let navController {
            // <+676>
            if let result, navController === result {
                // <+860>
                flag = false
            } else {
                // <+724>
                flag = true
            }
        } else {
            if let result {
                // <+724>
                flag = true
            } else {
                // <+860>
                flag = false
            }
        }
        
        if flag {
            // <+724>
            // x23
            let navC: UINavigationController?
            if casted.style != .unspecified, let viewController = casted.viewController(for: .supplementary) as? UINavigationController {
                navC = viewController
            } else {
                // <+820>
                navC = nil
            }
            
            // <+824>
            if let navController {
                // <+828>
                if let navC, navController === navC {
                    // <+1000>
                    if casted.style != .unspecified, let viewController = casted.viewController(for: .secondary) as? UINavigationController {
                        return (viewController, true, .secondary)
                    } else {
                        return (nil, true, .secondary)
                    }
                } else {
                    // <+984>
                    return (navController, false, .secondary)
                }
            } else {
                // <+964>
                if navC != nil {
                    return (nil, false, .secondary)
                } else {
                    // <+1000>
                    if casted.style != .unspecified, let viewController = casted.viewController(for: .secondary) as? UINavigationController {
                        return (viewController, true, .secondary)
                    } else {
                        return (nil, true, .secondary)
                    }
                }
            }
        } else {
            // <+860>
            if casted.style != .unspecified, let viewController = casted.viewController(for: .supplementary) as? UINavigationController {
                // <+936>
                return (viewController, true, .supplementary)
            } else {
                // <+1040>
                if casted.style != .unspecified {
                    let viewController = casted.viewController(for: .secondary) as? UINavigationController
                    return (viewController, true, .secondary)
                } else {
                    // <+1148>
                    return (nil, true, .secondary)
                }
            }
        }
    }
}

struct IsSearchAllowedInput: ViewInputBoolFlag {
}

struct NavigationDestinationsKey: HostPreferenceKey {
    static var defaultValue: [Namespace.ID: NavigationDestinationPresentation] {
        fatalError("TODO")
    }
    
    static func reduce(value: inout [Namespace.ID: NavigationDestinationPresentation], nextValue: () -> [Namespace.ID: NavigationDestinationPresentation]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}

fileprivate struct UIKitNavigationBridgePresentationModeLocation: Location {
    func get() -> PresentationMode {
        fatalError("TODO")
    }
    
    mutating func set(_ newValue: PresentationMode, transaction: MySwiftUICore.Transaction) {
        fatalError("TODO")
    }
    
    var wasRead: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    static func == (lhs: UIKitNavigationBridgePresentationModeLocation, rhs: UIKitNavigationBridgePresentationModeLocation) -> Bool {
        fatalError("TODO")
    }
    
    private(set) weak var bridge: UIKitNavigationBridge?
    
    // TODO
}

struct BridgedPresentation {
    private var content: NavigationDestinationContent
    private var contentHost: BridgedPresentation.ContentHost?
}

enum NavigationDestinationPresentation {
    case presented(NavigationDestinationContent)
    case notPresented(Namespace.ID, Transaction)
}

struct NavigationDestinationContent {
    private var id: Namespace.ID
    private var isDetail: Bool
    private var onDismiss: () -> Void
    private var transaction: Transaction
    private var tag: Any?
    private var generateContent: (Bool) -> AnyView
}

extension BridgedPresentation {
    enum ContentHost {
//        case push(UIHostingController<BridgedPresentation.RootView>)
//        case split(UINavigationController, UIHostingController<BridgedPresentation.RootView>)
    }
}

extension BridgedPresentation {
//    struct RootView {
//        private var content: AnyView
//        private var searchAdjustment: SearchAdjustment
//    }
}

fileprivate struct IsRepresentingSheetNavigationView: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}

// F345616596EA75D1F4200D7666E5E588
internal import MySwiftUICore
private import UIKit

class UIKitNavigationBridge {
    weak var host: ViewRendererHost? = nil // 0x10
    private lazy var presentationModeLocation: LocationBox<UIKitNavigationBridgePresentationModeLocation> = {
        fatalError("TODO")
    }() // 0x18
    private var activePresentation: BridgedPresentation? = nil // 0x20
    private var navigationDestinationSeed: VersionSeed = .invalid // 0x920
    private var destinations: [Namespace.ID: NavigationDestinationPresentation] = .init() // 0x928
    var hasSearch: Bool = false // 0xdd8
    private var lastEnvironment = EnvironmentValues() // 0xde0
    private var environmentOverride: EnvironmentValues? = nil // 0xde8
    private weak var containingSplitControllerOverride: UISplitViewController? = nil // 0xdf0
    
    init() {
    }
    
    final func update(environment: inout EnvironmentValues) {
        fatalError("TODO")
    }
    
    // TODO
}

final class NavigationBridge_PhoneTV: UIKitNavigationBridge {
    
}

struct IsSearchAllowedInput: ViewInputBoolFlag {
}

struct NavigationDestinationsKey: HostPreferenceKey {
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

fileprivate struct UIKitNavigationBridgePresentationModeLocation: Location {
    func get() -> Never {
        fatalError("TODO")
    }
    
    mutating func set(_ newValue: Never, transaction: MySwiftUICore.Transaction) {
        fatalError("TODO")
    }
    
    func update() -> (Never, Bool) {
        fatalError("TODO")
    }
    
    typealias Value = Never
    
    var wasRead: Bool
    
    static func == (lhs: UIKitNavigationBridgePresentationModeLocation, rhs: UIKitNavigationBridgePresentationModeLocation) -> Bool {
        fatalError("TODO")
    }
    
    private weak var bridge: UIKitNavigationBridge?
    
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

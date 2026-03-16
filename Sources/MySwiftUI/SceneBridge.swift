@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import Combine
private import UIKit
private import _UIKitPrivate

final class SceneBridge {
    private var sceneBridgePublishers: [ObjectIdentifier: [String: PassthroughSubject<Any, Never>]] = .init() // 0x10
    private(set) var isAnimatingSceneResize: Bool = false // 0x18
    private weak var windowScene: UIWindowScene? = nil // 0x20
    private weak var rootViewController: UIViewController? = nil // 0x28
    private var sceneDefinitionOptionsSeedTracker = VersionSeedTracker<ConnectionOptionPayloadStoragePreferenceKey>(seed: .invalid) // 0x30
    private var sceneDefinitionOptions = ConnectionOptionPayloadStorage() // 0x38
    private var titleSeedTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x48
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid) // 0x4c
    private var contentCaptureProtectionSeedTracker = VersionSeedTracker<ContentCaptureProtectionPreferenceKey>(seed: .invalid) // 0x50
    private var initialUserActivity: NSUserActivity? = nil // 0x58
    private weak var viewGraph: ViewGraph? = nil // 0x60
    private var _preferredActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0x68
    private var defaultActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0xc8
    private var userActivityTrackingInfo: UserActivityTrackingInfo? = nil // 0x128
    private var userActivityPreferenceSeed: VersionSeed? = nil // 0x130
    private var activationConditionsPreferenceSeed: VersionSeed? = nil // 0x138
    private var initialSceneSizeState: InitialSceneSizeState = .none // 0x140
    private var enqueuedEvents: [String: [Any]] = .init() // 0x180
    
    init() {}
    
    final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
}

struct ConnectionOptionPayloadStoragePreferenceKey: HostPreferenceKey {
    // TODO
    typealias Value = Never?
    
    static func reduce(value: inout Never?, nextValue: () -> Never?) {
        assertUnimplemented()
    }
}

struct ConnectionOptionPayloadStorage {
    private var types: [UISceneConnectionOptionDefinition.Type] = []
    private var actions: [ObjectIdentifier: [AnyConnectionOptionActionBox]] = .init()
}

struct ContentCaptureProtectionPreferenceKey: HostPreferenceKey {
    // TODO
    typealias Value = Never?
    
    static func reduce(value: inout Never?, nextValue: () -> Never?) {
        assertUnimplemented()
    }
}

final class UserActivityTrackingInfo: NSObject {
    private var userActivity: NSUserActivity?
    private var handlers: [ViewIdentity: (NSUserActivity) -> Bool]
    private weak var sceneBridge: SceneBridge?
    private let activityType: String
    
    override init() {
        assertUnimplemented()
    }
}

enum InitialSceneSizeState {
    case unset(_ProposedSize)
    case unset3D(_ProposedSize3D, LengthUnit)
    case none
    case setting
    case set
}

class AnyConnectionOptionActionBox {
    // TODO
}

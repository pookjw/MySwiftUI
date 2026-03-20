@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import Combine
internal import UIKit
private import _UIKitPrivate

final class SceneBridge: CustomStringConvertible, ObservableObject {
    private var sceneBridgePublishers: [ObjectIdentifier: [String: PassthroughSubject<Any, Never>]] = .init() // 0x10
    private(set) var isAnimatingSceneResize: Bool = false // 0x18
    weak var windowScene: UIWindowScene? = nil // 0x20
    private weak var rootViewController: UIViewController? = nil // 0x28
    private var sceneDefinitionOptionsSeedTracker = VersionSeedTracker<ConnectionOptionPayloadStoragePreferenceKey>(seed: .invalid) // 0x30
    private var sceneDefinitionOptions = ConnectionOptionPayloadStorage() // 0x38
    private var titleSeedTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x48
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid) // 0x4c
    private var contentCaptureProtectionSeedTracker = VersionSeedTracker<ContentCaptureProtectionPreferenceKey>(seed: .invalid) // 0x50
    private var initialUserActivity: NSUserActivity? = nil // 0x58
    private weak var viewGraph: ViewGraph? = nil // 0x60
    private var _preferredActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0x68
    var defaultActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0xc8
    private var userActivityTrackingInfo: UserActivityTrackingInfo? = nil // 0x128
    private var userActivityPreferenceSeed: VersionSeed? = nil // 0x130
    private var activationConditionsPreferenceSeed: VersionSeed? = nil // 0x138
    private var initialSceneSizeState: InitialSceneSizeState = .none // 0x140
    private var enqueuedEvents: [String: [Any]] = .init() // 0x180
    
    init() {}
    
    var description: String {
        assertUnimplemented()
    }
    
    var sceneIsVolume: Bool {
        guard let windowScene else {
            return false
        }
        
        return windowScene.session.role == .windowApplicationVolumetric
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
    
    func updateMinimumSizeObserver(added: Bool, viewGraph: ViewGraph) {
        // $s7SwiftUI11SceneBridgeC25updateMinimumSizeObserver5added9viewGraphySb_AA04ViewK0CtFySo6CGSizeV_AJtcfU_TA
        if isLinkedOnOrAfter(.v6) {
            if self.sceneIsVolume {
                if added {
                    viewGraph.observeVolumeResizeProposal(.zero)
                } else {
                    viewGraph.stopObservingVolumeResizeProposal(.zero)
                }
            } else {
                // <+332>
                assertUnimplemented()
            }
        } else {
            assertUnimplemented()
        }
    }
    
    func updateMaximumSizeObserver(added: Bool, viewGraph: ViewGraph) {
        assertUnimplemented()
    } 
    
    static func targetContentIdentifierForExternalEvent(userActivity: NSUserActivity?, url: URL?) -> String? {
        /*
         userActivity -> x0 -> x25
         url -> x1 -> x20
         */
        if let userActivity {
            if let targetContentIdentifier = userActivity.targetContentIdentifier {
                return targetContentIdentifier
            } else if let webpageURL = userActivity.webpageURL {
                return webpageURL.absoluteString
            } else {
                return nil
            }
        } else {
            // <+372>
            if let url {
                return url.absoluteString
            } else {
                return nil
            }
        }
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

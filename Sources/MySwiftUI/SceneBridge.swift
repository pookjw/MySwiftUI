@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import Combine
internal import UIKit
internal import _UIKitPrivate
private import os.log

@MainActor
final class SceneBridge: CustomStringConvertible, ObservableObject {
    private var sceneBridgePublishers: [ObjectIdentifier: [String: PassthroughSubject<Any, Never>]] = .init() // 0x10
    private(set) var isAnimatingSceneResize: Bool = false // 0x18
    weak var windowScene: UIWindowScene? = nil // 0x20
    weak var rootViewController: UIViewController? = nil // 0x28
    private var sceneDefinitionOptionsSeedTracker = VersionSeedTracker<ConnectionOptionPayloadStoragePreferenceKey>(seed: .invalid) // 0x30
    private var sceneDefinitionOptions = ConnectionOptionPayloadStorage() // 0x38
    private var titleSeedTracker = VersionSeedTracker<NavigationTitleKey>(seed: .invalid) // 0x48
    private var colorSchemeSeed = VersionSeedTracker<PreferredColorSchemeKey>(seed: .invalid) // 0x4c
    private var contentCaptureProtectionSeedTracker = VersionSeedTracker<ContentCaptureProtectionPreferenceKey>(seed: .invalid) // 0x50
    private var initialUserActivity: NSUserActivity? = nil // 0x58
    weak var viewGraph: ViewGraph? = nil // 0x60
    private var _preferredActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0x68
    var defaultActivationConditions: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil) // 0xc8
    private var userActivityTrackingInfo: UserActivityTrackingInfo? = nil // 0x128
    private var userActivityPreferenceSeed: VersionSeed? = nil // 0x130
    private var activationConditionsPreferenceSeed: VersionSeed? = nil // 0x138
    var initialSceneSizeState: InitialSceneSizeState = .none // 0x140
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
        /*
         self -> x20 -> x22
         preferenceValues -> x0 -> x26
         */
        // <+312>
        self.userActivityPreferencesDidChange(preferenceValues)
        self.activationConditionsPreferencesDidChange(preferenceValues)
        // x19
        let storageValue = preferenceValues[ConnectionOptionPayloadStoragePreferenceKey.self]
        
        if !self.sceneDefinitionOptionsSeedTracker.seed.matches(storageValue.seed) {
            // <+476>
            self.sceneDefinitionOptionsSeedTracker.seed = storageValue.seed
            self.sceneDefinitionOptions = storageValue.value
        }
        
        // <+592>
        // x23
        let titleValue = preferenceValues[NavigationTitleKey.self]
        if !self.titleSeedTracker.seed.matches(titleValue.seed) {
            self.titleSeedTracker.seed = titleValue.seed
            titleValue.value.map { storage in
                // $s7SwiftUI11SceneBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFyAA22NavigationTitleStorageVSgXEfU0_
                /*
                 storage -> x0
                 self -> x1
                 */
                assertUnimplemented()
            }
        }
        
        // <+808>
        let protectionValue = preferenceValues[ContentCaptureProtectionPreferenceKey.self]
        if !self.contentCaptureProtectionSeedTracker.seed.matches(protectionValue.seed) {
            // <+956>
            self.contentCaptureProtectionSeedTracker.seed = protectionValue.seed
            let value = protectionValue.value
            
            if
                let windowScene,
                let renderingEnvironment = windowScene.renderingEnvironment()
            {
                renderingEnvironment.prefersContentProtection = value
            }
        }
        
        // <+1072>
    }
    
    func updateMinimumSizeObserver(added: Bool, viewGraph: ViewGraph) {
        if isLinkedOnOrAfter(.v6) {
            if self.sceneIsVolume {
                if added {
                    viewGraph.observeVolumeResizeProposal(.zero)
                } else {
                    viewGraph.stopObservingVolumeResizeProposal(.zero)
                }
            } else {
                // <+332>
                if added {
                    viewGraph.observeWindowResizeProposal(_ProposedSize(ProposedViewSize.zero))
                } else {
                    viewGraph.stopObservingWindowResizeProposal(_ProposedSize(ProposedViewSize.zero))
                }
            }
        } else {
            // <+260>
            if let resize = Log.resize {
                resize.log(level: .debug, "Using iOS resize path")
            }
            
            if added {
                viewGraph.sizeThatFitsObservers.addObserver(for: _ProposedSize(ProposedViewSize.zero), exclusive: false) { _, _ in
                    // $s7SwiftUI11SceneBridgeC25updateMinimumSizeObserver5added9viewGraphySb_AA04ViewK0CtFySo6CGSizeV_AJtcfU_TA
                    assertUnimplemented()
                }
            } else {
                viewGraph.sizeThatFitsObservers.stopObserving(proposal: _ProposedSize(ProposedViewSize.zero))
            }
        }
    }
    
    func updateMaximumSizeObserver(added: Bool, viewGraph: ViewGraph) {
        if isLinkedOnOrAfter(.v6) {
            if self.sceneIsVolume {
                if added {
                    viewGraph.observeVolumeResizeProposal(.infinity)
                } else {
                    viewGraph.stopObservingVolumeResizeProposal(.infinity)
                }
            } else {
                // <+332>
                if added {
                    viewGraph.observeWindowResizeProposal(_ProposedSize(ProposedViewSize.infinity))
                } else {
                    viewGraph.stopObservingWindowResizeProposal(_ProposedSize(ProposedViewSize.infinity))
                }
            }
        } else {
            // <+260>
            if let resize = Log.resize {
                resize.log(level: .debug, "Using iOS resize path")
            }
            
            if added {
                viewGraph.sizeThatFitsObservers.addObserver(for: _ProposedSize(ProposedViewSize.infinity), exclusive: false) { _, _ in
                    // $s7SwiftUI11SceneBridgeC25updateMaximumSizeObserver5added9viewGraphySb_AA04ViewK0CtFySo6CGSizeV_AJtcfU_TA
                    assertUnimplemented()
                }
            } else {
                viewGraph.sizeThatFitsObservers.stopObserving(proposal: _ProposedSize(ProposedViewSize.infinity))
            }
        }
    }
    
    func userActivityPreferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
    
    func activationConditionsPreferencesDidChange(_ preferenceValues: PreferenceValues) {
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
    @safe static nonisolated(unsafe) let defaultValue = ConnectionOptionPayloadStorage()
    
    static func reduce(value: inout ConnectionOptionPayloadStorage, nextValue: () -> ConnectionOptionPayloadStorage) {
        assertUnimplemented()
    }
}

struct ConnectionOptionPayloadStorage {
    private(set) var types: [any UISceneConnectionOptionDefinition.Type] = []
    private var actions: [ObjectIdentifier: [AnyConnectionOptionActionBox]] = .init()
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

extension SceneBridge {
    struct UserActivityPreferenceKey: HostPreferenceKey {
        static var defaultValue: Never {
            assertUnimplemented()
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            assertUnimplemented()
        }
    }
    
    struct ActivationConditionsPreferenceKey: HostPreferenceKey {
        static var defaultValue: Never {
            assertUnimplemented()
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            assertUnimplemented()
        }
    }
}

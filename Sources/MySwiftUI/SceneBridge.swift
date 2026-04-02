// A9714FE7FB47B9EE521B92A735A59E38
@_spi(Internal) internal import MySwiftUICore
internal import Foundation
private import Combine
internal import UIKit
internal import _UIKitPrivate
private import os.log
private import BaseBoard

@MainActor
final class SceneBridge : CustomStringConvertible, ObservableObject {
    fileprivate static var _devNullSceneBridge: SceneBridge?
    
    static func merge(predicate: Predicate<String>?, with other: Predicate<String>?) -> Predicate<String>? {
        /*
         predicate -> x0 -> x26
         other -> x1 -> x23
         result pointer -> x8 -> x19
         */
        guard predicate != nil else {
            return nil
        }
        
        // <+300>
        assertUnimplemented()
    }
    
    fileprivate static func buildActivationConditions(_ predicate: Predicate<String>) -> NSPredicate {
        assertUnimplemented()
    }
    
    private var sceneBridgePublishers: [ObjectIdentifier: [String: PassthroughSubject<Any, Never>]] = .init() // 0x10
    private(set) var isAnimatingSceneResize: Bool = false // 0x18
    weak var windowScene: UIWindowScene? = nil // 0x20
    weak var rootViewController: UIViewController? = nil // 0x28
    private var sceneDefinitionOptionsSeedTracker = VersionSeedTracker<ConnectionOptionPayloadStoragePreferenceKey>(seed: .invalid) // 0x30
    private(set) var sceneDefinitionOptions = ConnectionOptionPayloadStorage() // 0x38
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
            let block: (NavigationTitleStorage?) -> Void = { storage in
                // $s7SwiftUI11SceneBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFyAA22NavigationTitleStorageVSgXEfU0_
                /*
                 storage -> x0 -> x25
                 self -> x1 -> x20
                 */
                // <+240>
                guard storage != nil else {
                    return
                }
                
                assertUnimplemented()
            }
            
            block(titleValue.value)
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
        /*
         self -> x20 -> x24
         preferenceValues -> x0 -> x20
         */
        // <+292>
        // x22
        let userActivityPreference = preferenceValues[SceneBridge.UserActivityPreferenceKey.self]
        
        if let seed = self.userActivityPreferenceSeed {
            // <+432>
            if userActivityPreference.seed.matches(seed) {
                // <+504>
                if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                    // $s7SwiftUI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu_
                    Log.log("UserActivity Preferences hasn't changed, skipping update for advertised NSUserActivities. Seed is \(userActivityPreference.seed.description)")
                }
                
                // <+2208>
                return
            } else {
                // <+656>
                // <+668>
            }
        } else {
            // <+412>
            // <+668>
        }
        
        // <+668>
        if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
            // $s7SwiftUI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu0_
            Log.log("UserActivityPreferences changed: \(userActivityPreference)")
        }
        
        // <+800>
        self.userActivityPreferenceSeed = userActivityPreference.seed
        
        // <+900>
        if
            let value = userActivityPreference.value,
            !value.handlers.isEmpty
        {
            // value -> x29 - 0xa0
            // <+932>
            // x24
            let info: UserActivityTrackingInfo
            if let _info = self.userActivityTrackingInfo {
                info = _info
            } else {
                info = UserActivityTrackingInfo(self, activityType: value.activityType)
                self.userActivityTrackingInfo = info
            }
            
            // <+1304>
            if
                let userActivity = info.userActivity,
                userActivity.activityType == value.activityType
            {
                // <+1436>
                if let activity = info.userActivity {
                    activity.needsSave = true
                }
                
                // <+2052>
            } else {
                // <+1464>
                // x26
                let userActivity = NSUserActivity(activityType: value.activityType)
                userActivity.becomeCurrent()
                let old = info.userActivity
                info.userActivity = userActivity
                
                if userActivity == old {
                    // <+1652>
                } else {
                    // <+1640>
                    userActivity.delegate = info
                }
                
                // <+1652>
                if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                    // $s7SwiftUI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu3_TA
                    Log.log("Initializing advertised user activity: \(String(describing: info))")
                }
                
                // <+1764>
                self.userActivityTrackingInfo = info
                self.publishEvent(event: Optional<UserActivityTrackingInfo>(info), type: UserActivityTrackingInfo?.self, identifier: "")
                
                // <+1876>
                let activity = info.userActivity
                if let rootViewController {
                    rootViewController.userActivity = activity
                    // <+1928>
                } else {
                    // <+1908>
                    self.initialUserActivity = activity
                    // <+1928>
                }
                
                // <+1928>
                if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                    // $s7SwiftUI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu4_TA
                    Log.log("View Advertising UserActivity, set rootViewController activity to \(String(describing: info))")
                }
                
                // <+2052>
            }
            
            // <+2052>
            info.handlers = value.handlers
            
            if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                // $s7SwiftUI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu5_TA
                Log.log("Set up AdvertiseUserActivity tracking info from value in UserActivityPreferenceKey: \(info.description)")
            }
            
            return
        } else {
            // <+992>
            self.userActivityTrackingInfo = nil
            self.publishEvent(event: Optional<UserActivityTrackingInfo>(nil), type: UserActivityTrackingInfo?.self, identifier: "")
            
            if let rootViewController {
                rootViewController.userActivity = nil
            } else {
                self.initialUserActivity = nil
            }
            
            // <+1120>
            if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                // $s7SwiftUI4vlog33_A9714FE7FB47B9EE521B92A735A59E38LLyySSyXKFSSyXEfu_03$s7A83UI11SceneBridgeC32userActivityPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu1_Tf3pf_n
                Log.log("Cleared AdvertiseUserActivity tracking info since UserActivity preferences are empty")
            }
            
            // <+2208>
            return
        }
    }
    
    func activationConditionsPreferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self -> x20 -> x23
         preferenceValues -> x0 -> x20
         */
        // <+356>
        // x22
        let activationConditions = preferenceValues[SceneBridge.ActivationConditionsPreferenceKey.self]
        
        if
            let seed = self.activationConditionsPreferenceSeed,
            activationConditions.seed.matches(seed)
        {
            // <+556>
            if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
                // $s7SwiftUI11SceneBridgeC40activationConditionsPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu_TA
                Log.log("ActivationConditions Preferences hasn't changed, skipping update for Scene ActivationConditions. Seed is \(activationConditions.seed.description)")
            }
            
            return
        }
        
        // <+720>
        if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
            // $s7SwiftUI11SceneBridgeC40activationConditionsPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu0_TA
            Log.log("ActivationConditionPreferences changed: \(activationConditions)")
        }
        
        // <+856>
        self.activationConditionsPreferenceSeed = activationConditions.seed
        // <+952>
        self.setActivationConditions(preferred: activationConditions.value)
        
        if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
            // $s7SwiftUI11SceneBridgeC40activationConditionsPreferencesDidChangeyyAA16PreferenceValuesVFSSyXEfu1_TA
            Log.log("Set Preferred Scene ActivationConditions to \(String(describing: self))")
        }
    }
    
    @discardableResult
    fileprivate func publishEvent(event: Any, type: Any.Type, identifier: String) -> Bool {
        /*
         self -> x20
         event -> x0 -> x22
         type -> x1 -> x23
         identifier -> x2/x3 -> x21/x19
         */
        let flag: Bool // true -> <+236> / false -> <+216>
        if
            let devNullSceneBridge = SceneBridge._devNullSceneBridge,
            self === devNullSceneBridge
        {
            // <+236>
            flag = true
        } else {
            if
                let publishers = self.sceneBridgePublishers[ObjectIdentifier(type)],
                let publisher = publishers[identifier]
            {
                // <+216>
                flag = false
            } else {
                // <+236>
                flag = true
            }
        }
        
        
        if flag {
            // <+236>
            self.enqueueUnpublishedEvent(event, for: identifier)
            return false
        } else {
            // <+216>
            return true
        }
    }
    
    fileprivate func enqueueUnpublishedEvent(_ event: Any, for identifier: String) {
        /*
         self -> x20 -> x19
         event -> x0 -> x24
         identifier -> x1/x2 -> x22/x21
         */
        // x23
        var events = self.enqueuedEvents[identifier] ?? []
        events.append(event)
        self.enqueuedEvents[identifier] = events
    }
    
    fileprivate func setActivationConditions(preferred: (preferring: Predicate<String>?, allowing: Predicate<String>?)) {
        /*
         self -> x20
         preferred.preferring -> x0 -> x23
         preferred.allowing -> x1 -> x29 - 0x88
         */
        // <+396>
        // x21
        let copy_1 = preferred
        // x27
        let copy_2 = copy_1
        // self._preferredActivationConditions -> x21
        self._preferredActivationConditions = copy_2
        // x24
        let copy_3 = self._preferredActivationConditions.preferring
        // self.defaultActivationConditions -> x23
        // x22
        let copy_4 = self.defaultActivationConditions.preferring
        // x19
        let result_1 = SceneBridge.merge(predicate: copy_3, with: copy_4)
        // <+644>
        // x24
        let copy_5 = self._preferredActivationConditions.allowing
        // x22
        let copy_6 = self.defaultActivationConditions.allowing
        // x19 + x27
        let result_2 = SceneBridge.merge(predicate: copy_5, with: copy_6)
        
        guard let windowScene else {
            return
        }
        
        // <+736>
        // x20
        let conditions = UISceneActivationConditions()
        
        if let result_1 {
            conditions.prefersToActivateForTargetContentIdentifierPredicate = SceneBridge.buildActivationConditions(result_1)
        }
        
        if let result_2 {
            conditions.canActivateForTargetContentIdentifierPredicate = SceneBridge.buildActivationConditions(result_2)
        }
        
        // <+1132>
        windowScene.activationConditions = conditions
        
        if _defaultSwiftUIActivityEnvironmentLoggingEnabled {
            // $s7SwiftUI11SceneBridgeC23setActivationConditions33_A9714FE7FB47B9EE521B92A735A59E38LL9preferredy10Foundation9PredicateVySS_QPGSg10preferring_AK8allowingt_tFSSyXEfu_TA
            Log.log("Changed Scene ActivationConditions to \(windowScene.activationConditions.description)")
        }
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

struct ConnectionOptionPayloadStoragePreferenceKey : HostPreferenceKey {
    @safe nonisolated(unsafe) static let defaultValue = ConnectionOptionPayloadStorage()
    
    static func reduce(value: inout ConnectionOptionPayloadStorage, nextValue: () -> ConnectionOptionPayloadStorage) {
        assertUnimplemented()
    }
}

struct ConnectionOptionPayloadStorage {
    private(set) var types: [any UISceneConnectionOptionDefinition.Type] = []
    private var actions: [ObjectIdentifier: [AnyConnectionOptionActionBox]] = .init()
}

final class UserActivityTrackingInfo : NSObject, NSUserActivityDelegate {
    fileprivate var userActivity: NSUserActivity? = nil
    fileprivate var handlers: [ViewIdentity: (NSUserActivity) -> Bool] = .init()
    private weak var sceneBridge: SceneBridge? = nil
    private let activityType: String
    
    override var description: String {
        assertUnimplemented()
    }
    
    init(_ sceneBridge: SceneBridge, activityType: String) {
        self.sceneBridge = sceneBridge
        self.activityType = activityType
        super.init()
    }
    
    func userActivityWillSave(_ userActivity: NSUserActivity) {
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
    struct UserActivityPreferenceKey : HostPreferenceKey {
        static var defaultValue: (activityType: String, handlers: [ViewIdentity: (NSUserActivity) -> Bool])? {
            return nil
        }
        
        static func reduce(
            value: inout (activityType: String, handlers: [ViewIdentity: (NSUserActivity) -> Bool])?,
            nextValue: () -> (activityType: String, handlers: [ViewIdentity: (NSUserActivity) -> Bool])?
        ) {
            assertUnimplemented()
        }
    }
    
    struct ActivationConditionsPreferenceKey : HostPreferenceKey {
        static var defaultValue: (preferring: Predicate<String>?, allowing: Predicate<String>?) {
            return (nil, nil)
        }
        
        static func reduce(value: inout (preferring: Predicate<String>?, allowing: Predicate<String>?), nextValue: () -> (preferring: Predicate<String>?, allowing: Predicate<String>?)) {
            assertUnimplemented()
        }
    }
}

@safe nonisolated(unsafe) var _defaultSwiftUIActivityEnvironmentLoggingEnabled = false

struct OpenURLOptions {
    private var storage: OpenURLOptions.Storage
    
    var uiSceneOpenURLOptions: UIScene.OpenURLOptions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var sourceApplication: String? {
        assertUnimplemented()
    }
    
    var originatingProcess: BSProcessHandle? {
        assertUnimplemented()
    }
    
    var referrerURL: URL? {
        assertUnimplemented()
    }
}

extension OpenURLOptions {
    fileprivate enum Storage {
        case uiSceneOpenURLOption(UIScene.OpenURLOptions)
        case userActivity(NSUserActivity)
    }
}

// FB4D19B065EC4D2CC549DBA6E2D239A5
internal import Foundation
private import MySwiftUICore
internal import UIKit
private import os.log
private import MRUIKit
private import _UIKitPrivate
private import Spatial

struct SceneNavigationStrategy_Phone {
    // $s7SwiftUI29SceneNavigationStrategy_PhoneV6shared_WZ
    nonisolated(unsafe) static var shared = SceneNavigationStrategy_Phone(sceneNavigationEnabled: false, sceneRequestCache: SceneRequestCache())
    
    var sceneNavigationEnabled: Bool
    private var sceneRequestCache: SceneRequestCache
    
    fileprivate func withSceneList<T>(namespace: SceneList.Namespace, do: (SceneList) -> T?) -> T? {
        guard let appGraph = AppGraph.shared else {
            return nil
        }
        
        let sceneList = appGraph.sceneList(namespace: namespace)
        return `do`(sceneList)
    }
    
    @MainActor fileprivate func performSceneActivation(
        item: SceneList.Item,
        activity: NSUserActivity,
        matchingSession: UISceneSession?,
        activationBehavior: SceneActivationBehavior,
        errorHandler: ((SceneNavigationStrategy_Phone.Error) -> Void)?
    ) {
        /*
         item -> x0 -> x21
         activity -> x1 -> x19 + 0xa0
         matchingSession -> x2 -> x25
         activationBehavior -> x3 -> x19 + 0x70
         errorHandler -> x4/x5 -> x19 + 0xb8 / x19 + 0xc0
         */
        // <+764>
        if let scenes = Log.scenes {
            scenes.log(level: .info, "Performing scene activation for item \(item.sceneTypeDescription, privacy: .public): \(item.identifyingDescription, privacy: .public)")
        }
        
        // <+1280>
        // x19 + 0x6c
        let hasProvider: Bool
        if item.windowLayoutProvider != nil {
            hasProvider = true
        } else if item.defaultPlacementProvider != nil {
            hasProvider = true
        } else {
            hasProvider = false
        }
        let role = item.sceneSessionRole ?? .windowApplication
        // x24
        let configuration = UISceneConfiguration(name: nil, sessionRole: role)
        configuration.delegateClass = AppSceneDelegate.self
        
        let request: UISceneSessionActivationRequest
        
        switch item.value {
        case .windowGroup(_), .documentGroup(_), .settings(_), .menuBarExtra(_), .customScene(_), .singleWindow(_), .documentIntroduction(_), .alertDialog(_):
            // <+1868>
            let windowPlacement: WindowPlacement?
            if hasProvider {
                // <+1900>
                let mainContent: AnyView?
                switch item.value {
                case .windowGroup(let configuration):
                    mainContent = configuration.mainContent
                case .singleWindow(let configuration):
                    mainContent = configuration.mainContent
                default:
                    mainContent = nil
                }
                
                if let mainContent {
                    // <+1932>
                    let rootView = AppSceneDelegate.makeRootView(mainContent)
                    let proxy = WindowLayoutHostProxy(rootView: rootView)
                    proxy.appendFeatures(volumetric: false)
                    
                    if let windowLayout = self.makeWindowLayout(item: item) {
                        // inlined
                        proxy.setLayout(windowLayout)
                    }
                    
                    // <+2136>
                    // inlined
                    WindowLayoutHostProxy.appendPendingLayoutHostProxy(id: item.id, proxy: proxy)
                    
                    // <+2296>
                    if let windowLayoutComputer = proxy.host.windowLayoutComputer {
                        // <+2348>
                        // inlined
                        windowPlacement = windowLayoutComputer.windowPlacement
                        // <+4416>
                        // <+4448>
                    } else {
                        // <+4352>
                        windowPlacement = nil
                        // <+4448>
                    }
                } else {
                    // <+2500>
                    windowPlacement = nil
                    // <+4448>
                }
            } else {
                // <+2488>
                windowPlacement = nil
                // <+4448>
            }
            
            // <+4448>
            let options = UIWindowScene.ActivationRequestOptions()
            
            if item.defaultSize != nil {
                MainActor.assumeIsolatedIfLinkedOnOrAfter(.v6, context: nil) {
                    // $s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyyScMYcXEfU2_TA
                    assertUnimplemented()
                }
            }
            
            // <+4632>
            self.applyActivationBehavior(activationBehavior, for: item, to: options)
            
            if windowPlacement != nil {
                // <+4704>
                MainActor.assumeIsolatedIfLinkedOnOrAfter(.v6, context: nil) {
                    // $s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyyScMYcXEfU3_TA
                    assertUnimplemented()
                }
            }
            
            // <+4864>
            request = self.sceneSessionActivationRequest(for: matchingSession, sceneConfiguration: configuration, userActivity: activity, options: options)
            // <+4952>
        case .immersiveSpace(let sceneConfiguration):
            // <+1460>
            let options = _MRUIImmersiveSpaceSceneActivationRequestOptions()
            sceneConfiguration.attributes.customizeSceneActivationRequestOptions(options, isInternalScene: item.isInternal)
            request = self.sceneSessionActivationRequest(for: matchingSession, sceneConfiguration: configuration, userActivity: activity, options: options)
            // <+4952>
        case .volume(let sceneConfiguration):
            // <+1668>
            let options = _UIVolumetricWindowSceneActivationRequestOptions()
            options._isInternal = true
            
            if let defaultSize = item.defaultSize, let depth = item.depth {
                // <+1760>
                let size3D = Size3D(width: defaultSize.width, height: defaultSize.height, depth: depth)
                let sizeInPoints = DefaultSizeBehavior.sizeInPoints(defaultSize: size3D, sizingUnit: item.sizingUnit, scene: nil)
                
                if let resize = Log.resize {
                    // <+2516>
                    resize.log(level: .debug, "Setting preferredLaunchSize3D to \(ResizeLogs.size3D(sizeInPoints))")
                }
                
                // <+2764>
                MainActor.assumeIsolatedIfLinkedOnOrAfter(.v6, context: nil) { 
                    // $s7SwiftUI18VolumeSceneBuilderC28buildWorkspaceRequestOptions3for16withContinuationySo024UISceneSessionActivationH0C_ySo012FBSWorkspacedhI0CSg_s5Error_pSgtctFyyScMYcXEfU_TA
                    // buildWorkspaceRequestOptions와 무관하게 공통으로 쓰이는 block 같음
                    assertUnimplemented()
                }
                
                // <+2908>
            } else {
                // <+2908>
            }
            
            // <+2908>
            let defaultScalingBehavior = item.defaultScalingBehavior.value ?? .trueScale
            MainActor.assumeIsolatedIfLinkedOnOrAfter(.v6, context: nil) { 
                // $s7SwiftUI18VolumeSceneBuilderC28buildWorkspaceRequestOptions3for16withContinuationySo024UISceneSessionActivationH0C_ySo012FBSWorkspacedhI0CSg_s5Error_pSgtctFyyScMYcXEfU0_TA
                _ = defaultScalingBehavior
                assertUnimplemented()
            }
            
            if _SemanticFeature<Semantics_v6>.isEnabled {
                // <+3300>
                options._preferredDisplayZoomBehavior = (defaultScalingBehavior == .dynamicScale) ? .unknown2 : .unknown1
                // <+3396>
            }
            
            // <+3396>
            let worldAlignmentBehavior = item.worldAlignmentBehavior
            let newBehavior: UISceneWorldAlignmentBehavior
            switch worldAlignmentBehavior {
            case .automatic:
                newBehavior = isLinkedOnOrAfter(.v6) ? .frontFacing : .floorAligned 
            case .adaptive:
                newBehavior = .frontFacing
            case .gravityAligned:
                newBehavior = .floorAligned
            }
            options._worldAlignmentBehavior = newBehavior
            
            self.applyActivationBehavior(activationBehavior, for: item, to: options)
            
            if hasProvider {
                // <+3496>
                let anyView = AnyView(
                    sceneConfiguration
                        .mainContent
                        .modifier(sceneConfiguration.attributes.rootModifier)
                )
                let rootView = AppSceneDelegate.makeRootView(anyView)
                let proxy = WindowLayoutHostProxy(rootView: rootView)
                proxy.appendFeatures(volumetric: true)
                let windowLayout = self.makeWindowLayout(item: item)
                if let windowLayout {
                    // inlined
                    proxy.setLayout(windowLayout)
                }
                
                // <+3756>
                WindowLayoutHostProxy.appendPendingLayoutHostProxy(id: item.id, proxy: proxy)
                
                if let windowLayoutComputer = proxy.host.windowLayoutComputer {
                    // <+3972>
                    let windowLayoutComputer = windowLayoutComputer.windowPlacement
                    MainActor.assumeIsolatedIfLinkedOnOrAfter(.v6, context: nil) { 
                        // s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyyScMYcXEfU1_TA
                        assertUnimplemented()
                        _ = windowLayoutComputer
                    }
                    
                    // <+4224>
                    // <+4236>
                } else {
                    // <+4216>
                    // <+4224>
                    // <+4236>
                }
            } else {
                // <+4236>
            }
            
            // <+4236>
            request = self.sceneSessionActivationRequest(for: matchingSession, sceneConfiguration: configuration, userActivity: activity, options: options)
            // <+4952>
        }
        
        // <+4952>
        let block: () -> Void = {
            // $s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyycfU4_Tf4dnnn_n
            let block: () -> Void = {
                // $s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyycfU4_yyXEfU_
                if let scenes = Log.scenes {
                    // <+300>
                    scenes.log(level: .debug, "Sending scene activation request for item \(item.sceneTypeDescription, privacy: .public): \(item.identifyingDescription, privacy: .public)")
                }
                
                // <+720>
                UIApplication.shared.activateSceneSession(for: request) { error in
                    // $s7SwiftUI29SceneNavigationStrategy_PhoneV07performC10Activation33_FB4D19B065EC4D2CC549DBA6E2D239A5LL4item8activity15matchingSession18activationBehavior12errorHandleryAA0C4ListV4ItemV_So14NSUserActivityCSo07UISceneV0CSgAA0chX0OyAC5ErrorOcSgtFyycfU4_yyXEfU_ysAV_pcfU_TA
                    assertUnimplemented()
                }
            }
            
            if let appDelegate = AppDelegate.shared {
                // <+44>
                if case .immersiveSpace(_) = item.value {
                    appDelegate.immersiveSpaceAuthority.isRequestingSwiftUIScene = true
                }
                
                // <+128>
                block()
                
                if case .immersiveSpace(_) = item.value {
                    appDelegate.immersiveSpaceAuthority.isRequestingSwiftUIScene = false
                }
            } else {
                // <+200>
                block()
            }
        }
        
        if isLinkedOnOrAfter(.v6) || Thread.isMainThread {
            // <+5228>
            block()
        } else {
            withoutActuallyEscaping(block) { escapingClosure in
                DispatchQueue.main.async(execute: escapingClosure)
            }
        }
    }
    
    func sceneListItem<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T.Type,
        where: (SceneList.Item) -> Bool
    ) -> SceneList.Item? {
        assertUnimplemented()
    }
    
    func sceneListItem<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T.Type,
        where: (SceneList.Item) -> Bool
    ) -> SceneList.Item? {
        assertUnimplemented()
    }
    
    func openWindow<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T,
        withBehavior: SceneActivationBehavior
    ) {
        assertUnimplemented()
    }
    
    @MainActor func openWindow(namespace: SceneList.Namespace, id: String, withBehavior: SceneActivationBehavior) {
        /*
         namespace -> x0/x1/x2 -> x22/x23/x24
         id -> x3/x4 -> x21/x25
         */
        // <+304>
        guard UIApplication.shared.supportsMultipleScenes else {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Unable to open a window when the app does not support multiple scenes")
            return
        }
        
        let sceneList = self.withSceneList(namespace: namespace) { sceneList in
            // $s7SwiftUI29SceneNavigationStrategy_PhoneV04withC4List33_FB4D19B065EC4D2CC549DBA6E2D239A5LL9namespace2doxSgAA0cH0V9NamespaceO_AhJXEtlFAJyXEfU_TA.40
            return sceneList
        }
        
        guard let sceneList else {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "No Scene with id '%s' is defined", id)
            return
        }
        
        // <+452>
        var targetItem: SceneList.Item?
        itemsLoop: for item in sceneList.items {
            // <+528>
            guard id == item.id.sessionID else {
                continue
            }
            
            // <+800>
            switch item.value {
            case .windowGroup(_):
                targetItem = item
                break itemsLoop
            case .immersiveSpace(_):
                assertUnimplemented()
            case .volume(_):
                assertUnimplemented()
            case .documentGroup(_):
                assertUnimplemented()
            case .settings(_):
                assertUnimplemented()
            case .menuBarExtra(_):
                assertUnimplemented()
            case .customScene(_):
                assertUnimplemented()
            case .singleWindow(_):
                assertUnimplemented()
            case .documentIntroduction(_):
                assertUnimplemented()
            case .alertDialog(_):
                assertUnimplemented()
            }
        }
        
        // <+1324>
        // targetItem -> x20
        guard let targetItem else {
            // <+1660>
            unsafe os_log(.fault, log: .runtimeIssuesLog, "No Scene with id '%s' is defined", id)
            return
        }
        
        // <+1368>
        // x23 (x19 + 0x30)
        let copy_1 = targetItem
        // x19 + 0xa0
        let copy_2 = copy_1.value
        
        switch copy_2 {
        case .windowGroup(_), .volume(_), .singleWindow(_):
            // <+1428>
            break
        case .immersiveSpace(_), .documentGroup(_), .settings(_), .menuBarExtra(_), .customScene(_), .documentIntroduction(_), .alertDialog(_):
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Unable to present a window for Scene id '%s'", id)
            return
        }
        
        // <+1428>
        // x19 + 0xa0
        let copy_3 = copy_1.value
        if case .singleWindow(_) = copy_3 {
            // <+1464>
            for session in UIApplication.shared.openSessions {
                if
                    let userInfo = session.userInfo,
                    let sessionID = userInfo["com.apple.SwiftUI.sceneID"] as? String,
                    sessionID == id
                {
                    // <+2768>
                    let userActivity = self.userActivityForOpeningWindow(id: copy_1.id)
                    self.performSceneActivation(item: copy_1, activity: userActivity, matchingSession: session, activationBehavior: .push(sceneSessionToBeReplaced: session), errorHandler: nil)
                    return
                }
            }
            
            // <+2556>
            // <+2600>
        } else {
            // <+2600>
        }
        
        // <+2600>
        let userActivity = self.userActivityForOpeningWindow(id: copy_1.id)
        self.performSceneActivation(item: copy_1, activity: userActivity, matchingSession: nil, activationBehavior: .default, errorHandler: nil)
    }
    
    func openWindow<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T,
        withBehavior: SceneActivationBehavior
    ) {
        assertUnimplemented()
    }
    
    func openImmersiveSpace(
        namespace: SceneList.Namespace,
        id: String,
        remoteSessionInfo: RemoteScenes.SessionInfo?,
        initialData: Data?
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    func openImmersiveSpace<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        presenting: T
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    func openImmersiveSpace<T : Codable & Hashable>(
        namespace: SceneList.Namespace,
        id: String,
        presenting: T
    ) async -> SceneNavigationStrategy_Phone.Result {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneActivation<T : Codable & Hashable>(
        item: SceneList.Item,
        value: T,
        activationBehavior: SceneActivationBehavior,
        errorHandler: ((SceneNavigationStrategy_Phone.Error) -> Void)?
    ) {
        assertUnimplemented()
    }
    
    @MainActor fileprivate func applyActivationBehavior(
        _ activationBehavior: SceneActivationBehavior,
        for item: SceneList.Item,
        to options: UIWindowScene.ActivationRequestOptions
    ) {
        switch activationBehavior {
        case .push(let session):
            if let session {
                // <+40>
                if session.role == .windowApplication {
                    // <+344>
                    switch item.kind {
                    case .windowGroup, .immersiveSpace:
                        // <+360>
                        options.placement = UIWindowScenePushPlacement(target: session)
                    default:
                        // <+484>
                        unsafe os_log(.fault, log: .runtimeIssuesLog, "PushWindowAction requires the pushed window to be a WindowGroup with a window style of PlainWindowStyle or DefaultWindowStyle")
                    }
                } else {
                    unsafe os_log(.fault, log: .runtimeIssuesLog, "PushWindowAction requires the replaced window to be a DocumentGroup or a WindowGroup with a window style of PlainWindowStyle or DefaultWindowStyle")
                }
            } else {
                // <+232>
                unsafe os_log(.fault, log: .runtimeIssuesLog, "PushWindowAction must be called from within a window")
            }
        case .default:
            return
        }
    }
    
    fileprivate func makeWindowLayout(item: SceneList.Item) -> AnyWindowLayout? {
        assertUnimplemented()
    }
    
    fileprivate func userActivityForOpeningWindow(id: SceneID) -> NSUserActivity {
        // x19
        let activity = NSUserActivity(activityType: NSUserActivity.userActivityTypeOpenWindowByID)
        activity.userInfo = ["com.apple.SwiftUI.sceneID" : id.sessionID]
        activity.requiredUserInfoKeys = ["com.apple.SwiftUI.sceneID"]
        activity.isEligibleForHandoff = false
        return activity
    }
    
    fileprivate func userActivityForOpeningWindow<T : Codable & Hashable>(id: SceneID, value: T) -> NSUserActivity? {
        assertUnimplemented()
    }
    
    fileprivate func existingSession<T : Codable & Hashable>(id: SceneID, value: T) -> UISceneSession? {
        assertUnimplemented()
    }
    
    fileprivate func existingSessions(with id: SceneID) -> [UISceneSession] {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneDestruction(id: SceneID) {
        assertUnimplemented()
    }
    
    fileprivate func handleSceneDestruction<T : Codable & Hashable>(id: SceneID, value: T) {
        assertUnimplemented()
    }
    
    func dismissWindow<T : Codable & Hashable>(namespace: SceneList.Namespace, value: T) {
        assertUnimplemented()
    }
    
    func dismissWindow<T : Codable & Hashable>(namespace: SceneList.Namespace, id: String, value: T) {
        assertUnimplemented()
    }
    
    fileprivate func dismissWindow(namespace: SceneList.Namespace, id: String) {
        assertUnimplemented()
    }
    
    func transitionImmersiveSpace(sceneIDs: [SceneID]) {
        assertUnimplemented()
    }
    
    func dismissImmersiveSpace() async {
        assertUnimplemented()
    }
    
    fileprivate func sceneSessionActivationRequest(
        for session: UISceneSession?,
        sceneConfiguration: UISceneConfiguration,
        userActivity: NSUserActivity?,
        options: UIScene.ActivationRequestOptions?
    ) -> UISceneSessionActivationRequest {
        if let session {
            // <+152>
            if let scenes = Log.scenes {
                scenes.log(level: .debug, "Creating scene session activation request for existing session: \(session, privacy: .public) userActivity: \(userActivity, privacy: .public) options: \(options, privacy: .public)")
            }
            
            // <+924>
            return UISceneSessionActivationRequest(session: session, userActivity: userActivity, options: options)
        } else {
            // <+252>
            if let scenes = Log.scenes {
                scenes.log(level: .debug, "Creating scene session activation request for new configuration: \(sceneConfiguration, privacy: .public) userActivity: \(userActivity, privacy: .public) options: \(options, privacy: .public)")
            }
            
            return UISceneSessionActivationRequest(configuration: sceneConfiguration, userActivity: userActivity, options: options)
        }
    }
    
    @inline(always) // 원래 없음
    mutating func removeCache(id: String, value: AnyHashable) {
        let item = SceneRequestCache.Item(id: id, value: value)
        self.sceneRequestCache.sceneActivationRequestCache.remove(item)
    }
}

extension SceneNavigationStrategy_Phone {
    enum Result {
        case failure(SceneNavigationStrategy_Phone.Error)
        case opened
    }
    
    enum Error {
        case system(NSError)
        case userActivityEncoding
        case invalidRequest
    }
}

fileprivate final class SceneRequestCache {
    var sceneActivationRequestCache: Set<SceneRequestCache.Item> = []
    
    func requestInCacheAddIfNotPresent<T : Codable & Hashable>(id: SceneID, value: T) -> Bool {
        assertUnimplemented()
    }
}

extension SceneRequestCache {
    struct Item : Hashable {
        let id: String
        let value: AnyHashable
    }
}

enum SceneActivationBehavior {
    case push(sceneSessionToBeReplaced: UISceneSession?)
    case `default`
}

extension NSUserActivity {
    static let userActivityTypeOpenWindowByID = "\(Bundle.main.bundleIdentifier ?? "com.apple.SwiftUI").openWindowByID"
}

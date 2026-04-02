// 4475FD12FD59DEBA453321BD91F6EA04
internal import UIKit
@_spi(Internal) private import MySwiftUICore
private import os.log
private import _UIKitPrivate
private import Observation
private import Combine
private import _SwiftPrivate

// _TtC7SwiftUI16AppSceneDelegate
final class AppSceneDelegate : NSObject, UIWindowSceneDelegate {
    @safe nonisolated(unsafe) fileprivate static var hasConnectedFirstScene = false
    
    var window: UIWindow? = nil // 0x10
    private(set) var sceneItemID: SceneID? = nil // 0x18
    private var sceneNamespace: SceneList.Namespace = .app // 0x30
    private var lastVersion = DisplayList.Version() // 0x48
    private var sceneBridge: SceneBridge? = nil // 0x50
    private var remoteSceneBridge: RemoteScenes.Bridge? = nil // 0x58
    private var scenePhase: ScenePhase = .background // 0x60
    private var sceneDelegateBox: AnyFallbackDelegateBox? = nil // 0x68
    private var sceneStorageValues: SceneStorageValues? = nil // 0x70
    private var presentationDataType: Any.Type? = nil // 0x78
    private var rawPresentationDataValue: Data? = nil // 0x80
    private var presentationDataValue: AnyHashable? = nil // 0x90
    private var connectionOptions: UIScene.ConnectionOptions? = nil // 0xb8
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        assertUnimplemented()
    }
    
    override init() {
        super.init()
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        if let sceneDelegateBox, let delegate = sceneDelegateBox.delegate as? UISceneDelegate {
            return delegate.responds(to: aSelector)
        } else {
            return type(of: self).instancesRespond(to: aSelector)
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        assertUnimplemented()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        assertUnimplemented()
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        /*
         self -> x20 -> x22
         scene -> x0 -> x19 + 0x138
         session -> x1 -> x26
         connectionOptions -> x2 -> x19 + 0x118
         */
        // <+928>
        Update.begin()
        
        if let log = Log.scenes {
            log.info("Received scene connection to session: \(session, privacy: .public)")
        }
        
        // <+1308>
        guard
            window == nil,
            let windowScene = scene as? UIWindowScene // x19 + 0x50
        else {
            Update.end()
            return
        }
        
        guard let graph = AppGraph.shared else {
            if let delegateClass = session.configuration.delegateClass as? any UIHostingSceneDelegate.Type {
                // <+1384>
                if let openScene = Log.openScene {
                    openScene.log(level: .debug, "Registering bridged scene delegate \(delegateClass) and connecting the graph")
                }
                
                // <+1800>
                BridgedSceneCoordinator.shared.register(delegateClass)
            }
            
            Update.end()
            return
        }
        
        // <+1900>
        if ViewGraphHost.isDefaultEnvironmentConfigured {
            unsafe graph.setEnvironment(ViewGraphHost.defaultEnvironment)
        }
        
        // <+2004>
        if let payload = connectionOptions[OpenSceneConnectionOptionDefinition.self] {
            // <+2244>
            if let openScene = Log.openScene {
                openScene.log(level: .debug, "Using namespace from connection options: \(payload.namespace)")
            }
            
            self.sceneNamespace = payload.namespace
            // <+3504>
        } else {
            // <+2104>
            if let delegateClass = session.configuration as? any UIHostingSceneDelegate.Type {
                if let openScene = Log.openScene {
                    openScene.log(level: .debug, "Using namespace from UISceneConfiguration's delegateClass: \(delegateClass)")
                }
                
                // <+3444>
                self.sceneNamespace = .host(ObjectIdentifier(delegateClass))
                // <+3504>
            } else {
                // <+2320>
                if let bridgingID = session.configuration._bridgingID {
                    // <+2364>
                    if let openScene = Log.openScene {
                        openScene.log(level: .debug, "Using namespace from UISceneConfiguration's bridgingID: \(bridgingID)")
                    }
                    
                    self.sceneNamespace = .string(bridgingID)
                    // <+3504>
                } else {
                    // <+2816>
                    self.sceneNamespace = .app
                    // <+3504>
                }
            }
        }
        
        // <+3504>
        /*
         true -> <+3604>
         false -> <+4444>
         */
        let flag_1: Bool
        if
            let delegateClass = session.configuration.delegateClass,
            type(of: delegateClass) == AppSceneDelegate.Type.self
        {
            // <+4444>
            flag_1 = false
        } else {
            // <+3568>
            flag_1 = (session.configuration.delegateClass != nil)
        }
        
        /*
         nonnil -> <+5504>
         nil -> <+6136>
         */
        let incomingConfiguration: UISceneConfiguration?
        if flag_1 {
            // <+3604>
            let configuration = session.configuration
            if let openScene = Log.openScene {
                openScene.log(level: .info, "Scene session \(session.persistentIdentifier) is using scene bridging with configuration: \(configuration, privacy: .public) with delegateClass: \(String(describing: configuration.delegateClass), privacy: .public)")
            }
            
            // <+5504>
            incomingConfiguration = configuration
        } else {
            // <+4444>
            if let appDelegate = AppDelegate.shared {
                // <+4456>
                if let fallbackDelegate = appDelegate.fallbackDelegate {
                    if fallbackDelegate.responds(to: #selector(UIApplicationDelegate.application(_:configurationForConnecting:options:))) {
                        // <+4508>
                        let _configuration = (fallbackDelegate as AnyObject).application?(UIApplication.shared, configurationForConnecting: session, options: connectionOptions)
                        
                        if let _configuration {
                            // <+4624>
                            if let openScene = Log.openScene {
                                openScene.log(level: .info, "Scene session \(session.persistentIdentifier) is asking fallback app delegate: \(String(describing: fallbackDelegate), privacy: .public) for custom scene configuration: \(_configuration, privacy: .public) with delegateClass: \(String(describing: _configuration.delegateClass), privacy: .public)")
                            }
                            
                            // <+5500>
                            incomingConfiguration = _configuration
                        } else {
                            // <+4772>
                            incomingConfiguration = nil
                        }
                    } else {
                        // <+4732>
                        incomingConfiguration = nil
                    }
                } else {
                    // <+4724>
                    incomingConfiguration = nil
                }
            } else {
                // <+4716>
                incomingConfiguration = nil
            }
        }
        
        if let incomingConfiguration {
            // <+5500>
            if let delegateClass = incomingConfiguration.delegateClass {
                // <+5524>
                if
                    let sceneDelegate = incomingConfiguration.sceneDelegate(),
                    sceneDelegate is any UIHostingSceneDelegate,
                    let casted = delegateClass as? any UIHostingSceneDelegate.Type
                {
                    // <+5584>
                    BridgedSceneCoordinator.shared.register(casted)
                    // <+5660>
                }
                
                // <+5660>
                if let casted = delegateClass as? Observable.Type {
                    func project<T : Observable>(key: T.Type) {
                        self.sceneDelegateBox = ObjectFallbackDelegateBox(casted as! T.Type)
                    }
                    
                    _openExistential(casted, do: project)
                    // <+6060>
                } else {
                    // <+5716>
                    if let conformance = ObservableObjectDescriptor.conformance(of: delegateClass) {
                        // <+5900>
                        // x29 - 0xf0
                        let box = MakeObservableObjectDelegateBox(value: self, box: nil)
                        let observableObject = conformance.unsafeExistentialMetatype((any ObservableObject.Type).self)
                        box.visit(type: observableObject)
                        // <+6060>
                    } else {
                        // <+5784>
                        self.sceneDelegateBox = FallbackDelegateBox(delegateClass)
                        // <+6060>
                    }
                }
                
                // <+6060>
                let delegate = windowScene.delegate
                windowScene.delegate = nil
                windowScene.delegate = delegate
                // <+6140>
            } else {
                // <+5708>
                // <+6140>
            }
        }
        
        // <+6136>
        // x19 + 0x218
        var sceneID: SceneID? = nil
        let userInfo: [AnyHashable: Any]
        if
            let stateRestorationActivity = session.stateRestorationActivity,
            let _userInfo = stateRestorationActivity.userInfo
        {
            if let id = _userInfo["com.apple.SwiftUI.sceneID"] as? String {
                sceneID = .string(id)
            }
            
            if let scenes = Log.scenes {
                scenes.log(level: .debug, "Scene session \(session.persistentIdentifier, privacy: .public) has restoration data: \(_userInfo, privacy: .private)")
            }
            userInfo = _userInfo
            // <+6924>
        } else {
            // <+6504>
            userInfo = [:]
            // <+6924>
        }
        
        // <+6924>
        self.sceneStorageValues = SceneStorageValues(encodedValues: userInfo)
        
        // <+7008>
        let sceneBridge = SceneBridge()
        sceneBridge.windowScene = windowScene
        self.sceneBridge = sceneBridge
        
        // <+7128>
        self.connectionOptions = connectionOptions
        
        var urlContexts = connectionOptions.urlContexts
        let resolvedWindow: UIWindow = Update.ensure {
            // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtFSo8UIWindowCyXEfU_
            return self.makeSceneHostWindow(
                restorationSceneItemID: sceneID,
                restorationData: userInfo,
                connectionOptions: connectionOptions,
                urlContexts: &urlContexts,
                role: session.role,
                windowScene: windowScene,
                delegate: self
            )
        }
        
        // <+7380>
        let sceneItem = self.sceneItem()
        
        do {
            var userInfo: [String : Any]?
            if var _userInfo = session.userInfo {
                if let hashableSceneID = self.hashableSceneID() {
                    _userInfo["com.apple.SwiftUI.sceneID"] = hashableSceneID
                } else {
                    // <+7644>
                    _userInfo.removeValue(forKey: "com.apple.SwiftUI.sceneID")
                }
                
                userInfo = _userInfo
            } else {
                userInfo = nil
            }
            
            session.userInfo = userInfo
        }
        
        // <+7744>
        do {
            var userInfo: [String : Any]?
            if var _userInfo = session.userInfo {
                if let presentationDataType {
                    _userInfo["com.apple.SwiftUI.sceneType"] = presentationDataType
                } else {
                    _userInfo.removeValue(forKey: "com.apple.SwiftUI.sceneType")
                }
                
                userInfo = _userInfo
            } else {
                userInfo = nil
            }
            
            session.userInfo = userInfo
        }
        
        // <+8152>
        if
            let rawPresentationDataValue,
            let presentationDataValue
        {
            // <+8252>
            do {
                var userInfo: [String : Any]?
                if var _userInfo = session.userInfo {
                    _userInfo["com.apple.SwiftUI.sceneValue"] = rawPresentationDataValue
                    userInfo = _userInfo
                } else {
                    userInfo = nil
                }
                
                session.userInfo = userInfo
            }
            
            // <+8556>
            unsafe SceneNavigationStrategy_Phone.shared.removeCache(id: self.hashableSceneID()!, value: presentationDataValue)
        }
        
        // <+8772>
        if
            case .disabled = sceneItem.restorationBehavior,
            let stateRestorationActivity = session.stateRestorationActivity,
            stateRestorationActivity.activityType == "com.apple.SwiftUI.stateRestoration"
        {
            session.stateRestorationActivity = nil
        }
        
        // <+8960>
        sceneBridge.rootViewController = resolvedWindow.rootViewController
        self.window = resolvedWindow
        resolvedWindow.makeKeyAndVisible()
        
        // <+9028>
        for type in sceneItem.connectionOptionPayloadStorage.types {
            func _do<T : UISceneConnectionOptionDefinition>(_ type: T.Type) {
                // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtF06handlemN9CallbacksL_yyAA0M20OptionPayloadStorageVF3_doL_yyxm5UIKit0kmQ10DefinitionRzlFTf4nnx_n
                assertUnimplemented()
            }
            
            _do(type)
        }
        
        // <+9096>
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { 
            // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtFyyScMYccfU0_TA
            for type in sceneBridge.sceneDefinitionOptions.types {
                func _do<T : UISceneConnectionOptionDefinition>(_ type: T.Type) {
                    // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtF06handlemN9CallbacksL_yyAA0M20OptionPayloadStorageVF3_doL_yyxm5UIKit0kmQ10DefinitionRzlFTf4nnx_n
                    assertUnimplemented()
                }
                
                _openExistential(type, do: _do)
            }
        }
        
        
        // <+9576>
        if let _ = connectionOptions.userActivities.first {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtFyyScMYccfU1_TA
                assertUnimplemented()
            }
        }
        
        // <+10052>
        if let _ = urlContexts.first {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtFyyScMYccfU2_TA
                assertUnimplemented()
            }
        }
        
        // <+10436>
        graph.addPreference(CommandsKey.self)
        graph.addObserver(self)
        
        if let delegate = sceneDelegateBox?.delegate as? UISceneDelegate {
            delegate.scene?(scene, willConnectTo: session, options: connectionOptions)
        }
        
        // <+10644>
        if let delegate = AppDelegate.shared {
            delegate.immersiveSpaceAuthority.sceneConnected(scene: scene, namespace: self.sceneNamespace, item: sceneItem)
            delegate.addWindowProxy(for: windowScene)
        }
        
        // <+10788>
        AttachmentRegistrationManager.shared.registerSceneIfNeeded(windowScene)
        
        DispatchQueue.main.async { 
            // $s7SwiftUI16AppSceneDelegateC5scene_13willConnectTo7optionsySo7UISceneC_So0K7SessionCSo0K17ConnectionOptionsCtFyyScMYccfU3_TA
            UIApplication.shared._saveRestorationUserActivityState(for: scene)
        }
        
        if !AppSceneDelegate.hasConnectedFirstScene {
            AppSceneDelegate.hasConnectedFirstScene = true
        }
        
        if let scenes = Log.scenes {
            scenes.log(level: .info, "Finished willConnectTo for session \(session.persistentIdentifier) with scene \(windowScene)")
        }
        
        Update.end()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        self.scenePhase = .active
        
        if let delegate = sceneDelegateBox?.delegate as? UISceneDelegate {
            delegate.sceneDidBecomeActive?(scene)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        self.scenePhase = .background
        
        if
            let window,
            let rootViewController = window.rootViewController, // x22
            let sceneItemID
        {
            self.scenesDidChange(phaseChanged: true)
            PlatformSceneCache.shared.setPhase(self.scenePhase, id: sceneItemID, host: rootViewController)
        }
        
        if
            let sceneDelegateBox,
            let delegate = sceneDelegateBox.delegate as? UISceneDelegate
        {
            delegate.sceneDidEnterBackground?(scene)
        }
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        /*
         self -> x20 -> x21
         scene -> x0 -> x19
         */
        self.scenePhase = .active
        
        if
            let window,
            let rootViewController = window.rootViewController,
            let sceneItemID
        {
            // rootViewController -> x22
            self.scenesDidChange(phaseChanged: true)
            PlatformSceneCache.shared.setPhase(self.scenePhase, id: sceneItemID, host: rootViewController)
        }
        
        // <+244>
        if let delegate = sceneDelegateBox?.delegate as? UISceneDelegate {
            delegate.sceneWillEnterForeground?(scene)
        }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        /*
         self -> x20 -> x21
         scene -> x0 -> x19
         */
        self.scenePhase = .inactive
        
        if
            let window,
            let rootViewController = window.rootViewController, // x22
            let sceneItemID
        {
            // <+84>
            self.scenesDidChange(phaseChanged: true)
            PlatformSceneCache.shared.setPhase(self.scenePhase, id: sceneItemID, host: rootViewController)
        }
        
        // <+244>
        if
            let sceneDelegateBox,
            let delegate = sceneDelegateBox.delegate as? UISceneDelegate
        {
            delegate.sceneWillResignActive?(scene)
        }
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        // self -> x20 -> x22
        // <+156>
        // x25
        let item = self.sceneItem()
        if case .volume(_) = item.value {
            return nil
        }
        
        let activity = NSUserActivity(activityType: "com.apple.SwiftUI.stateRestoration")
        // x21
        var encodedValues: [AnyHashable: Any] = .init()
        
        if let sceneStorageValues {
            // inlined
            sceneStorageValues.encode(into: &encodedValues)
        }
        
        // <+640>
        // x29 - 0x60
        var keys: Set<String> = []
        
        if let presentationDataType {
            encodedValues[AnyHashable("com.apple.SwiftUI.sceneType")] = makeStableTypeData(presentationDataType).description
        }
        
        // <+860>
        if let sceneItemID {
            let id = sceneItemID.sessionID
            encodedValues[AnyHashable("com.apple.SwiftUI.sceneID")] = id
            keys.insert("com.apple.SwiftUI.sceneID")
        }
        
        // <+1148>
        if let rawPresentationDataValue {
            encodedValues[AnyHashable("com.apple.SwiftUI.sceneValue")] = rawPresentationDataValue
            keys.insert("com.apple.SwiftUI.sceneValue")
        }
        
        // <+1368>
        if !keys.isEmpty {
            activity.requiredUserInfoKeys = keys
        }
        
        activity.userInfo = encodedValues
        return activity
    }
    
    fileprivate func makeSceneHostWindow(
        restorationSceneItemID: SceneID?,
        restorationData: [AnyHashable: Any],
        connectionOptions: UIScene.ConnectionOptions,
        urlContexts: inout Set<UIOpenURLContext>,
        role: UISceneSession.Role,
        windowScene: UIWindowScene,
        delegate: UIHostingViewDelegate
    ) -> UIWindow {
        // $s7SwiftUI16AppSceneDelegateC04makeD10HostWindow33_4475FD12FD59DEBA453321BD91F6EA04LL011restorationD6ItemID0O4Data17connectionOptions11urlContexts4role06windowD08delegateSo8UIWindowCAA0dQ0OSg_SDys11AnyHashableVypGSo017UISceneConnectionT0CShySo16UIOpenURLContextCGzSo18UISceneSessionRoleaSo0zD0CAA013UIHostingViewE0_ptFTf4nnnnnnen_nAC_Tg5
        /*
         restorationSceneItemID -> x0/x1/w2 -> x19 + 0x120/ x19 + 0x128 / x19 + 0x130
         restorationData -> x3 -> x19 + 0xe0
         connectionOptions -> x4 -> x19 + 0x148
         urlContexts -> x5 -> x19 + 0x138
         role -> x6 -> x19 + 0x160
         windowScene -> x7 -> x19 + 0x178
         */
        // <+1312>
        // x20
        guard let appGraph = AppGraph.shared else {
            preconditionFailure("Missing app graph.")
        }
        
        // <+1324>
        // self -> x29 - 0x18 -> x21
        // x26
        let _ = appGraph.sceneList(namespace: self.sceneNamespace)
        // x25
        let sceneListItem = self.findSceneListItem(
            restorationSceneItemID: restorationSceneItemID,
            restorationData: restorationData,
            connectionOptions: connectionOptions,
            urlContexts: &urlContexts,
            role: role
        )
        
        if let scenes = Log.scenes {
            scenes.log(level: .info, "Scene session \(windowScene.session.persistentIdentifier, privacy: .public) will use item \(sceneListItem.sceneTypeDescription, privacy: .public) with \(sceneListItem.identifyingDescription, privacy: .public)")
        }
        
        // <+2088>
        if
            !AppSceneDelegate.hasConnectedFirstScene,
            let preferredDefaultSceneSessionRole = UIApplication.shared._preferredDefaultSceneSessionRole(),
            let sceneSessionRole = sceneListItem.sceneSessionRole,
            sceneSessionRole != preferredDefaultSceneSessionRole
        {
            // <+2300>
            Log.externalWarning("Your app was granted an initial scene with scene session role \(sceneSessionRole) but prefers an initial scene session role of \(preferredDefaultSceneSessionRole). If your initial scene is unexpected, verify the value for key UIApplicationPreferredDefaultSceneSessionRole in your Application Scene Manifest.")
        }
        
        var pendingHost: UIHostingController<ModifiedContent<AnyView, RootModifier>>? {
            // $s7SwiftUI16AppSceneDelegateC04makeD10HostWindow33_4475FD12FD59DEBA453321BD91F6EA04LL011restorationD6ItemID0O4Data17connectionOptions11urlContexts4role06windowD08delegateSo8UIWindowCAA0dQ0OSg_SDys11AnyHashableVypGSo017UISceneConnectionT0CShySo16UIOpenURLContextCGzSo18UISceneSessionRoleaSo0zD0CAA013UIHostingViewE0_ptF07pendingG0L_AA19UIHostingControllerCyAA15ModifiedContentVyAA7AnyViewVAA12RootModifierVGGSgvgTf0sn_n
            return WindowLayoutHostProxy.pendingHost(item: sceneListItem, rootViewType: ModifiedContent<AnyView, RootModifier>.self)
        }
        
        func configureHostingController<Content : View>(_ hostingController: UIHostingController<Content>) {
            // $s7SwiftUI16AppSceneDelegateC04makeD10HostWindow33_4475FD12FD59DEBA453321BD91F6EA04LL011restorationD6ItemID0O4Data17connectionOptions11urlContexts4role06windowD08delegateSo8UIWindowCAA0dQ0OSg_SDys11AnyHashableVypGSo017UISceneConnectionT0CShySo16UIOpenURLContextCGzSo18UISceneSessionRoleaSo0zD0CAA013UIHostingViewE0_ptF26configureHostingControllerL_yyAA19UIHostingControllerCyxGAA4ViewRzlFAA15ModifiedContentVyAA7AnyViewVAA12RootModifierVG_Tg5Tf4nnnenn_nAC_Tg5
            // <+772>
            let host = hostingController.host
            if let scenes = Log.scenes {
                scenes.log(level: .debug, "Scene session \(windowScene.session.persistentIdentifier) will have a UIHostingController: \(hostingController)\nwith UIHostingView: \(host)\nwith UIHostingViewBase: \(host.base)")
            }
            
            // <+1500>
            host.sceneBridge = self.sceneBridge
            host.delegate = self
            
            // <+1592>
            if self.sceneBridge != nil {
                let viewGraph = hostingController.host.base.viewGraph.viewGraph
                if PPTFeature.isEnabled {
                    if let feature = unsafe viewGraph[PPTFeature.self]?.pointee {
                        viewGraph.append(feature: feature)
                    }
                }
                
                // <+1752>
                if let sceneBridge {
                    // <+1772>
                    let viewGraph = hostingController.host.base.viewGraph.viewGraph
                    let sceneIsVolume = sceneBridge.sceneIsVolume
                    
                    if isLinkedOnOrAfter(.v6) {
                        if sceneIsVolume {
                            // <+1920>
                            if unsafe viewGraph[ContentSizedSceneFeature<VolumeThatFitsMeasurer>.self] == nil {
                                let feature = ContentSizedSceneFeature<VolumeThatFitsMeasurer>.volume(graph: viewGraph)
                                viewGraph.append(feature: feature)
                            }
                            
                            // <+2064>
                            viewGraph.setVolumeResizeDelegate(hostingController)
                            // <+2276>
                        } else {
                            // <+2108>
                            if unsafe viewGraph[ContentSizedSceneFeature<SizeThatFitsMeasurer>.self] == nil {
                                let feature = ContentSizedSceneFeature<SizeThatFitsMeasurer>.window(graph: viewGraph)
                                viewGraph.append(feature: feature)
                            }
                            
                            // <+2256>
                            viewGraph.setWindowResizeDelegate(hostingController)
                            // <+2276>
                        }
                        
                        // <+2276>
                    }
                    
                    // <+2296>
                }
                
                // <+2300>
            }
            
            // <+2300>
            if
                case .immersiveSpace = sceneListItem.kind,
                let appDelegate = AppDelegate.shared,
                let _ = appDelegate.immersiveSpaceAuthority.currentRemoteSessionInfo
            {
                // <+2384>
                assertUnimplemented()
            }
            
            // <+2888>
            let predicates: (preferring: Predicate<String>?, allowing: Predicate<String>?) = (nil, nil)
            
            if case .singleWindow = sceneListItem.kind {
                // <+2968>
                assertUnimplemented()
            }
            
            // <+3084>
            if let sceneBridge {
                sceneBridge.defaultActivationConditions = predicates
            }
            
            // <+3188>
            hostingController.host.base.inheritedEnvironment = sceneListItem.environment
            
            // <+3384>
            if let _ = windowScene.sizeRestrictions {
                hostingController.sizingOptions = sceneListItem.resizability.sizingOptions
                
                // <+3504>
                if let defaultSize = sceneListItem.defaultSize {
                    let flag: Bool
                    if isLinkedOnOrAfter(.v7) {
                        flag = sceneListItem.sizingUnit == LengthUnit.points
                    } else {
                        flag = true
                    }
                    
                    if flag {
                        // <+3672>
                        if let sceneBridge {
                            // <+3684>
                            sceneBridge.initialSceneSizeState = .unset(_ProposedSize(defaultSize))
                            // <+3796>
                        } else {
                            // <+3796>
                        }
                    } else {
                        // <+3796>
                    }
                } else {
                    // <+3796>
                }
            }
            
            // <+3796>
            if sceneListItem.options.contains(.unknown1) {
                hostingController.host.base.safeAreaRegions = []
            }
            
            // <+3852>
            let scenePresentationBridge = ScenePresentationBridge()
            scenePresentationBridge.host = hostingController.host
            hostingController.host.base.viewGraph.viewGraph.addPreference(PresentedSceneValueKey.self)
            
            // <+4124>
            hostingController.host.scenePresentationBridge = scenePresentationBridge
            
            if role == .windowApplicationVolumetric {
                // <+4316>
                assertUnimplemented()
            }
            
            // <+4600>
            let sceneBridge = self.sceneBridge!
            let viewGraph = hostingController.host.base.viewGraph.viewGraph
            sceneBridge.viewGraph = viewGraph
            viewGraph.addPreference(SceneBridge.UserActivityPreferenceKey.self)
            viewGraph.addPreference(SceneBridge.ActivationConditionsPreferenceKey.self)
            viewGraph.addPreference(NavigationTitleKey.self)
            viewGraph.addPreference(ConnectionOptionPayloadStoragePreferenceKey.self)
            viewGraph.addPreference(ContentCaptureProtectionPreferenceKey.self)
        }
        
        // <+2540>
        let window: UIWindow
        let _hostingController: UIViewController
        
        switch sceneListItem.value {
        case .windowGroup(let configuration):
            // <+3328>
            self.presentationDataType = configuration.presentationDataType
            
            let presentedValue = self.openWindowPresentedValue(
                from: connectionOptions,
                restorationData: restorationData,
                config: configuration
            )
            
            if let presentedValue {
                self.presentationDataValue = presentedValue.0
                self.rawPresentationDataValue = presentedValue.1
            }
            
            // <+5364>
            let sceneAllowsSecureDrawing = sceneListItem.environment.sceneAllowsSecureDrawing
            let rootView = self.makeRootView(configuration.mainContent)
            let resolvedPendingHost = pendingHost
            
            let hostingController: UIHostingController<ModifiedContent<AnyView, RootModifier>>
            if let resolvedPendingHost {
                // <+9412>
                hostingController = resolvedPendingHost
            } else if !sceneAllowsSecureDrawing {
                // <+9360>
                hostingController = UIHostingController<ModifiedContent<AnyView, RootModifier>>(rootView: rootView)
            } else {
                // <+5468>
                hostingController = _UISecureHostingController<ModifiedContent<AnyView, RootModifier>>(rootView: rootView)
                // <+9416>
            }
            _hostingController = hostingController
            
            // <+9416>
            if configuration.attributes.suppressGlassBackground {
                hostingController.overridePreferredContainerBackgroundStyle = .hidden
            }
            
            // <+9452>
            if case .disabled = sceneListItem.restorationBehavior {
                var conditions = windowScene._destructionConditions
                conditions.insert(.systemDisconnection)
                windowScene._destructionConditions = conditions
            }
            
            // <+9552>
            if case .suppressed = sceneListItem.defaultLaunchBehavior {
                var conditions = windowScene._destructionConditions
                conditions.insert(.userInitiatedDismissal)
                windowScene._destructionConditions = conditions
            }
            
            // <+9644>
            configureHostingController(hostingController)
            
            if sceneAllowsSecureDrawing {
                window = UISecureWindow(windowScene: windowScene)
            } else {
                window = UIWindow(windowScene: windowScene)
            }
            
            if let scenes = Log.scenes {
                scenes.log(level: .debug, "Scene session \(windowScene.session.persistentIdentifier) has created a window \(window)")
            }
            
            // <+12856>
        case .immersiveSpace(_):
            // <+2684>
            assertUnimplemented()
        case .volume(_):
            // <+3596>
            assertUnimplemented()
        case .documentGroup(_):
            // <+2596>
            assertUnimplemented()
        case .settings(_):
            // <+13260>
            assertUnimplemented()
        case .menuBarExtra(_):
            // <+13260>
            assertUnimplemented()
        case .customScene(_):
            // <+3888>
            assertUnimplemented()
        case .singleWindow(_):
            // <+3008>
            assertUnimplemented()
        case .documentIntroduction(_):
            // <+4028>
            assertUnimplemented()
        case .alertDialog(_):
            // <+13260>
            assertUnimplemented()
        }
        
        // <+12856>
        self.sceneItemID = sceneListItem.id
        self.lastVersion = sceneListItem.version
        
        PlatformSceneCache.shared.addHost(_hostingController, id: sceneListItem.id)
        window.applyAccessibilityProperties(from: sceneListItem.accessibilityProperties)
        window.rootViewController = _hostingController
        
        return window
    }
    
    fileprivate func findSceneListItem(
        restorationSceneItemID: SceneID?,
        restorationData: [AnyHashable: Any],
        connectionOptions: UIScene.ConnectionOptions,
        urlContexts: inout Set<UIOpenURLContext>,
        role: UISceneSession.Role
    ) -> SceneList.Item {
        // $s7SwiftUI16AppSceneDelegateC04findD8ListItem33_4475FD12FD59DEBA453321BD91F6EA04LL011restorationdH2ID0O4Data17connectionOptions11urlContexts4roleAA0dG0V0H0VAA0dP0OSg_SDys11AnyHashableVypGSo017UISceneConnectionS0CShySo16UIOpenURLContextCGzSo0Y11SessionRoleatF
        /*
         self -> x20
         restorationSceneItemID -> x0/x1/w2 -> x19 + 0x158 / x19 + 0x120 / x19 + 0x118
         connectionOptions -> x4 -> x19 + 0xd8
         urlContexts -> x5 -> x19 + 0x60
         role -> x6 -> x19 + 0x130
         */
        // <+1260>
        // x27
        guard let appGraph = AppGraph.shared else {
            preconditionFailure("Missing app graph.")
        }
        
        // x21 (x19 + 0x128)
        let sceneList = appGraph.sceneList(namespace: self.sceneNamespace)
        
        if let restorationSceneItemID {
            for item in sceneList.items {
                // <+1676>
                if restorationSceneItemID == item.id {
                    return item
                }
            }
            
            // <+1972>
        }
        
        // <+1972>
        if let item = sceneList.itemForConnectionOptions(connectionOptions) {
            // <+2844>
            if let openScene = Log.openScene {
                // <+2976>
                openScene.log(level: .debug, "Found item matching openWindow connection options \(item.id.sessionID)")
            }
            
            return item
        }
        
        // <+2028>
        for item in sceneList.items {
            // <+2160>
            switch item.value {
            case .customScene(_):
                // <+2308>
                assertUnimplemented()
            default:
                break
            }
        }
        
        // <+3208>
        // x25
        var items: [SceneList.Item] = []
        for item in sceneList.items {
            // <+3340>
            // inlined
            guard
                let sceneSessionRole = item.sceneSessionRole,
                sceneSessionRole == role
            else {
                continue
            }
            
            items.append(item)
        }
        
        // <+4196>
        let userActivity = connectionOptions.userActivities.first
        let contentIdentifier = SceneBridge.targetContentIdentifierForExternalEvent(userActivity: userActivity, url: urlContexts.first?.url)
        
        // <+4464>
        if let contentIdentifier {
            for item in items {
                guard let activationConditions = item.activationConditions else {
                    continue
                }
                
                for condition in activationConditions {
                    guard condition != "" else {
                        continue
                    }
                    
                    if condition == "*" {
                        return item
                    }
                    
                    if contentIdentifier.contains(condition) {
                        return item
                    }
                }
            }
        }
        
        // <+5076>
        // x20
        var item: SceneList.Item?
        for _item in items {
            if case .presented = _item.defaultLaunchBehavior {
                item = _item
                break
            }
        }
        
        // <+5252>
        if item == nil {
            // <+5340>
            for _item in items {
                if case .automatic = _item.defaultLaunchBehavior {
                    item = _item
                    break
                }
            }
            
            if item == nil {
                // <+5908>
                for _item in items {
                    if case .suppressed = _item.defaultLaunchBehavior {
                        item = _item
                        break
                    }
                }
            }
        }
        
        // <+6316>
        if let item {
            // <+6528>
            switch item.defaultLaunchBehavior {
            case .automatic, .presented:
                break
            case .suppressed:
                if let sceneSessionRole = item.sceneSessionRole {
                    Log.externalWarning("The app was granted an initial scene with scene session role \(sceneSessionRole) but the best matching scene in the app body is suppressed for launch. Verify the value for key UIApplicationPreferredDefaultSceneSessionRole in the Application Scene Manifest and the default launch behaviors are satisfiable.")
                }
            }
            
            return item
        }
        
        // <+6320>
        guard !items.isEmpty else {
            preconditionFailure("Your app was given a scene with scene session role \(role) but no scenes declared in your app body match this role.")
        }
        
        return items.first!
    }
    
    @specialized(where T == WindowGroupConfigurationAttributes)
    @specialized(where T == ImmersiveSpaceConfigurationAttributes)
    @specialized(where T == VolumeConfigurationAttributes)
    fileprivate func openWindowPresentedValue<T : WindowSceneConfigurationAttributes>(
        from connectionOptions: UIScene.ConnectionOptions,
        restorationData: [AnyHashable: Any],
        config: WindowSceneConfiguration<T>
    ) -> (AnyHashable, Data)? {
        assert(T.self == WindowGroupConfigurationAttributes.self, "나머지는 검증이 필요함")
        /*
         connectionOptions -> x0 -> x20
         restorationData -> x1 -> x24
         config -> x2 -> x21
         return pointer -> x8 -> x19
         */
        // <+180>
        guard let _ = config.decoder else {
            return nil
        }
        
        assertUnimplemented()
    }
    
    func makeRootView(_ view: AnyView) -> ModifiedContent<AnyView, RootModifier> {
        return ModifiedContent(content: resolveAppRootView(view), modifier: rootModifier)
    }
    
    fileprivate var rootModifier: RootModifier {
        guard let sceneBridge else {
            preconditionFailure("Application configuration error.")
        }
        
        guard let sceneStorageValues else {
            preconditionFailure("State restoration error.")
        }
        
        let presentationDataValue = self.presentationDataValue
        let sceneDelegateBox = self.sceneDelegateBox
        let scenePhase = self.scenePhase
        let sceneItemID = self.sceneItemID
        let connectionOptions = self.connectionOptions
        
        let modifier = RootModifier(
            sceneBridge: sceneBridge,
            sceneDelegateBox: sceneDelegateBox,
            sceneStorageValues: sceneStorageValues,
            presentationDataValue: presentationDataValue,
            scenePhase: scenePhase,
            sceneID: sceneItemID,
            connectionOptions: connectionOptions,
            _rootFocusScope: Namespace()
        )
        
        return modifier
    }
    
    func sceneItem() -> SceneList.Item {
        guard
            let sceneItemID,
            let appGraph = AppGraph.shared,
            let item = appGraph.sceneList(namespace: self.sceneNamespace).item(id: sceneItemID, where: nil)
        else {
            // $s7SwiftUI14AppPreviewHostC9sceneItemAA9SceneListV0G0VyFSSyXEfu_
            preconditionFailure("Missing app graph.")
        }
        
        return item
    }
    
    fileprivate func hashableSceneID() -> String? {
        return sceneItemID?.sessionID
    }
}

extension AppSceneDelegate : UIHostingViewDelegate {
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore::View {
        // nop
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        guard
            let delegate = AppDelegate.shared,
            let mainMenuController = delegate.mainMenuController
        else {
            return
        }
        
        mainMenuController.updateDocumentCommands(environment: &values)
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        // nop
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate: inout ViewGraphBridgeProperties) where Content : MySwiftUICore::View {
        // nop
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore::PreferenceValues) where Content : MySwiftUICore::View {
        // nop
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore::View {
        // nop
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore::_ViewInputs) where Content : MySwiftUICore::View {
        // nop
    }
}

extension AppSceneDelegate : AppGraphObserver {
    func scenesDidChange(phaseChanged: Bool) {
        /*
         self -> x20 -> x21
         phaseChanged -> w0 -> w26
         */
        // <+1028>
        Update.begin()
        // x24
        let sceneItem = self.sceneItem()
        
        if !phaseChanged {
            if self.lastVersion == sceneItem.version {
                Update.end()
                return
            }
        }
        
        // <+1176>
        switch sceneItem.value {
        case .windowGroup(let configuration):
            // <+3136>
            if
                let window = self.window,
                let rootViewController = window.rootViewController,
                let casted = rootViewController as? UIHostingController<ModifiedContent<AnyView, RootModifier>>
            {
                let rootView = self.makeRootView(configuration.mainContent)
                casted.host.rootView = rootView
                casted.host.base.inheritedEnvironment = sceneItem.environment
                
                if
                    let window = self.window,
                    let windowScene = window.windowScene,
                    let _ = windowScene.sizeRestrictions
                {
                    // <+3724>
                    casted.sizingOptions = sceneItem.resizability.sizingOptions
                }
                
                // <+3836>
                if case .disabled = sceneItem.restorationBehavior {
                    // <+3864>
                    if
                        let window = self.window,
                        let windowScene = window.windowScene
                    {
                        // <+3892>
                        var destructionConditions = windowScene._destructionConditions
                        destructionConditions.insert(.systemDisconnection)
                        windowScene._destructionConditions = destructionConditions
                        // <+8248>
                        // <+6272>
                    } else {
                        // <+8200>
                        // <+6272>
                    }
                    
                    // <+6272>
                } else {
                    // <+6468>
                    if
                        let window = self.window,
                        let windowScene = window.windowScene
                    {
                        // <+6496>
                        var destructionConditions = windowScene._destructionConditions
                        destructionConditions.remove(.systemDisconnection)
                        windowScene._destructionConditions = destructionConditions
                        // <+2228>
                        // <+6272>
                    } else {
                        // <+8284>
                        // <+10668>
                        // <+2228>
                        // <+6272>
                    }
                }
                
                // <+6272>
            } else {
                // <+6272>
            }
            
            // <+6272>
            if let window = self.window {
                window.applyAccessibilityProperties(from: sceneItem.accessibilityProperties)
            }
            
            // <+6308>
            self.lastVersion = sceneItem.version
            Update.end()
            return
        case .immersiveSpace(_):
            // <+1424>
            assertUnimplemented()
        case .volume(_):
            // <+4048>
            assertUnimplemented()
        case .documentGroup(_):
            // <+1244>
            assertUnimplemented()
        case .settings(_):
            // <+10816>
            _diagnoseUnexpectedEnumCase(type: SceneList.Item.Value.self)
        case .menuBarExtra(_):
            // <+10816>
            _diagnoseUnexpectedEnumCase(type: SceneList.Item.Value.self)
        case .customScene(_):
            // <+4864>
            assertUnimplemented()
        case .singleWindow(_):
            // <+2244>
            assertUnimplemented()
        case .documentIntroduction(_):
            // <+5092>
            assertUnimplemented()
        case .alertDialog(_):
            // <+10816>
            _diagnoseUnexpectedEnumCase(type: SceneList.Item.Value.self)
        }
        
        assertUnimplemented()
    }
    
    func commandsDidChange() {
        // nop
    }
}

extension AppDelegate {
    func addWindowProxy(for windowScene: UIWindowScene) {
        guard let windowProxy = windowScene.windowProxy else {
            return
        }
        
        self.activeWindowProxies.append(windowProxy)
        self.updateActiveWindows()
    }
    
    fileprivate func updateActiveWindows() {
        // self -> x20 -> x25
        Update.begin()
        
        let proxies = self.activeWindowProxies
        let indices = self.activeWindowProxies.indices
        for index in indices {
            let proxy = proxies[index]
            
            guard !UIApplication.shared.connectedScenes.contains(proxy.backingScene) else {
                continue
            }
            
            let array = self.activeWindowProxies
            if
                let matchingIndex = array.firstIndex(where: { $0.backingScene == proxy.backingScene }),
                matchingIndex != indices.endIndex
            {
                // <+940>
                var x23 = matchingIndex
                var x28 = x23 &+ 1
                
                while x28 != array.count {
                    if array[x28].backingScene == proxy.backingScene {
                        x28 &+= 1
                    } else if x23 == x28 {
                        x23 &+= 1
                        x28 &+= 1
                    } else {
                        self.activeWindowProxies.swapAt(x23, x28)
                        assert(x28 < self.activeWindowProxies.count)
                        x23 &+= 1
                        x28 &+= 1
                    }
                }
                
                self.activeWindowProxies.removeSubrange(x23..<x28)
            } else {
                self.activeWindowProxies.remove(at: index)
            }
        }
        
        // <+1212>
        if let graph = AppGraph.shared {
            let value = graph.$activeWindows.setValue(self.activeWindowProxies)
            if value {
                graph.graphDidChange()
            }
        }
        
        Update.end()
    }
}

func makeStableTypeData(_ type: Any.Type) -> StrongHash {
    assertUnimplemented()
}

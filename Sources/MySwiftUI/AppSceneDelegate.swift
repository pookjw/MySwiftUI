// 4475FD12FD59DEBA453321BD91F6EA04
internal import UIKit
@_spi(Internal) private import MySwiftUICore
private import os.log
private import _UIKitPrivate
private import Observation
private import Combine

/*
 window (Swift.Optional<__C.UIWindow>) (0x10)
 sceneItemID (Swift.Optional<SwiftUI.SceneID>) (0x18)
 sceneNamespace (SwiftUI.SceneList.Namespace) (0x30)
 lastVersion (SwiftUI.DisplayList.Version) (0x48)
 sceneBridge (Swift.Optional<SwiftUI.SceneBridge>) (0x50)
 remoteSceneBridge (Swift.Optional<SwiftUI.RemoteScenes.Bridge>) (0x58)
 scenePhase (SwiftUI.ScenePhase) (0x60)
 sceneDelegateBox (Swift.Optional<SwiftUI.AnyFallbackDelegateBox>) (0x68)
 sceneStorageValues (Swift.Optional<SwiftUI.SceneStorageValues>) (0x70)
 presentationDataType (Swift.Optional<Any.Type>) (0x78)
 rawPresentationDataValue (Swift.Optional<Foundation.Data>) (0x80)
 presentationDataValue (Swift.Optional<Swift.AnyHashable>) (0x90)
 connectionOptions (Swift.Optional<__C.UISceneConnectionOptions>) (0xb8)
 */

final class AppSceneDelegate: NSObject, UIWindowSceneDelegate {
    var window: UIWindow? = nil
    private var sceneItemID: SceneID? = nil
    private var sceneNamespace: SceneList.Namespace = .app
    private var lastVersion = DisplayList.Version()
    private var sceneBridge: SceneBridge? = nil
    private var remoteSceneBridge: RemoteScenes.Bridge? = nil
    private var scenePhase: ScenePhase = .background
    private var sceneDelegateBox: AnyFallbackDelegateBox? = nil
    private var sceneStorageValues: SceneStorageValues? = nil
    private var presentationDataType: Any.Type? = nil
    private var rawPresentationDataValue: Data? = nil
    private var presentationDataValue: AnyHashable? = nil
    private var connectionOptions: UIScene.ConnectionOptions? = nil
    
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
            if let delegateClass = session.configuration.delegateClass as? UIHostingSceneDelegate.Type {
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
            graph.setEnvironment(ViewGraphHost.defaultEnvironment)
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
            if let delegateClass = session.configuration as? UIHostingSceneDelegate.Type {
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
                    sceneDelegate is UIHostingSceneDelegate,
                    let casted = delegateClass as? UIHostingSceneDelegate.Type
                {
                    // <+5584>
                    BridgedSceneCoordinator.shared.register(casted)
                    // <+5660>
                }
                
                // <+5660>
                if let casted = delegateClass as? Observable.Type {
                    func project<T: Observable>(key: T.Type) {
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
        
        assertUnimplemented()
        Update.end()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        assertUnimplemented()
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        assertUnimplemented()
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
        let sceneList = appGraph.sceneList(namespace: self.sceneNamespace)
        // x25
        let sceneListItem = self.findSceneListItem(
            restorationSceneItemID: restorationSceneItemID,
            restorationData: restorationData,
            connectionOptions: connectionOptions,
            urlContexts: &urlContexts,
            role: role
        )
        
        if let scenes = Log.scenes {
            assertUnimplemented()
        }
        assertUnimplemented()
    }
    
    fileprivate func findSceneListItem(
        restorationSceneItemID: SceneID?,
        restorationData: [AnyHashable: Any],
        connectionOptions: UIScene.ConnectionOptions,
        urlContexts: inout Set<UIOpenURLContext>,
        role: UISceneSession.Role
    ) -> SceneList.Item {
        /*
         restorationSceneItemID -> x0/x1/w2 -> x19 + 0x158 / x19 + 0x120 / x19 + 0x118
         connectionOptions -> x4 -> x19 + 0xd8
         urlContexts -> x5 -> x19 + 0x60
         role -> x6 -> x19 + 0x130
         */
        assertUnimplemented()
    }
}

extension AppSceneDelegate: UIHostingViewDelegate {
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate: inout ViewGraphBridgeProperties) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore.PreferenceValues) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
    
    func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore._ViewInputs) where Content : MySwiftUICore.View {
        assertUnimplemented()
    }
}

extension AppSceneDelegate: AppGraphObserver {
    
}

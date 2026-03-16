internal import UIKit
private import _UIKitPrivate
@_spi(Internal) private import MySwiftUICore
private import FrontBoardServices
private import MRUIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    static private(set) var shared: AppDelegate? {
        willSet {
            precondition(AppDelegate.shared == nil, "AppDelegate.shared may only be set once!")
        }
    }
    
    private(set) var fallbackDelegate: UIApplicationDelegate? = nil
    private(set) var mainMenuController: UIKitMainMenuController? = nil
    private(set) lazy var immersiveSpaceAuthority: ImmersiveSpaceAuthority = {
        assertUnimplemented()
    }()
    private var activeWindowProxies: [WindowProxy] = []
    
    override init() {
        // self -> x20
        super.init()
        AppDelegate.shared = self
        
        // <+280>
        self.fallbackDelegate = AppGraph.delegateBox?.delegate as? UIApplicationDelegate
        
        // <+276>
        SceneNavigationStrategy_Phone.shared.sceneNavigationEnabled = true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        /*
         application -> x0 -> x19
         launchOptions -> x1 -> x22
         */
        UIMainMenuSystem.shared._setOverrideBuild(._compatibility, overrideBuildHandler: nil)
        
        guard
            let fallbackDelegate,
            fallbackDelegate.responds(to: #selector(application(_:didFinishLaunchingWithOptions:)))
        else {
            return true
        }
        
        guard let launchOptions else {
            return false
        }
        
        return (fallbackDelegate as AnyObject).application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        /*
         connectingSceneSession -> x0 -> x19
         options -> x1 -> x25
         */
        // <+148>
        // 밑에 정의 안 된 Role에서 사용함
        // x21
        let items: [SceneList.Item]? = Update.ensure { 
            // $s7SwiftUI11AppDelegateC11application_26configurationForConnecting7optionsSo20UISceneConfigurationCSo13UIApplicationC_So0J7SessionCSo0J17ConnectionOptionsCtFSayAA9SceneListV4ItemVGSgyXEfU_
            guard let appGraph = AppGraph.shared else {
                return nil
            }
            
            let sceneList = appGraph.sceneList(namespace: .app)
            return sceneList.items
        }
        
        // x25
        let isSwiftUIStageManaged: Bool
        if let specification = options._specification as? MRUIStageSceneSpecification {
            isSwiftUIStageManaged = specification.isSwiftUIStageManaged
        } else {
            isSwiftUIStageManaged = false
        }
        
        switch connectingSceneSession.role {
        case
                .windowApplication,
                .windowAssistiveAccessApplication,
                ._UIWindowSceneSessionRoleVolumetricApplication,
                .windowApplicationVolumetric
            :
            // <+440>
            let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
            configuration.delegateClass = AppSceneDelegate.self
            return configuration
        case .carplay:
            assertUnimplemented()
        case .windowExternalDisplayNonInteractive:
            assertUnimplemented()
        default:
            assertUnimplemented()
        }
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        if let fallbackDelegate {
            return fallbackDelegate.responds(to: aSelector)
        } else {
            return type(of: self).instancesRespond(to: aSelector)
        }
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        assertUnimplemented()
    }
    
    override func buildMenu(with builder: any UIMenuBuilder) {
        /*
         self -> x20 -> x21
         builder -> x0 -> x19
         */
        Update.begin()
        // x25
        let system = builder.system
        // x26
        let main = UIMenuSystem.main
        
        guard system == main else {
            Update.end()
            return
        }
        
        // <+208>
        if
            let graph = AppGraph.shared,
            ViewGraphHost.isDefaultEnvironmentConfigured
        {
            graph.setEnvironment(ViewGraphHost.defaultEnvironment)
        }
        
        // <+336>
        if self.mainMenuController == nil {
            self.mainMenuController = UIKitMainMenuController()
        }
        
//        self.mainMenuController!.buildMenu(with: builder)
//        (self.fallbackDelegate as? UIResponder)?.buildMenu(with: builder)
        
        Update.end()
    }
    
    override func validate(_ command: UICommand) {
        assertUnimplemented()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        assertUnimplemented()
    }
    
    @objc(_performMainMenuShortcutKeyCommand:)
    func _performMainMenuShortcutKeyCommand(_ command: UIKeyCommand) {
        assertUnimplemented()
    }
    
    @objc(application:runTest:options:)
    func application(_ application: UIApplication, runTest test: String, options: [String: Any]?) -> Bool {
        assertUnimplemented()
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        assertUnimplemented()
    }
}

extension UISceneSession.Role {
    static let carplay = _UIWindowSceneSessionRoleCarPlay
}

internal import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    static private(set) var shared: AppDelegate? {
        willSet {
            precondition(AppDelegate.shared == nil, "AppDelegate.shared may only be set once!")
        }
    }
    
    private var fallbackDelegate: UIApplicationDelegate? = nil
    private(set) var mainMenuController: UIKitMainMenuController? = nil
    private(set) lazy var immersiveSpaceAuthority: ImmersiveSpaceAuthority = {
        fatalError("TODO")
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
        fatalError("TODO")
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        fatalError("TODO")
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        if let fallbackDelegate {
            return fallbackDelegate.responds(to: aSelector)
        } else {
            return type(of: self).instancesRespond(to: aSelector)
        }
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        fatalError("TODO")
    }
    
    override func buildMenu(with builder: any UIMenuBuilder) {
        fatalError("TODO")
    }
    
    override func validate(_ command: UICommand) {
        fatalError("TODO")
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        fatalError("TODO")
    }
    
    @objc(_performMainMenuShortcutKeyCommand:)
    func _performMainMenuShortcutKeyCommand(_ command: UIKeyCommand) {
        fatalError("TODO")
    }
    
    @objc(application:runTest:options:)
    func application(_ application: UIApplication, runTest test: String, options: [String: Any]?) -> Bool {
        fatalError("TODO")
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        fatalError("TODO")
    }
}

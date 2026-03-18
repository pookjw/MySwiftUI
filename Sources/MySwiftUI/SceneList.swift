// BEF4E4901B38F706548A7CBA9C5C4F4B
private import MySwiftUICore
private import CoreGraphics
internal import UIKit
private import _UIKitPrivate

struct SceneList {
    private(set) var items: [SceneList.Item] = []
    var environment = EnvironmentValues()
    
    func itemForConnectionOptions(_ options: UIScene.ConnectionOptions) -> SceneList.Item? {
        /*
         self -> x20 -> x21
         options -> x0 -> x23
         return pointer -> x8 -> x19
         */
        if 
            let payload = options[OpenSceneConnectionOptionDefinition.self],
            let item = self.item(id: payload.sceneID, where: nil)
        {
            return item
        }
        
        // <+328>
        if let userActivity = options.userActivities.first {
            return self.itemForUserActivity(userActivity)
        }
            
        return nil
    }
    
    func item(id: SceneID, where: ((SceneList.Item) -> Bool)?) -> SceneList.Item? {
        assertUnimplemented()
    }
    
    fileprivate func itemForUserActivity(_ userActivity: NSUserActivity) -> SceneList.Item? {
        assertUnimplemented()
    }
}

extension SceneList {
    struct Item: Identifiable {
        private(set) var value: SceneList.Item.Value // 0x0
        private(set) var id: SceneID // 0xe0
        private(set) var version: DisplayList.Version // 0xf8
        private(set) var environment: EnvironmentValues // 0x100
        private(set) var options: SceneList.Item.Options // 0x110
        private(set) var accessibilityProperties: AccessibilityProperties? // 0x118
        private(set) var activationConditions: Set<String>? // 0x238
        private(set) var resizability: WindowResizability.Role // 0x240
        private(set) var defaultPosition: UnitPoint? // 0x248
        private(set) var defaultSize: CGSize? // 0x260
        private(set) var restorationBehavior: SceneRestorationBehavior.Role // 0x271
        private(set) var windowManagerRole: WindowManagerRole // 0x272
        private(set) var connectionOptionPayloadStorage: ConnectionOptionPayloadStorage // 0x278
        private(set) var defaultLaunchBehavior: SceneLaunchBehavior.Role // 0x288
        private(set) var windowLayoutProvider: WindowLayoutProvider? // 0x290
        private(set) var defaultPlacementProvider: DefaultPlacementWindowLayoutProvider? // 0x2a0
        private(set) var idealPlacementLayout: IdealWindowPlacementLayout? // 0x2b8
        private(set) var windowToolbarLabelStyle: ToolbarLabelStyle.Data // 0x2d0
        private(set) var isInternal: Bool // 0x2e1
        private(set) var depth: CGFloat? // 0x2e8
        private(set) var sizingUnit: LengthUnit // 0x2f8
        private(set) var defaultScalingBehavior: WorldScalingBehavior // 0x300
        private(set) var worldAlignmentBehavior: WorldAlignmentBehavior.Storage // 0x301
        
        var sceneSessionRole: UISceneSession.Role? {
            assertUnimplemented()
        }
        
        var kind: SceneList.Item.Kind {
            assertUnimplemented()
        }
        
        var sceneTypeDescription: String {
            assertUnimplemented()
        }
        
        var identifyingDescription: String {
            assertUnimplemented()
        }
        
        var presentationDataTyp: Any.Type? {
            assertUnimplemented()
        }
    }
    
    enum Namespace: Hashable, CustomStringConvertible {
        case string(String)
        case host(ObjectIdentifier)
        case app
        
        var description: String {
            assertUnimplemented()
        }
    }
    
    struct Key: PreferenceKey {
        @safe static nonisolated(unsafe) let defaultValue: [SceneList.Namespace: SceneList] = [:]
        
        static func reduce(value: inout [SceneList.Namespace: SceneList], nextValue: () -> [SceneList.Namespace: SceneList]) {
            assertUnimplemented()
        }
    }
}

extension SceneList.Item {
    struct Summary/*: Identifiable*/ {
        // TODO
    }
    
    enum Value {
        case windowGroup(WindowSceneConfiguration<WindowGroupConfigurationAttributes>)
        case immersiveSpace(WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>)
        case volume(WindowSceneConfiguration<VolumeConfigurationAttributes>)
        case documentGroup(IdentifiedDocumentGroupConfiguration)
        case settings(AnyView)
        case menuBarExtra(MenuBarExtraConfiguration)
        case customScene(UISceneAdaptorConfiguration)
        case singleWindow(WindowSceneConfiguration<SingleWindowConfigurationAttributes>)
        case documentIntroduction(DocumentIntroductionConfiguration)
        case alertDialog(DialogConfiguration)
    }
    
    struct Options: OptionSet {
        let rawValue: UInt8
    }
    
    enum Kind {
        // TODO
    }
}

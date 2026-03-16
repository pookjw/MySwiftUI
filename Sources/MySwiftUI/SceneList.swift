private import MySwiftUICore
private import CoreGraphics
internal import UIKit

struct SceneList {
    private(set) var items: [SceneList.Item] = []
    private(set) var environment = EnvironmentValues()
    
    func itemForConnectionOptions(_ options: UIScene.ConnectionOptions) -> SceneList.Item? {
        assertUnimplemented()
    }
}

extension SceneList {
    struct Item {
        private var value: SceneList.Item.Value // 0x0
        private var id: SceneID // 0xe0
        private var version: DisplayList.Version // 0xf8
        private var environment: EnvironmentValues // 0x100
        private var options: SceneList.Item.Options // 0x110
        private var accessibilityProperties: AccessibilityProperties? // 0x118
        private var activationConditions: Set<String>? // 0x238
        private var resizability: WindowResizability.Role // 0x240
        private var defaultPosition: UnitPoint? // 0x248
        private var defaultSize: CGSize? // 0x260
        private var restorationBehavior: SceneRestorationBehavior.Role // 0x271
        private var windowManagerRole: WindowManagerRole // 0x272
        private var connectionOptionPayloadStorage: ConnectionOptionPayloadStorage // 0x278
        private var defaultLaunchBehavior: SceneLaunchBehavior.Role // 0x288
        private var windowLayoutProvider: WindowLayoutProvider? // 0x290
        private var defaultPlacementProvider: DefaultPlacementWindowLayoutProvider? // 0x2a0
        private var idealPlacementLayout: IdealWindowPlacementLayout? // 0x2b8
        private var windowToolbarLabelStyle: ToolbarLabelStyle.Data // 0x2d0
        private var isInternal: Bool // 0x2e1
        private var depth: CGFloat? // 0x2e8
        private var sizingUnit: LengthUnit // 0x2f8
        private var defaultScalingBehavior: WorldScalingBehavior // 0x300
        private var worldAlignmentBehavior: WorldAlignmentBehavior.Storage // 0x301
        
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
    
    struct Options {
        let rawValue: UInt8
    }
    
    enum Kind {
        // TODO
    }
}

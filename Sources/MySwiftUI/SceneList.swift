// BEF4E4901B38F706548A7CBA9C5C4F4B
private import MySwiftUICore
private import CoreGraphics
internal import UIKit
private import _UIKitPrivate
private import _SwiftPrivate

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
        
        @inlinable var sceneSessionRole: UISceneSession.Role? {
            switch self.value {
            case .windowGroup(_):
                // <+116>
                return .windowApplication
            case .immersiveSpace(let configuration):
                // <+188>
                return configuration.attributes.sceneSessionRole
            case .volume(_):
                // <+72>
                return .windowApplicationVolumetric
            case .documentGroup(_):
                // <+116>
                return .windowApplication
            case .settings(_):
                // <+172>
                return nil
            case .menuBarExtra(_):
                // <+172>
                return nil
            case .customScene(let configuration):
                // <+308>
                switch configuration.kind {
                case .custom(let role):
                    return UISceneSession.Role(rawValue: role)
                case .carPlay:
                    return ._UIWindowSceneSessionRoleCarPlay
                case .assistiveAccess:
                    return .windowAssistiveAccessApplication
                case .externalDisplay:
                    return .windowExternalDisplayNonInteractive
                }
            case .singleWindow(_):
                // <+116>
                return .windowApplication
            case .documentIntroduction(let configuration):
                // <+172>
                return nil
            case .alertDialog(let configuration):
                // <+172>
                return nil
            }
        }
        
        var kind: SceneList.Item.Kind {
            switch value {
            case .windowGroup(_):
                return .windowGroup
            case .immersiveSpace(_):
                return .immersiveSpace
            case .volume(_):
                return .volume
            case .documentGroup(_):
                return .documentGroup
            case .settings(_):
                return .settings
            case .menuBarExtra(_):
#if os(macOS)
                return .menuBarExtra
#else
                _diagnoseUnexpectedEnumCase(type: SceneList.Item.Value.self)
#endif
            case .customScene(let configuration):
                switch configuration.kind {
                case .custom(_):
                    return .custom
                case .carPlay:
                    return .carPlay
                case .assistiveAccess:
                    return .assistiveAccess
                case .externalDisplay:
                    return .externalDisplay
                }
            case .singleWindow(_):
                return .singleWindow
            case .documentIntroduction(_):
                return .documentIntroduction
            case .alertDialog(_):
                return .alertDialog
            }
        }
        
        var sceneTypeDescription: String {
            switch value {
            case .windowGroup(_):
                return "WindowGroup"
            case .immersiveSpace(_):
                return "ImmersiveSpace"
            case .volume(_):
                return "with VolumetricWindowStyle"
            case .documentGroup(_):
                return "DocumentGroup"
            case .settings(_):
                return "Settings"
            case .menuBarExtra(_):
                return "MenuBarExtra"
            case .customScene(let configuration):
                switch configuration.kind {
                case .custom(_):
                    return "Custom"
                case .carPlay:
                    return "CarPlay"
                case .assistiveAccess:
                    return "AssistiveAccess"
                case .externalDisplay:
                    return "ExternalDisplay"
                }
            case .singleWindow(_):
                return "Window"
            case .documentIntroduction(_):
                return "DocumentIntroduction"
            case .alertDialog(_):
                return "AlertDialog"
            }
        }
        
        var identifyingDescription: String {
            if let presentationDataType = presentationDataType {
                return "type: \(_typeName(presentationDataType, qualified: true)), id: \(id)"
            } else {
                return "id: \(id)"
            }
        }
        
        var presentationDataType: Any.Type? {
            switch value {
            case .windowGroup(let configuration):
                return configuration.presentationDataType
            case .immersiveSpace(let configuration):
                return configuration.presentationDataType
            case .volume(let configuration):
                return configuration.presentationDataType
            case .documentGroup(_):
                return nil
            case .settings(_):
                return nil
            case .menuBarExtra(_):
                return nil
            case .customScene(_):
                return nil
            case .singleWindow(_):
                return nil
            case .documentIntroduction(_):
                return nil
            case .alertDialog(_):
                return nil
            }
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
        static var unknown1: SceneList.Item.Options {
            return SceneList.Item.Options(rawValue: 1 << 1)
        }
        
        let rawValue: UInt8
    }
    
    enum Kind: Hashable {
        case windowGroup
        case singleWindow
        case custom
        case documentGroup
        case documentIntroduction
        case settings
        case immersiveSpace
        case carPlay
        case assistiveAccess
        case externalDisplay
#if os(macOS)
        case menuBarExtra
#endif
#if os(visionOS)
        case volume
#endif
        case alertDialog
    }
}

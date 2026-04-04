internal import MySwiftUICore
internal import Foundation
internal import UIKit
internal import MRUIKit

struct WindowSceneConfiguration<T : WindowSceneConfigurationAttributes> {
    var attributes: T
    private(set) var mainContent: AnyView
    private(set) var title: Text?
    private(set) var presentationDataType: Any.Type?
    private(set) var decoder: ((Data) -> AnyHashable?)?
    
    func sceneListValue() -> SceneList.Item.Value {
        return attributes.sceneListValue(self)
    }
}

struct WindowGroupConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<WindowGroupConfigurationAttributes>) -> SceneList.Item.Value {
        return .windowGroup(configuration)
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    private(set) var suppressGlassBackground: Bool
}

struct ImmersiveSpaceConfigurationAttributes : WindowSceneConfigurationAttributes {
    private(set) var sceneSessionRole: UISceneSession.Role // 0x0
    private(set) var sceneWindowType: UIWindow.Type // 0x8
    private(set) var activationBehavior: ImmersiveSpaceActivationBehavior.Storage // 0x10
    private(set) var supportedImmersionStyles: [any ImmersionStyle]? // 0x18
    private(set) var allowedImmersionStyles: [any ImmersionStyle]? // 0x20
    var preferredUpperLimbVisibility: UpperLimbVisibility? // 0x28
    var immersionStyleSelection: Binding<any ImmersionStyle>? // 0x30
    var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition? // 0x68
    var immersiveContentBrightness: ImmersiveContentBrightness? // 0x78
    var immersiveEnvironmentBehavior: ImmersiveEnvironmentBehavior.Storage // 0x82
    private(set) var orderOutSceneSessionIdentifiersProvider: () -> Set<String> // 0x88
    
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    func customizeSceneActivationRequestOptions(_ options: _MRUIImmersiveSpaceSceneActivationRequestOptions, isInternalScene: Bool) {
        assertUnimplemented()
    }
    
    // TODO
}

extension ImmersiveSpaceConfigurationAttributes {
    struct ClientOptions {
        private(set) var selectedStyle: ImmersionStyle
        private var allowedStyles: [ImmersionStyle]
        private var minimumAmount: Double?
        private var maximumAmount: Double?
        private var initialAmount: Double?
        private var aspectRatio: ProgressiveImmersionAspectRatio?
        private var contentBrightness: CGFloat?
        private var environmentBehavior: ImmersiveEnvironmentBehavior.Storage
        private var backgroundedSceneSessionPersistentIdentifiers: Set<String>?
        private var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition?
        // TODO
    }
}

struct VolumeConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = ViewInputFlagModifier<IsInVolumetricContext> // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<VolumeConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: ViewInputFlagModifier<IsInVolumetricContext> {
        return ViewInputFlagModifier(flag: IsInVolumetricContext())
    }
}

struct IdentifiedDocumentGroupConfiguration {
    // TODO
}

struct MenuBarExtraConfiguration {
    // TODO
}

struct UISceneAdaptorConfiguration {
    let id: SceneID
    let kind: UISceneAdaptorConfiguration.Kind
    let content: AnyView
    // TODO
}

extension UISceneAdaptorConfiguration {
    enum Kind : Equatable {
        case custom(String)
        case carPlay
        case assistiveAccess
        case externalDisplay
    }
}

struct SingleWindowConfigurationAttributes : WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<SingleWindowConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    // TODO
}

struct DocumentIntroductionConfiguration {
    // TODO
}

struct DialogConfiguration {
    // TODO
}

protocol WindowSceneConfigurationAttributes {
    associatedtype RootModifier
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<Self>) -> SceneList.Item.Value
    var rootModifier: Self.RootModifier { get }
}

struct IsInVolumetricContext: ViewInputBoolFlag {
    
}

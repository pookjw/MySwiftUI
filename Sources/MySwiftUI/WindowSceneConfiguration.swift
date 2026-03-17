internal import MySwiftUICore
internal import Foundation

struct WindowSceneConfiguration<T: WindowSceneConfigurationAttributes> {
    private(set) var attributes: T
    private(set) var mainContent: AnyView
    private(set) var title: Text?
    private(set) var presentationDataType: Any.Type?
    private(set) var decoder: ((Data) -> AnyHashable?)?
    
    func sceneListValue() -> SceneList.Item.Value {
        assertUnimplemented()
    }
}

struct WindowGroupConfigurationAttributes: WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<WindowGroupConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    private(set) var suppressGlassBackground: Bool
}

struct ImmersiveSpaceConfigurationAttributes: WindowSceneConfigurationAttributes {
    //    private var sceneSessionRole: UISceneSession.Role
    //    private var sceneWindowType: UIWindow.Type
    //    private var activationBehavior: ImmersiveSpaceActivationBehavior.Storage
    //    private var supportedImmersionStyles: [any ImmersionStyle]?
    //    private var allowedImmersionStyles: [any ImmersionStyle]?
    //    private var preferredUpperLimbVisibility: UpperLimbVisibility?
    //    private var immersionStyleSelection: Binding<any ImmersionStyle>?
    //    private var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition?
    //    private var immersiveContentBrightness: ImmersiveContentBrightness?
    //    private var immersiveEnvironmentBehavior: ImmersiveEnvironmentBehavior.Storage
    //    private var orderOutSceneSessionIdentifiersProvider: () -> Set<String>
    
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    // TODO
}

extension ImmersiveSpaceConfigurationAttributes {
    struct ClientOptions {
        private var selectedStyle: ImmersionStyle
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

struct VolumeConfigurationAttributes: WindowSceneConfigurationAttributes {
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<VolumeConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    // TODO
}

struct IdentifiedDocumentGroupConfiguration {
    // TODO
}

struct MenuBarExtraConfiguration {
    // TODO
}

struct UISceneAdaptorConfiguration {
    // TODO
}

struct SingleWindowConfigurationAttributes: WindowSceneConfigurationAttributes {
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

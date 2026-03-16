internal import MySwiftUICore
internal import Foundation

struct WindowSceneConfiguration<T: WindowSceneConfigurationAttributes> {
    private(set) var attributes: T
    private(set) var mainContent: AnyView
    private(set) var title: Text?
    private(set) var presentationDataType: Any.Type?
    private(set) var decoder: ((Data) -> AnyHashable?)?
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
    typealias RootModifier = Never // TODO
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>) -> SceneList.Item.Value {
        assertUnimplemented()
    }
    
    var rootModifier: Never {
        assertUnimplemented()
    }
    
    // TODO
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

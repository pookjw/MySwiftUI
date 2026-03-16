private import MySwiftUICore
private import Foundation

struct WindowSceneConfiguration<T> {
    private var attributes: T
    private var mainContent: AnyView
    private var title: Text?
    private var presentationDataType: Any.Type?
    private var decoder: ((Data) -> AnyHashable?)?
}

struct WindowGroupConfigurationAttributes {
    private var suppressGlassBackground: Bool
}

struct ImmersiveSpaceConfigurationAttributes {
    // TODO
}

struct VolumeConfigurationAttributes {
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

struct SingleWindowConfigurationAttributes {
    // TODO
}

struct DocumentIntroductionConfiguration {
    // TODO
}

struct DialogConfiguration {
    // TODO
}

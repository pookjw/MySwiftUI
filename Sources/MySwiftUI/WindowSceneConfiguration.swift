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
    private(set) var activationBehavior: ImmersiveSpaceActivationBehavior.Storage = .automatic // 0x10
    private(set) var supportedImmersionStyles: [any ImmersionStyle]? = nil // 0x18
    private(set) var allowedImmersionStyles: [any ImmersionStyle]? = nil // 0x20
    var preferredUpperLimbVisibility: UpperLimbVisibility? = nil // 0x28
    var immersionStyleSelection: Binding<any ImmersionStyle>? = nil // 0x30
    var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition? = nil // 0x68
    var immersiveContentBrightness: ImmersiveContentBrightness? = nil // 0x78
    var immersiveEnvironmentBehavior: ImmersiveEnvironmentBehavior.Storage = .automatic // 0x82
    private(set) var orderOutSceneSessionIdentifiersProvider: () -> Set<String> = {
        // $s7SwiftUI37ImmersiveSpaceConfigurationAttributesV39orderOutSceneSessionIdentifiersProviderShySSGycvpfiAEycfU_
        return []
    } // 0x88
    
    typealias RootModifier = Never // TODO
    
    init<Data, Content>(
        from content: PresentedContent<Data, PresentedImmersiveSpaceContent<Content>>
    ) where Data : Decodable, Data : Encodable, Data : Hashable, Content : ImmersiveSpaceContent {
        // <+180>
        let supportedImmersionStyles: [ImmersionStyle]
        let role: UISceneSession.Role
        let windowType: UIWindow.Type
        
        if Content._determineHasCompositorContent() {
            // <+200>
            // x25 -> x29 - 0xb0
            let immersiveSpaceContent = content.immersiveSpaceContent()
            // x29 - 0x80 -> x29 - 0xa8
            let compositorContent = immersiveSpaceContent._determinePrimitiveCompositorContent()
            supportedImmersionStyles = compositorContent!._makeSupportedImmersionStyles()
            role = compositorContent!._makeSceneSessionRole()
            windowType = compositorContent!._makeSceneWindowType()
            // <+760>
        } else {
            // <+616>
            supportedImmersionStyles = Content._determineSupportedImmersionStyles()
            role = Content._determineSceneSessionRole()
            windowType = Content._determineSceneWindowType()
            // <+760>
        }
        
        // <+760>
        self.sceneSessionRole = role
        self.sceneWindowType = windowType
        self.activationBehavior = .automatic
        self.supportedImmersionStyles = supportedImmersionStyles
        self.allowedImmersionStyles = nil
        self.preferredUpperLimbVisibility = nil
        self.immersionStyleSelection = nil
        self.sceneUpdateTransitionAnimation = nil
        self.immersiveContentBrightness = nil
        self.immersiveEnvironmentBehavior = .automatic
        self.orderOutSceneSessionIdentifiersProvider = {
            // $s7SwiftUI37ImmersiveSpaceConfigurationAttributesV39orderOutSceneSessionIdentifiersProviderShySSGycvpfiAEycfU_
            return []
        }
    }
    
    func sceneListValue(_ configuration: WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes>) -> SceneList.Item.Value {
        return .immersiveSpace(configuration)
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
        return .volume(configuration)
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

extension ImmersiveSpaceContent {
    @_transparent // 원래 없음
    private static var resolvedRrimitiveImmersiveSpaceContentType: any PrimitiveImmersiveSpaceContent.Type {
        let casted: any PrimitiveImmersiveSpaceContent.Type
        if let _casted = self as? PrimitiveImmersiveSpaceContent.Type {
            casted = _casted
        } else {
            var body: (any ImmersiveSpaceContent.Type) = self.Body
            while true {
                if let _casted = body as? PrimitiveImmersiveSpaceContent.Type {
                    casted = _casted
                    break
                } else {
                    func project<T: ImmersiveSpaceContent>(_ type: T.Type) -> T.Body.Type {
                        return type.Body
                    }
                    body = project(body)
                }
            }
        }
        
        return casted
    }
    
    nonisolated static func _determineHasCompositorContent() -> Bool {
        return resolvedRrimitiveImmersiveSpaceContentType._hasCompositorContent()
    }
    
    nonisolated func _determinePrimitiveCompositorContent() -> PrimitiveCompositorContent? {
        assertUnimplemented()
    }
    
    nonisolated static func _determineSupportedImmersionStyles() -> [ImmersionStyle] {
        let styles = resolvedRrimitiveImmersiveSpaceContentType._makeSupportedImmersionStyles()
        precondition(
            !styles.isEmpty, // $s7SwiftUI21ImmersiveSpaceContentPAAE34_determineSupportedImmersionStylesSayAA0H5Style_pGyFZSbyXEfu_TA
            "Content should define at least one supported immersion style."
        )
        return styles
    }
    
    nonisolated static func _determineSceneSessionRole() -> UISceneSession.Role {
        return resolvedRrimitiveImmersiveSpaceContentType._makeSceneSessionRole()
    }
    
    nonisolated static func _determineSceneWindowType() -> UIWindow.Type {
        return resolvedRrimitiveImmersiveSpaceContentType._makeSceneWindowType()
    }
    
    func _determineView() -> AnyView {
        assertUnimplemented()
    }
}

@_spi(Internal) public import MyRealityFoundation
internal import CoreRE
private import RealityKit
private import MySwiftUI

@objc final class __RealityKitOverlayRegistry : ExternalBuiltInComponentRegistry {
    override class func registerBuiltInComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, ComponentInfo.Access, ComponentInfo.Availability) -> Void) {
        ARKitAnchorComponent.registerBuiltinComponent(block)
        __RealityKitOverlayRegistry.registerVisionOSComponents(block)
    }
    
    static func registerVisionOSComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, ComponentInfo.Access, ComponentInfo.Availability) -> Void) {
        let availability = ComponentInfo.Availability(
            introduced: [
                .macOS("16.0"),
                .macCatalyst("19.0"),
                .iOS("19.0"),
                .visionOS("3.0")
            ],
            deprecated: nil,
            obsoleted: nil
        )
        
        block(
            ViewAttachmentComponent.self,
            .viewAttachmentComponent,
            .viewAttachment,
            .api,
            availability
        )
        
        // <+652>
        registerExternalAttachment(
            type: ViewAttachmentComponent.self,
            getGuts: { _ in
                // $s19_RealityKit_SwiftUI02__aB15OverlayRegistryC26registerVisionOSComponentsyyy0aB09Component_pXp_So19REComponentClassPtraSgSo0K4TypeVSg0A10Foundation0J4InfoV6AccessOAO12AvailabilityVtXEFZ0cD0010AttachmentJ4GutsVSgAA04ViewsJ0VcfU_
                assertUnimplemented()
            },
            setGuts: { _, _ in
                // $s19_RealityKit_SwiftUI02__aB15OverlayRegistryC26registerVisionOSComponentsyyy0aB09Component_pXp_So19REComponentClassPtraSgSo0K4TypeVSg0A10Foundation0J4InfoV6AccessOAO12AvailabilityVtXEFZyAA014ViewAttachmentJ0Vz_0cD00tJ4GutsVtcfU0_
                assertUnimplemented()
            }
        )
        
        // <+692>
        block(
            PresentationComponent.self,
            .presentation,
            .presentation,
            .api,
            availability
        )
        
        registerExternalAttachment(type: PresentationComponent.self) { _ in
            // $s19_RealityKit_SwiftUI02__aB15OverlayRegistryC26registerVisionOSComponentsyyy0aB09Component_pXp_So19REComponentClassPtraSgSo0K4TypeVSg0A10Foundation0J4InfoV6AccessOAO12AvailabilityVtXEFZ0cD0010AttachmentJ4GutsVSgAA012PresentationJ0VcfU1_
            assertUnimplemented()
        }
    }
}

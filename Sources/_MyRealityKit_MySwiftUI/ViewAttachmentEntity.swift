// 436498BB17FB40A0D20BA30EEAA3D434
internal import Spatial
internal import MyRealityFoundation

@_hasMissingDesignatedInitializers @available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public class ViewAttachmentEntity : Entity {
    private var host: any SizeReadableEntity
    
    @MainActor @preconcurrency public var attachment: ViewAttachmentComponent {
        get {
            assertUnimplemented()
        }
        @available(visionOS 26.0, *)
        @available(iOS, unavailable)
        @available(macOS, unavailable)
        @available(watchOS, unavailable)
        @available(tvOS, unavailable)
        set {
            assertUnimplemented()
        }
    }
    
    required init() {
        assertUnimplemented()
    }
}

extension ViewAttachmentEntity : CustomClonable {
    package nonisolated func customClone(recursive: Bool) -> Self {
        assertUnimplemented()
    }
}

extension ViewAttachmentEntity {
    fileprivate enum AttachmentI {
        case missingAttachment
    }
}

protocol SizeReadableEntity : AnyObject {
    var contentSize: Size3D { get }
}

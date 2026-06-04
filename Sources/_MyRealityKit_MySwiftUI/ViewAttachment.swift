public import MyRealityFoundation
public import MySwiftUI

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct ViewAttachmentComponent : TransientComponent, Identifiable {
  public var id: AnyHashable {
    assertUnimplemented()
  }
    
  public var bounds: BoundingBox {
      assertUnimplemented()
  }
    
  @available(visionOS 26.0, *)
  @available(iOS, unavailable)
  @available(macOS, unavailable)
  @available(watchOS, unavailable)
  @available(tvOS, unavailable)
    public init<Content>(rootView: Content) where Content : View {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ViewAttachmentComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> ViewAttachmentComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
  public static var __coreComponentType: __ComponentTypeRef {
      assertUnimplemented()
  }
}

@_hasMissingDesignatedInitializers
@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency public class ViewAttachmentEntity : Entity {
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
}

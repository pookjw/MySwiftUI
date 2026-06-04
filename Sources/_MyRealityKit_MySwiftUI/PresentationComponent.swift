public import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct PresentationComponent : TransientComponent {
    public var isPresented: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PresentationComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> PresentationComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(*, unavailable)
extension PresentationComponent : Sendable {
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PresentationComponent {
    nonisolated public init<Content>(isPresented: Binding<Bool>, configuration: PresentationComponent.Configuration, content: Content) where Content : View {
        assertUnimplemented()
    }
    
    nonisolated public init<Content>(configuration: PresentationComponent.Configuration, content: Content) where Content : View {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PresentationComponent {
    public struct Configuration : Sendable {
        public static func popover(arrowEdge: Edge?) -> PresentationComponent.Configuration {
            assertUnimplemented()
        }
    }
}

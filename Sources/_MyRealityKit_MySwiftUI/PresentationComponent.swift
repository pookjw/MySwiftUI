public import MySwiftUICore
@_spi(Internal) internal import MyRealityFoundation

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

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
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

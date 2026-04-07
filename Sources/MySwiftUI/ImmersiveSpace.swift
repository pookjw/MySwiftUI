public import MySwiftUICore
public import Spatial
private import Foundation

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ImmersiveSpace<Content, Data>: Scene where Content: ImmersiveSpaceContent, Data: Decodable, Data: Encodable, Data: Hashable {
    private var content: PresentedContent<Data, PresentedImmersiveSpaceContent<Content>>
    private var id: String?
    private var decoder: ((Foundation.Data) -> AnyHashable?)?
    
    public init(@ImmersiveSpaceContentBuilder content: @escaping () -> Content) where Data == Never {
        assertUnimplemented()
    }

    @available(visionOS, introduced: 1.0, deprecated: 26.0, renamed: "init(id:makeContent:)")
    @_disfavoredOverload public init(id: String, @ImmersiveSpaceContentBuilder content: () -> Content) where Data == Never {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient public init(id: String, @ImmersiveSpaceContentBuilder makeContent: @escaping () -> Content) where Data == Never {
        if #available(visionOS 26.0, *) {
            self.init(id: id, lazyContent: makeContent)
        } else {
            self.init(id: id, content: makeContent)
        }
    }

    public init(id: String, for type: Data.Type, @ImmersiveSpaceContentBuilder content: @escaping (Binding<Data?>) -> Content) {
        assertUnimplemented()
    }

    public init(for type: Data.Type, @ImmersiveSpaceContentBuilder content: @escaping (Binding<Data?>) -> Content) {
        assertUnimplemented()
    }

    public init(id: String, for type: Data.Type = Data.self, @ImmersiveSpaceContentBuilder content: @escaping (Binding<Data>) -> Content, defaultValue: @escaping () -> Data) {
        assertUnimplemented()
    }

    public init(for type: Data.Type = Data.self, @ImmersiveSpaceContentBuilder content: @escaping (Binding<Data>) -> Content, defaultValue: @escaping () -> Data) {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public var body: some Scene {
        WindowSceneList(
            configuration: WindowSceneConfiguration(
                attributes: ImmersiveSpaceConfigurationAttributes(
                    from: content
                ),
                mainContent: AnyView(content),
                title: nil,
                presentationDataType: Data.self,
                decoder: decoder
            ),
            id: id,
            contentType: Content.self
        )
    }
}

@available(*, unavailable)
extension ImmersiveSpace: Sendable {}

@available(visionOS 1.1, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EnvironmentValues {
    public var immersiveSpaceDisplacement: Spatial.Pose3D {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersiveSpace {
    @usableFromInline
    internal nonisolated init(id: String, @ImmersiveSpaceContentBuilder lazyContent: @escaping () -> Content) where Data == Never {
        self.id = id
        let view = PresentedImmersiveSpaceContent(rootContent: .lazy(lazyContent))
        self.content = .view(view)
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersiveSpace {
    nonisolated public init<C>(@CompositorContentBuilder makeContent: @escaping () -> C) where Content == CompositorContentBuilder.Content<C>, Data == Never, C: CompositorContent {
        assertUnimplemented()
    }

    nonisolated public init<C>(id: String, @CompositorContentBuilder makeContent: @escaping () -> C) where Content == CompositorContentBuilder.Content<C>, Data == Never, C: CompositorContent {
        assertUnimplemented()
    }

    nonisolated public init<C>(id: String, for type: Data.Type, @CompositorContentBuilder makeContent: @escaping (Binding<Data?>) -> C) where Content == CompositorContentBuilder.Content<C>, C: CompositorContent {
        assertUnimplemented()
    }

    nonisolated public init<C>(for type: Data.Type, @CompositorContentBuilder makeContent: @escaping (Binding<Data?>) -> C) where Content == CompositorContentBuilder.Content<C>, C: CompositorContent {
        assertUnimplemented()
    }

    nonisolated public init<C>(id: String, for type: Data.Type = Data.self, @CompositorContentBuilder makeContent: @escaping (Binding<Data>) -> C, defaultValue: @escaping () -> Data) where Content == CompositorContentBuilder.Content<C>, C: CompositorContent {
        assertUnimplemented()
    }

    nonisolated public init<C>(for type: Data.Type = Data.self, @CompositorContentBuilder makeContent: @escaping (Binding<Data>) -> C, defaultValue: @escaping () -> Data) where Content == CompositorContentBuilder.Content<C>, C: CompositorContent {
        assertUnimplemented()
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@preconcurrency @MainActor public protocol ImmersiveSpaceContent {
    associatedtype Body: ImmersiveSpaceContent
    @ImmersiveSpaceContentBuilder @MainActor @preconcurrency var body: Self.Body { get }
}

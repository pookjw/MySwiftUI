public import MySwiftUICore
public import Foundation

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct Model3D<Content> : View, _RemoveGlobalActorIsolation where Content : View {
    nonisolated public init(url: URL) where Content == ResolvedModel3D {
        assertUnimplemented()
    }
    
    nonisolated public init<Model, Placeholder>(url: URL, @ViewBuilder content: @escaping (ResolvedModel3D) -> Model, @ViewBuilder placeholder: @escaping () -> Placeholder) where Content == Model3DPlaceholderContent<Model, Placeholder>, Model : View, Placeholder : View {
        assertUnimplemented()
    }
    
    nonisolated public init(url: URL, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (Model3DPhase) -> Content) {
        assertUnimplemented()
    }
    
    nonisolated public init(named name: String, bundle: Bundle? = nil) where Content == ResolvedModel3D {
        assertUnimplemented()
    }
    
    nonisolated public init<Model, Placeholder>(named name: String, bundle: Bundle? = nil, @ViewBuilder content: @escaping (ResolvedModel3D) -> Model, @ViewBuilder placeholder: @escaping () -> Placeholder) where Content == Model3DPlaceholderContent<Model, Placeholder>, Model : View, Placeholder : View {
        assertUnimplemented()
    }
    
    nonisolated public init(named name: String, bundle: Bundle? = nil, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (Model3DPhase) -> Content) {
        assertUnimplemented()
    }
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init(from catalog: Entity.ConfigurationCatalog, configurations: [String : String]? = nil) where Content == ResolvedModel3D {
        assertUnimplemented()
    }
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init<Model, Placeholder>(from catalog: Entity.ConfigurationCatalog, configurations: [String : String]? = nil, @ViewBuilder content: @escaping (ResolvedModel3D) -> Model, @ViewBuilder placeholder: @escaping () -> Placeholder) where Content == Model3DPlaceholderContent<Model, Placeholder>, Model : View, Placeholder : View {
        assertUnimplemented()
    }
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public init(from catalog: Entity.ConfigurationCatalog, configurations: [String : String]? = nil, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (Model3DPhase) -> Content) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Model3D {
    nonisolated public init<Model>(asset: Model3DAsset, @ViewBuilder content: @escaping (ResolvedModel3D) -> Model) where Content == Model3DPlaceholderContent<Model, EmptyView>, Model : View {
        assertUnimplemented()
    }
    
    nonisolated public init(asset: Model3DAsset) where Content == ResolvedModel3D {
        assertUnimplemented()
    }
}

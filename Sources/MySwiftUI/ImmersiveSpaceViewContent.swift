internal import UIKit
internal import MySwiftUICore

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ImmersiveSpaceViewContent<Content>: ImmersiveSpaceContent, PrimitiveImmersiveSpaceContent where Content: View {
    func _makeView() -> AnyView {
        return AnyView(self.content)
    }
    
    static func _makeSceneSessionRole() -> UISceneSession.Role {
        return .immersiveSpaceApplication
    }
    
    static func _makeSceneWindowType() -> UIWindow.Type {
        return UIWindow.self
    }
    
    static func _makeSupportedImmersionStyles() -> [any ImmersionStyle] {
        return [
            .full,
            .mixed,
            .progressive
        ]
    }
    
    private var content: Content
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @usableFromInline
    internal init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    public typealias Body = Never
}

@available(*, unavailable)
extension ImmersiveSpaceViewContent: Sendable {}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Never : ImmersiveSpaceContent {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersiveSpaceViewContent {
    public var body: Never {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersiveSpace {
    nonisolated public init<V>(@ViewBuilder content: @escaping () -> V) where Content == ImmersiveSpaceViewContent<V>, Data == Never, V: View {
        assertUnimplemented()
    }

    @available(visionOS, introduced: 1.0, deprecated: 26.0, renamed: "init(id:makeContent:)")
    @_disfavoredOverload nonisolated public init<V>(id: String, @ViewBuilder content: () -> V) where Content == ImmersiveSpaceViewContent<V>, Data == Never, V: View {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient nonisolated public init<V>(id: String, @ViewBuilder makeContent: @escaping @Sendable /* @Sendable은 원래 없음 */ () -> V) where Content == ImmersiveSpaceViewContent<V>, Data == Never, V: View {
        if #available(visionOS 26.0, *) {
            self.init(id: id, lazyContent: {
                ImmersiveSpaceViewContent(content: makeContent)
            })
        } else {
            self.init(id: id, content: makeContent)
        }
    }

    nonisolated public init<V>(id: String, for type: Data.Type, @ViewBuilder content: @escaping (Binding<Data?>) -> V) where Content == ImmersiveSpaceViewContent<V>, V: View {
        assertUnimplemented()
    }

    nonisolated public init<V>(for type: Data.Type, @ViewBuilder content: @escaping (Binding<Data?>) -> V) where Content == ImmersiveSpaceViewContent<V>, V: View {
        assertUnimplemented()
    }

    nonisolated public init<V>(id: String, for type: Data.Type = Data.self, @ViewBuilder content: @escaping (Binding<Data>) -> V, defaultValue: @escaping () -> Data) where Content == ImmersiveSpaceViewContent<V>, V: View {
        assertUnimplemented()
    }

    nonisolated public init<V>(for type: Data.Type = Data.self, @ViewBuilder content: @escaping (Binding<Data>) -> V, defaultValue: @escaping () -> Data) where Content == ImmersiveSpaceViewContent<V>, V: View {
        assertUnimplemented()
    }
}

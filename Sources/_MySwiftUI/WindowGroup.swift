public import MySwiftUICore
public import Foundation

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct WindowGroup<Content>: Scene where Content: View {
    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    public init(id: String, @ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:id:makeContent:)")
    @_disfavoredOverload public init(_ title: Text, id: String, @ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:id:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:id:makeContent:)")
    @_disfavoredOverload public init<S>(_ title: S, id: String, @ViewBuilder content: () -> Content) where S: StringProtocol {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(makeContent:)")
    public init(@ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @_disfavoredOverload public init(_ title: Text, @ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        fatalError("TODO")
    }

    @available(iOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(macOS, introduced: 11.0, deprecated: 15.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(tvOS, introduced: 14.0, deprecated: 18.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(watchOS, introduced: 7.0, deprecated: 11.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(_:makeContent:)", message: "Use the initializer which takes an escaping view builder instead.")
    @_disfavoredOverload public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S: StringProtocol {
        fatalError("TODO")
    }

    @MainActor @preconcurrency public var body: some Scene {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension WindowGroup: Sendable {}

@available(iOS 16.0, macOS 13.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WindowGroup {
    nonisolated public init<D, C>(id: String, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload nonisolated public init<D, C>(_ title: Text, id: String, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(_ titleKey: LocalizedStringKey, id: String, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init<D, C>(_ titleResource: LocalizedStringResource, id: String, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        self.init(Text(titleResource), id: id, for: type, content: content)
    }

    @_disfavoredOverload nonisolated public init<S, D, C>(_ title: S, id: String, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, S: StringProtocol, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload nonisolated public init<D, C>(_ title: Text, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(_ titleKey: LocalizedStringKey, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init<D, C>(_ titleResource: LocalizedStringResource, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        self.init(Text(titleResource), for: type, content: content)
    }

    @_disfavoredOverload nonisolated public init<S, D, C>(_ title: S, for type: D.Type, @ViewBuilder content: @escaping (Binding<D?>) -> C) where Content == PresentedWindowContent<D, C>, S: StringProtocol, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(id: String, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload nonisolated public init<D, C>(_ title: Text, id: String, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(_ titleKey: LocalizedStringKey, id: String, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init<D, C>(_ titleResource: LocalizedStringResource, id: String, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        self.init(
            Text(titleResource),
            id: id,
            for: type,
            content: content,
            defaultValue: defaultValue
        )
    }

    @_disfavoredOverload nonisolated public init<S, D, C>(_ title: S, id: String, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, S: StringProtocol, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload nonisolated public init<D, C>(_ title: Text, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    nonisolated public init<D, C>(_ titleKey: LocalizedStringKey, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init<D, C>(_ titleResource: LocalizedStringResource, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, D: Decodable, D: Encodable, D: Hashable, C: View {
        self.init(
            Text(titleResource),
            for: type,
            content: content,
            defaultValue: defaultValue
        )
    }

    @_disfavoredOverload nonisolated public init<S, D, C>(_ title: S, for type: D.Type = D.self, @ViewBuilder content: @escaping (Binding<D>) -> C, defaultValue: @escaping () -> D) where Content == PresentedWindowContent<D, C>, S: StringProtocol, D: Decodable, D: Encodable, D: Hashable, C: View {
        fatalError("TODO")
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, visionOS 1.0, *)
extension WindowGroup {
    @MainActor // 원래 없음
    @_alwaysEmitIntoClient /*nonisolated*/ public init(id: String, @ViewBuilder makeContent: @escaping () -> Content) {
        if #available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.3, *) {
            self.init(id: id, lazyContent: makeContent)
        } else {
            self.init(id: id, content: makeContent)
        }
    }

    @MainActor // 원래 없음
    @_disfavoredOverload @_alwaysEmitIntoClient /*nonisolated*/ public init(_ title: Text, id: String, @ViewBuilder makeContent: @escaping () -> Content) {
        if #available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.3, *) {
            self.init(id: id, title: title, lazyContent: makeContent)
        } else {
            self.init(title, id: id, content: makeContent)
        }
    }

    @MainActor // 원래 없음
    @_alwaysEmitIntoClient /*nonisolated*/ public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder makeContent: @escaping () -> Content) {
        self.init(Text(titleKey), id: id, makeContent: makeContent)
    }

    @MainActor // 원래 없음
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_alwaysEmitIntoClient @_disfavoredOverload /*nonisolated*/ public init(_ titleResource: LocalizedStringResource, id: String, @ViewBuilder makeContent: @escaping () -> Content) {
        self.init(Text(titleResource), id: id, makeContent: makeContent)
    }

    @MainActor // 원래 없음
    @_disfavoredOverload @_alwaysEmitIntoClient /*nonisolated*/ public init<S>(_ title: S, id: String, @ViewBuilder makeContent: @escaping () -> Content) where S: StringProtocol {
        self.init(Text(title), id: id, makeContent: makeContent)
    }

    @MainActor // 원래 없음
    @_alwaysEmitIntoClient /*nonisolated*/ public init(@ViewBuilder makeContent: @escaping () -> Content) {
        if #available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.3, *) {
            self.init(lazyContent: makeContent)
        } else {
            self.init(content: makeContent)
        }
    }

    @MainActor // 원래 없음
    @_disfavoredOverload @_alwaysEmitIntoClient /*nonisolated*/ public init(_ title: Text, @ViewBuilder makeContent: @escaping () -> Content) {
        if #available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.3, *) {
            self.init(title: title, lazyContent: makeContent)
        } else {
            self.init(title, content: makeContent)
        }
    }

    @MainActor // 원래 없음
    @_alwaysEmitIntoClient /*nonisolated*/ public init(_ titleKey: LocalizedStringKey, @ViewBuilder makeContent: @escaping () -> Content) {
        self.init(Text(titleKey), makeContent: makeContent)
    }

    @MainActor // 원래 없음
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_alwaysEmitIntoClient @_disfavoredOverload /*nonisolated*/ public init(_ titleResource: LocalizedStringResource, @ViewBuilder makeContent: @escaping () -> Content) {
        self.init(Text(titleResource), makeContent: makeContent)
    }

    @MainActor // 원래 없음
    @_disfavoredOverload @_alwaysEmitIntoClient /*nonisolated*/ public init<S>(_ title: S, @ViewBuilder makeContent: @escaping () -> Content) where S: StringProtocol {
        self.init(Text(title), makeContent: makeContent)
    }
}

@available(iOS 17.5, macOS 14.5, tvOS 17.5, watchOS 10.5, visionOS 1.3, *)
extension WindowGroup {
    @usableFromInline
    nonisolated internal init(id: String? = nil, title: Text? = nil, @ViewBuilder lazyContent: @escaping () -> Content) {
        fatalError("TODO")
    }
}

public import MySwiftUICore
public import Foundation
public import DeveloperToolsSupport

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Button<Label> : View where Label : View {
    @preconcurrency public nonisolated init(action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var body: some View {
        __MSUI_UnimplementedView<Self>()
    }
}

@available(*, unavailable)
extension Button : Sendable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Button where Label == Text {
    @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, action: @escaping @MainActor () -> Void) {
        assertUnimplemented()
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @preconcurrency @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, action: @escaping @MainActor () -> Void) {
        self.init(action: action) { Text(titleResource) }
    }

    @preconcurrency @_disfavoredOverload nonisolated public init<S>(_ title: S, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Button where Label == MySwiftUI.Label<Text, Image> {
    @_alwaysEmitIntoClient nonisolated public init(_ titleKey: LocalizedStringKey, systemImage: String, action: @escaping @MainActor () -> Void) {
        self.init(action: action) { MySwiftUI.Label(titleKey, systemImage: systemImage) }
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_alwaysEmitIntoClient @_disfavoredOverload nonisolated public init(_ titleResource: LocalizedStringResource, systemImage: String, action: @escaping @MainActor () -> Void) {
        self.init(action: action) { MySwiftUI.Label(titleResource, systemImage: systemImage) }
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init<S>(_ title: S, systemImage: String, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        self.init(action: action) { MySwiftUI.Label(title, systemImage: systemImage) }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Button where Label == MySwiftUI.Label<Text, Image> {
    @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, image: ImageResource, action: @escaping @MainActor () -> Void) {
        assertUnimplemented()
    }

    @preconcurrency @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, image: ImageResource, action: @escaping @MainActor () -> Void) {
        self.init(action: action) { MySwiftUI.Label(titleResource, image: image) }
    }

    @preconcurrency @_disfavoredOverload nonisolated public init<S>(_ title: S, image: ImageResource, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Button {
    @preconcurrency nonisolated public init(role: ButtonRole?, action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label) {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Button where Label == Text {
    @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        assertUnimplemented()
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @preconcurrency @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        self.init(role: role, action: action) { Text(titleResource) }
    }

    @preconcurrency @_disfavoredOverload nonisolated public init<S>(_ title: S, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Button where Label == MySwiftUI.Label<Text, Image> {
    @_alwaysEmitIntoClient nonisolated public init(_ titleKey: LocalizedStringKey, systemImage: String, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        self.init(role: role, action: action) { MySwiftUI.Label(titleKey, systemImage: systemImage) }
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_alwaysEmitIntoClient @_disfavoredOverload nonisolated public init(_ titleResource: LocalizedStringResource, systemImage: String, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        self.init(role: role, action: action) { MySwiftUI.Label(titleResource, systemImage: systemImage) }
    }

    @_alwaysEmitIntoClient @_disfavoredOverload nonisolated public init<S>(_ title: S, systemImage: String, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        self.init(role: role, action: action) { MySwiftUI.Label(title, systemImage: systemImage) }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Button where Label == MySwiftUI.Label<Text, Image> {
    @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, image: ImageResource, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        assertUnimplemented()
    }

    @preconcurrency @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, image: ImageResource, role: ButtonRole?, action: @escaping @MainActor () -> Void) {
        self.init(role: role, action: action) { MySwiftUI.Label(titleResource, image: image) }
    }

    @preconcurrency @_disfavoredOverload nonisolated public init<S>(_ title: S, image: ImageResource, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Button where Label == DefaultButtonLabel {
    @preconcurrency public init(role: ButtonRole, action: @escaping @MainActor () -> Void) {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct DefaultButtonLabel : View {
    @MainActor @preconcurrency public var body: some View {
        __MSUI_UnimplementedView<Self>()
    }
}

@available(*, unavailable)
extension DefaultButtonLabel : Sendable {}

public import MySwiftUICore
public import Foundation
public import DeveloperToolsSupport
public import CoreGraphics

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct Label<Title, Icon> : View where Title : View, Icon : View {
    public init(@ViewBuilder title: () -> Title, @ViewBuilder icon: () -> Icon) {
        assertUnimplemented()
    }

    @MainActor @preconcurrency public var body: some View {
        let result: Text = { assertUnimplemented() }()
        return result
    }
}

@available(*, unavailable)
extension Label : Sendable {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == Text, Icon == Image {
    nonisolated public init(_ titleKey: LocalizedStringKey, image name: String) {
        assertUnimplemented()
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, image name: String) {
        self.init { Text(titleResource) } icon: { Image(name) }
    }

    nonisolated public init(_ titleKey: LocalizedStringKey, systemImage name: String) {
        assertUnimplemented()
    }

    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, systemImage name: String) {
        self.init { Text(titleResource) } icon: { Image(systemName: name) }
    }

    @_disfavoredOverload nonisolated public init<S>(_ title: S, image name: String) where S : StringProtocol {
        assertUnimplemented()
    }

    @_disfavoredOverload nonisolated public init<S>(_ title: S, systemImage name: String) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Label where Title == Text, Icon == Image {
    nonisolated public init(_ titleKey: LocalizedStringKey, image resource: ImageResource) {
        assertUnimplemented()
    }

    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public init(_ titleResource: LocalizedStringResource, image resource: ImageResource) {
        self.init { Text(titleResource) } icon: { Image(resource) }
    }

    @_disfavoredOverload nonisolated public init<S>(_ title: S, image resource: ImageResource) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Label where Title == LabelStyleConfiguration.Title, Icon == LabelStyleConfiguration.Icon {
    nonisolated public init(_ configuration: LabelStyleConfiguration) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct LabelStyleConfiguration {
    @MainActor @preconcurrency public struct Title : View {
        public typealias Body = Never
        public var body: Never { assertUnimplemented() }
    }

    @MainActor @preconcurrency public struct Icon : View {
        public typealias Body = Never
        public var body: Never { assertUnimplemented() }
    }

    public var title: Title { assertUnimplemented() }
    public var icon: Icon { assertUnimplemented() }
}

@available(*, unavailable)
extension LabelStyleConfiguration : Sendable {}

@available(*, unavailable)
extension LabelStyleConfiguration.Title : Sendable {}

@available(*, unavailable)
extension LabelStyleConfiguration.Icon : Sendable {}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension EnvironmentValues {
    public var labelReservedIconWidth: CGFloat? { assertUnimplemented() }
    public var labelIconToTitleSpacing: CGFloat? { assertUnimplemented() }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension View {
    nonisolated public func labelReservedIconWidth(_ value: CGFloat) -> some View {
        let result: Self = { assertUnimplemented() }()
        return result
    }

    nonisolated public func labelIconToTitleSpacing(_ value: CGFloat) -> some View {
        let result: Self = { assertUnimplemented() }()
        return result
    }
}

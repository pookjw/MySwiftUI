public import MySwiftUICore

@available(macOS 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension PrimitiveButtonStyle where Self == LinkButtonStyle {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var link: LinkButtonStyle { .init() }
}

@available(macOS 10.15, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct LinkButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension LinkButtonStyle : Sendable {}

@available(tvOS 14.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension PrimitiveButtonStyle where Self == CardButtonStyle {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var card: CardButtonStyle { .init() }
}

@available(tvOS 14.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct CardButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension CardButtonStyle : Sendable {}

@available(macOS 14.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PrimitiveButtonStyle where Self == AccessoryBarButtonStyle {
    @MainActor @preconcurrency public static var accessoryBar: AccessoryBarButtonStyle { assertUnimplemented() }
}

@available(macOS 14.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct AccessoryBarButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension AccessoryBarButtonStyle : Sendable {}

@available(macOS 14.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PrimitiveButtonStyle where Self == AccessoryBarActionButtonStyle {
    @MainActor @preconcurrency public static var accessoryBarAction: AccessoryBarActionButtonStyle { assertUnimplemented() }
}

@available(macOS 14.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct AccessoryBarActionButtonStyle : PrimitiveButtonStyle {
    public init() { assertUnimplemented() }
    @MainActor @preconcurrency public func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension AccessoryBarActionButtonStyle : Sendable {}

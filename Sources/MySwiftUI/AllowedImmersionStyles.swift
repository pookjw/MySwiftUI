public import MySwiftUICore
internal import AttributeGraph

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol ImmersionStyle {}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func immersionStyle(
        selection: Binding<any ImmersionStyle>,
        in styles: any ImmersionStyle...
    ) -> some Scene {
        assertUnimplemented()
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ImmersionStyle where Self == AutomaticImmersionStyle {
    @_alwaysEmitIntoClient
    public static var automatic: AutomaticImmersionStyle {
        .init()
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct AutomaticImmersionStyle : ImmersionStyle {
    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension AutomaticImmersionStyle : Sendable {}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersionStyle where Self == FullImmersionStyle {
    @_alwaysEmitIntoClient
    public static var full: FullImmersionStyle {
        .init()
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FullImmersionStyle : ImmersionStyle {
    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension FullImmersionStyle : Sendable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersionStyle where Self == MixedImmersionStyle {
    @_alwaysEmitIntoClient
    public static var mixed: MixedImmersionStyle {
        .init()
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MixedImmersionStyle : ImmersionStyle {
    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension MixedImmersionStyle : Sendable {}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ImmersionStyle where Self == ProgressiveImmersionStyle {
    @available(visionOS 26.0, *)
    public static func progressive(
        _ immersionRange: PartialRangeFrom<Double>,
        initialAmount: Double? = nil,
        aspectRatio: ProgressiveImmersionAspectRatio?
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 26.0, *)
    public static func progressive(
        _ immersionRange: PartialRangeThrough<Double>,
        initialAmount: Double? = nil,
        aspectRatio: ProgressiveImmersionAspectRatio?
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 26.0, *)
    public static func progressive(
        _ immersionRange: ClosedRange<Double>,
        initialAmount: Double? = nil,
        aspectRatio: ProgressiveImmersionAspectRatio?
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 26.0, *)
    public static func progressive(
        aspectRatio: ProgressiveImmersionAspectRatio
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 2.0, *)
    public static func progressive(
        _ immersionRange: PartialRangeFrom<Double>,
        initialAmount: Double? = nil
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 2.0, *)
    public static func progressive(
        _ immersionRange: PartialRangeThrough<Double>,
        initialAmount: Double? = nil
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @available(visionOS 2.0, *)
    public static func progressive(
        _ immersionRange: ClosedRange<Double>,
        initialAmount: Double? = nil
    ) -> ProgressiveImmersionStyle {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient
    public static var progressive: ProgressiveImmersionStyle {
        .init()
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct ProgressiveImmersionStyle : ImmersionStyle {
    @available(visionOS 26.0, *)
    public let aspectRatio: ProgressiveImmersionAspectRatio

    @available(visionOS 2.0, *)
    public let minimumImmersionAmount: Double?

    @available(visionOS 2.0, *)
    public let maximumImmersionAmount: Double?

    @available(visionOS 2.0, *)
    public let initialImmersionAmount: Double?

    @available(visionOS 2.0, *)
    public init(immersion: PartialRangeFrom<Double>, initialAmount: Double? = nil) {
        assertUnimplemented()
    }

    @available(visionOS 2.0, *)
    public init(immersion: PartialRangeThrough<Double>, initialAmount: Double? = nil) {
        assertUnimplemented()
    }

    @available(visionOS 2.0, *)
    public init(immersion: ClosedRange<Double>, initialAmount: Double? = nil) {
        assertUnimplemented()
    }

    @available(visionOS 1.0, *)
    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ProgressiveImmersionStyle : Sendable {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct ProgressiveImmersionAspectRatio : Equatable, Sendable {
    public static var automatic: ProgressiveImmersionAspectRatio {
        get {
            assertUnimplemented()
        }
    }

    public static var landscape: ProgressiveImmersionAspectRatio {
        get {
            assertUnimplemented()
        }
    }

    public static var portrait: ProgressiveImmersionAspectRatio {
        get {
            assertUnimplemented()
        }
    }

    public static func == (
        a: ProgressiveImmersionAspectRatio,
        b: ProgressiveImmersionAspectRatio
    ) -> Bool {
        assertUnimplemented()
    }
}

struct ImmersionStyleSelectionInput : SceneInput {
    static var defaultValue: OptionalAttribute<Binding<any ImmersionStyle>> {
        return OptionalAttribute()
    }
}

struct AllowedImmersionStylesInput : SceneInput {
    static var defaultValue: OptionalAttribute<[any ImmersionStyle]> {
        return OptionalAttribute()
    }
}

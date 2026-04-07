@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_functionBuilder public struct CompositorContentBuilder {
    public struct Content<C> where C: CompositorContent {}

    @_alwaysEmitIntoClient public static func buildBlock<C>(_ content: C) -> C where C: CompositorContent {
        return content
    }

    @_alwaysEmitIntoClient public static func buildExpression<C>(_ content: C) -> C where C: CompositorContent {
        return content
    }
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompositorContentBuilder.Content: CompositorContent {
    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = Never

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias _ViewRepresentation = _CompositorContentBodyAdaptor<CompositorContentBuilder.Content<C>>
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompositorContentBuilder.Content {
    public var body: Never {
        get {
            assertUnimplemented()
        }
    }
}

@available(*, unavailable)
extension CompositorContentBuilder.Content: Sendable {}

@available(*, unavailable)
extension CompositorContentBuilder: Sendable {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompositorContentBuilder {
    @_alwaysEmitIntoClient public static func buildEither<F>(first: _LimitedAvailabilityCompositorContent) -> _ConditionalContent<_LimitedAvailabilityCompositorContent, F> where F: CompositorContent {
        .init(storage: .trueContent(first))
    }

    @_alwaysEmitIntoClient public static func buildEither<F>(first: _ConditionalContent<_LimitedAvailabilityCompositorContent, _LimitedAvailabilityCompositorContent>) -> _ConditionalContent<_LimitedAvailabilityCompositorContent, F> where F: CompositorContent {
        .init(storage: .trueContent(
            _LimitedAvailabilityCompositorContent(first)))
    }

    @_alwaysEmitIntoClient public static func buildEither<F>(second: F) -> _ConditionalContent<_LimitedAvailabilityCompositorContent, F> where F: CompositorContent {
        .init(storage: .falseContent(second))
    }

    @available(*, unavailable, message: "conditional branching in a CompositorContentBuilder can only be used with #available clauses")
    public static func buildEither<T, F>(first: T) -> _ConditionalContent<T, F> where T: CompositorContent, F: CompositorContent {
        assertUnimplemented()
    }

    @available(*, unavailable, message: "conditional branching in a CompositorContentBuilder can only be used with #available clauses")
    public static func buildEither<T, F>(second: F) -> _ConditionalContent<T, F> where T: CompositorContent, F: CompositorContent {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient public static func buildLimitedAvailability(_ content: some CompositorContent) -> _LimitedAvailabilityCompositorContent {
        return _LimitedAvailabilityCompositorContent(content)
    }
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompositorContentBuilder.Content: ImmersiveSpaceContent {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct AnyCompositorContent: CompositorContent, PrimitiveCompositorContent {
    public init<T>(_ content: T) where T: CompositorContent {
        assertUnimplemented()
    }

    @_alwaysEmitIntoClient public init<T>(erasing: T) where T: CompositorContent {
        self.init(erasing)
    }

    nonisolated public var _viewRepresentation: AnyView {
        get {
            assertUnimplemented()
        }
    }

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias Body = Never

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias _ViewRepresentation = AnyView
}

@available(*, unavailable)
extension AnyCompositorContent: Sendable {}

@_hasMissingDesignatedInitializers @available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@usableFromInline
internal class AnyCompositorContentStorageBase {
    deinit {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension AnyCompositorContentStorageBase: Sendable {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct _LimitedAvailabilityCompositorContent: CompositorContent {
    @usableFromInline
    internal var storage: AnyCompositorContent

    @usableFromInline
    internal nonisolated /* nonisolated는 원래 없음 */ init<C>(_ content: C) where C: CompositorContent {
        assertUnimplemented()
    }

    @MainActor public var body: some CompositorContent {
        get {
            assertUnimplemented()
        }
    }

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias _ViewRepresentation = _CompositorContentBodyAdaptor<_LimitedAvailabilityCompositorContent>
}

@available(*, unavailable)
extension _LimitedAvailabilityCompositorContent: Sendable {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension _ConditionalContent: CompositorContent, PrimitiveCompositorContent where TrueContent: CompositorContent, FalseContent: CompositorContent {
    @usableFromInline
    internal init(storage: _ConditionalContent<TrueContent, FalseContent>.Storage) {
        assertUnimplemented()
    }

    nonisolated public var _viewRepresentation: _ConditionalContent<TrueContent._ViewRepresentation, FalseContent._ViewRepresentation> {
        get {
            assertUnimplemented()
        }
    }

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable, introduced: 13.0)
    @available(tvOS, unavailable, introduced: 13.0)
    @available(watchOS, unavailable, introduced: 6.0)
    public typealias Body = Never

    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable, introduced: 13.0)
    @available(tvOS, unavailable, introduced: 13.0)
    @available(watchOS, unavailable, introduced: 6.0)
    public typealias _ViewRepresentation = _ConditionalContent<TrueContent._ViewRepresentation, FalseContent._ViewRepresentation>
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@_typeEraser(AnyCompositorContent) @MainActor public protocol CompositorContent {
    associatedtype Body: CompositorContent
    @CompositorContentBuilder @MainActor var body: Self.Body { get }
    associatedtype _ViewRepresentation: View = _CompositorContentBodyAdaptor<Self>
    nonisolated var _viewRepresentation: Self._ViewRepresentation { get }
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension CompositorContent where Self._ViewRepresentation == _CompositorContentBodyAdaptor<Self> {
    nonisolated public var _viewRepresentation: _CompositorContentBodyAdaptor<Self> {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Never: CompositorContent {
    @available(visionOS 26.0, macOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public typealias _ViewRepresentation = _CompositorContentBodyAdaptor<Never>
}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct _CompositorContentBodyAdaptor<C>: View where C: CompositorContent {
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(*, unavailable)
extension _CompositorContentBodyAdaptor: Sendable {}

protocol PrimitiveCompositorContent : CompositorContent where Body == Never {
}

extension PrimitiveCompositorContent {
    public var body: Never {
        preconditionFailure()
    }
    
    // TODO
}

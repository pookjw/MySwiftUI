// 13F48789A88A23B9FD7CB3B396306EF9
public import MySwiftUICore
internal import AttributeGraph
internal import CoreGraphics
internal import MRUIKit

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol ImmersionStyle {
    @_spi(Internal) func _resolved() -> _ResolvedImmersionStyle
}

extension ImmersionStyle {
    @_spi(Internal) public func _resolved() -> _ResolvedImmersionStyle {
        fatalError("아마 extension이 있을 것")
//        return _ResolvedImmersionStyle(wrappedStyle: MixedImmersionStyle(), initialImmersionLevel: 0)
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
        // nop
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
        // nop
    }
}

@available(*, unavailable)
extension FullImmersionStyle : Sendable {}

extension FullImmersionStyle {
    @_spi(Internal) public func _resolved() -> _ResolvedImmersionStyle {
        return _ResolvedImmersionStyle(wrappedStyle: self, initialImmersionLevel: 0.5)
    }
}

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
        // nop
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
        self.aspectRatio = .automatic
        self.minimumImmersionAmount = nil
        self.maximumImmersionAmount = nil
        self.initialImmersionAmount = nil
    }
}

extension ProgressiveImmersionStyle {
    @_spi(Internal) public func _resolved() -> _ResolvedImmersionStyle {
        return _ResolvedImmersionStyle(wrappedStyle: self, initialImmersionLevel: 0.5)
    }
}

@available(*, unavailable)
extension ProgressiveImmersionStyle : Sendable {}

@available(macOS 26.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct ProgressiveImmersionAspectRatio : Equatable, Sendable {
    private var storage: ProgressiveImmersionAspectRatio.Stroage
    
    public static var automatic: ProgressiveImmersionAspectRatio {
        return ProgressiveImmersionAspectRatio(storage: .automatic)
    }

    public static var landscape: ProgressiveImmersionAspectRatio {
        return ProgressiveImmersionAspectRatio(storage: .landscape)
    }

    public static var portrait: ProgressiveImmersionAspectRatio {
        return ProgressiveImmersionAspectRatio(storage: .portrait)
    }
    
    static var spatialSafari: ProgressiveImmersionAspectRatio {
        return ProgressiveImmersionAspectRatio(storage: .spatialSafari)
    }

    public static func == (
        a: ProgressiveImmersionAspectRatio,
        b: ProgressiveImmersionAspectRatio
    ) -> Bool {
        assertUnimplemented()
    }
}

extension ProgressiveImmersionAspectRatio {
    fileprivate enum Stroage: Hashable {
        case automatic
        case landscape
        case portrait
        case spatialSafari
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

func immersionStyleForImmersionStyle<T: ImmersionStyle>(_ style: T) -> MRUIImmersionStyle {
    let resolved = style._resolved()
    let d0 = resolved.initialImmersionLevel
    
    if d0 == 0 {
        return .mixed
    } else {
        let d1: CGFloat = 0.5
        let d2: CGFloat = 1.0
        
        let w8 = MRUIImmersionStyle.progressive
        var w9 = MRUIImmersionStyle.full
        w9 = (d0 == d2) ? [] : w9
        let x19 = (d0 == d1) ? w8 : w9
        return x19
    }
}

func _MRUIImmersionStyleFromString(_ string: String) -> MRUIImmersionStyle? {
    assertUnimplemented()
}

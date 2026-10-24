public import CoreGraphics

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct Canvas<Symbols> where Symbols : View {
    public var symbols: Symbols

    public var renderer: (inout GraphicsContext, CGSize) -> Void

    public var isOpaque: Bool {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var colorMode: ColorRenderingMode {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var rendersAsynchronously: Bool {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void, @ViewBuilder symbols: () -> Symbols) {
        assertUnimplemented()
    }

    nonisolated public static func _makeView(view: _GraphValue<Canvas<Symbols>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }

    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Body = Never
}

@available(*, unavailable)
extension Canvas : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Canvas where Symbols == EmptyView {
    public init(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear, rendersAsynchronously: Bool = false, renderer: @escaping (inout GraphicsContext, CGSize) -> Void) {
        assertUnimplemented()
    }
}

extension Canvas : View {
    public var body: Never {
        assertUnimplemented()
    }
}

package import CoreGraphics

package struct BlurStyle {
    private var radius: CGFloat
    private(set) var isOpaque: Bool
    private var dither: Bool
    private var hardEdges: Bool
    private var isVisionEnabled: Bool

    init(
        radius: CGFloat = 0,
        isOpaque: Bool = false,
        dither: Bool = false,
        hardEdges: Bool = false
    ) {
        self.radius = radius
        self.isOpaque = isOpaque
        self.dither = dither
        self.hardEdges = hardEdges
        self.isVisionEnabled = false
    }

    var isIdentity: Bool {
        return self.radius <= 0
    }
}

extension BlurStyle : Equatable {
}

extension BlurStyle : Animatable {
    package var animatableData: CGFloat {
        get {
            return self.radius
        }
        set {
            self.radius = newValue
        }
    }
}

extension BlurStyle : ProtobufEncodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension BlurStyle : ProtobufDecodableMessage {
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

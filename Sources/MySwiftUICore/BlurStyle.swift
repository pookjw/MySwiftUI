package import CoreGraphics

package struct BlurStyle {
    private var radius: CGFloat
    private var isOpaque: Bool
    private var dither: Bool
    private var hardEdges: Bool
    private var isVisionEnabled: Bool
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

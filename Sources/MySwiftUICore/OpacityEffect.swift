internal import CoreGraphics

extension View {
    @inlinable nonisolated public func opacity(_ opacity: Double) -> some View {
        return modifier(_OpacityEffect(opacity: opacity))
    }
}

@frozen public struct _OpacityEffect : Equatable {
    public var opacity: Double
    
    @inlinable nonisolated public init(opacity: Double) {
        self.opacity = opacity
    }
    
    public var animatableData: Double {
        get {
            return self.opacity
        }
        set {
            self.opacity = newValue
        }
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_OpacityEffect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public static func == (a: _OpacityEffect, b: _OpacityEffect) -> Bool {
        return a.opacity == b.opacity
    }
    
    public typealias AnimatableData = Double
    public typealias Body = Never
}

extension _OpacityEffect : Animatable {}
extension _OpacityEffect : ViewModifier {}
extension _OpacityEffect : Sendable {}
extension _OpacityEffect : BitwiseCopyable {}

extension _OpacityEffect : RendererEffect {
    func effectValue(size: CGSize) -> DisplayList.Effect {
        return .opacity(Float(self.opacity))
    }
    
    nonisolated static var isScrapeable: Bool {
        return true
    }
}

extension _OpacityEffect : ProtobufEncodableMessage {}
extension _OpacityEffect : ProtobufDecodableMessage {}

extension Color {
    public func opacity(_ opacity: Double) -> Color {
        assertUnimplemented()
    }
    
    public func mix(with rhs: Color, by fraction: Double, in colorSpace: Gradient.ColorSpace = .perceptual) -> Color {
        assertUnimplemented()
    }
}

#warning("TODO")

internal import MySwiftUICore

protocol Geometry3DEffect: Animatable, ViewModifier {
    static var _affectsLayout: Bool { get }
}

extension Geometry3DEffect {
    static var _affectsLayout: Bool {
        return true
    }
}

// SwiftUI에서 Geometry3DEffect를 conform하는 Type이 존재하지 않음
struct Geometry3DEffectImpl: Geometry3DEffect {}

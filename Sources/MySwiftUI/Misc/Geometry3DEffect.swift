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

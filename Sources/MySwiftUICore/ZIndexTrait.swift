extension View {
    @inlinable nonisolated public func zIndex(_ value: Double) -> some View {
        return _trait(ZIndexTraitKey.self, value)
    }
}

@usableFromInline
package struct ZIndexTraitKey : _ViewTraitKey {
    @inlinable package static var defaultValue: Double {
        get { 0.0 }
    }
    
    @usableFromInline
    package typealias Value = Double
}

@available(*, unavailable)
extension ZIndexTraitKey : Sendable {
}

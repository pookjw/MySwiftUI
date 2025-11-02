#warning("TODO")

@usableFromInline
package struct FixedRoundedRect: Equatable {
    @usableFromInline
    package static func == (a: FixedRoundedRect, b: FixedRoundedRect) -> Bool {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension FixedRoundedRect: Sendable {
}

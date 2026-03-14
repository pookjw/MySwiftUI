public import CoreGraphics

public struct _IdentifiedViewProxy {
    public var identifier: AnyHashable
    public var boundingRect: CGRect {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _IdentifiedViewProxy: Sendable {
}

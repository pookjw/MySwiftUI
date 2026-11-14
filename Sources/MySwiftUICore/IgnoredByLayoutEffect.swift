public import CoreGraphics

extension GeometryEffect {
    @inlinable public func ignoredByLayout() -> _IgnoredByLayoutEffect<Self> {
        return _IgnoredByLayoutEffect(self)
    }
}

@frozen public struct _IgnoredByLayoutEffect<Base> : GeometryEffect where Base : GeometryEffect {
    public var base: Base
    
    public static var _affectsLayout: Bool {
        assertUnimplemented()
    }
    
    @inlinable public init(_ base: Base) {
        self.base = base
    }
    
    public func effectValue(size: CGSize) -> ProjectionTransform {
        assertUnimplemented()
    }
    
    public var animatableData: Base.AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public typealias AnimatableData = Base.AnimatableData
    public typealias Body = Never
}

@available(*, unavailable)
extension _IgnoredByLayoutEffect : Sendable {
}

extension _IgnoredByLayoutEffect : Equatable where Base : Equatable {
    public static func == (a: _IgnoredByLayoutEffect<Base>, b: _IgnoredByLayoutEffect<Base>) -> Bool {
        assertUnimplemented()
    }
}

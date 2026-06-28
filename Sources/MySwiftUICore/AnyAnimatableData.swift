// 7ABB4C511D8E2C0F1768F58E8C14509E

@frozen public struct _AnyAnimatableData : VectorArithmetic {
    package var vtable: _AnyAnimatableDataVTable.Type
    package var value: Any
    
    public static var zero: _AnyAnimatableData {
        return _AnyAnimatableData(
            vtable: ZeroVTable.self,
            value: ()
        )
    }
    
    public static func == (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> Bool {
        if lhs.vtable == rhs.vtable {
            return lhs.vtable.isEqual(lhs.value, rhs.value)
        } else {
            return false
        }
    }
    
    public static func += (lhs: inout _AnyAnimatableData, rhs: _AnyAnimatableData) {
        if lhs.vtable == rhs.vtable {
            lhs.vtable.add(&lhs.value, rhs.value)
        } else if lhs.vtable != ZeroVTable.self {
            return
        } else {
            lhs = rhs
        }
    }
    
    public static func -= (lhs: inout _AnyAnimatableData, rhs: _AnyAnimatableData) {
        if lhs.vtable == rhs.vtable {
            return lhs.vtable.subtract(&lhs.value, rhs.value)
        } else if lhs.vtable != ZeroVTable.self {
            return
        } else {
            lhs = rhs
            lhs.vtable.negate(&lhs.value)
        }
    }
    
    @_transparent public static func + (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> _AnyAnimatableData {
        var ret = lhs
        ret += rhs
        return ret
    }
    
    @_transparent public static func - (lhs: _AnyAnimatableData, rhs: _AnyAnimatableData) -> _AnyAnimatableData {
        var ret = lhs
        ret -= rhs
        return ret
    }
    
    public mutating func scale(by rhs: Double) {
        assertUnimplemented()
    }
    
    public var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    init<A : Animatable>(_ animatable: A) {
        self.value = animatable
        self.vtable = VTable<A>.self
    }
    
    @inline(__always) // 원래 없음
    fileprivate init(vtable: _AnyAnimatableDataVTable.Type, value: Any) {
        self.vtable = vtable
        self.value = value
    }
    
    static var empty: _AnyAnimatableData {
        assertUnimplemented()
    }
    
    func update<A : Animatable>(_ animatable: inout A) {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _AnyAnimatableData : Sendable {
}

@usableFromInline
package class _AnyAnimatableDataVTable {
    class var zero: Any {
        preconditionFailure() // abstract
    }
    
    class func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
        return false
    }
    
    class func add(_ toValue: inout Any, _ from: Any) {
        // nop
    }
    
    class func subtract(_ toValue: inout Any, _ from: Any) {
        // nop
    }
    
    class func negate(_ value: inout Any) {
        // nop
    }
    
    class func scale(_ value: inout Any, by scale: Double) {
        // nop
    }
    
    class func magnitudeSquared(_ value: Any) -> Double {
        return 0
    }
    
    @usableFromInline deinit {}
}

@available(*, unavailable)
extension _AnyAnimatableDataVTable : Sendable {
}

fileprivate final class VTable<A : Animatable> : _AnyAnimatableDataVTable {
    override class var zero: Any {
        return A.AnimatableData.zero
    }
    
    override class func isEqual(_ lhs: Any, _ rhs: Any) -> Bool {
        assertUnimplemented()
    }
    
    override class func add(_ toValue: inout Any, _ from: Any) {
        assertUnimplemented()
    }
    
    override class func subtract(_ toValue: inout Any, _ from: Any) {
        assertUnimplemented()
    }
    
    override class func negate(_ value: inout Any) {
        assertUnimplemented()
    }
    
    override class func scale(_ value: inout Any, by scale: Double) {
        assertUnimplemented()
    }
    
    override class func magnitudeSquared(_ value: Any) -> Double {
        assertUnimplemented()
    }
}

fileprivate final class ZeroVTable : _AnyAnimatableDataVTable {
    override class var zero: Any {
        return ()
    }
}

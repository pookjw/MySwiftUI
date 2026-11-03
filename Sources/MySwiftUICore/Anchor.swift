internal import Spatial

@frozen public struct Anchor<Value> {
    fileprivate let box: AnchorValueBoxBase<Value>
    
    var defaultValue: Value {
        assertUnimplemented()
    }
    
    func `as`<A>(type: A.Type) -> Anchor<A>? {
        assertUnimplemented()
    }
    
    func `in`(_ context: _PositionAwarePlacementContext) -> Value {
        assertUnimplemented()
    }
    
    package func convert(to transform: ViewTransform) -> Value {
        assertUnimplemented()
    }
}

extension Anchor : Sendable where Value : Sendable {}

extension Anchor : Equatable where Value : Equatable {
    public static func == (a: Anchor<Value>, b: Anchor<Value>) -> Bool {
        assertUnimplemented()
    }
}

extension Anchor : Hashable where Value : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

@usableFromInline
class AnchorValueBoxBase<T> {
    var defaultValue: T {
        assertUnimplemented()
    }
    
    func convert(to transform: ViewTransform) -> T {
        assertUnimplemented()
    }
    
    func `as`<A>(type: A.Type) -> AnchorValueBoxBase<A>? {
        assertUnimplemented()
    }
    
    func isEqual(to other: AnchorValueBoxBase<T>) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension AnchorValueBoxBase : @unchecked Sendable where T : Sendable {}

struct Anchor3D<Value> {
    // TODO
    
    func convert(to transform: ViewTransform) -> Value {
        assertUnimplemented()
    }
    
    struct Source {
        // TODO
        
        func prepare(size: Size3D, transform: ViewTransform) -> Anchor3D<Value> {
            assertUnimplemented()
        }
    }
}

extension Anchor3D : Sendable where Value : Sendable {}
extension Anchor3D.Source : Sendable where Value : Sendable {}

extension Anchor3D : Equatable where Value : Equatable {
    static func == (a: Anchor3D<Value>, b: Anchor3D<Value>) -> Bool {
        assertUnimplemented()
    }
}

extension Anchor3D : Hashable where Value : Hashable {
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}


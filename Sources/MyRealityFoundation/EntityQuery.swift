// 7A54867B5174F75ADC33C900CF3D7781

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct EntityQuery : @unchecked Sendable {
    private let _predicate: QueryPredicate<MyRealityFoundation::Entity>
    private var destructor: EntityQuery.Destructor?
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init() {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(where predicate: QueryPredicate<Entity>) {
        assertUnimplemented()
    }
}

extension EntityQuery {
    struct Selector {
        // TODO
    }
    
    @safe fileprivate final class Destructor {
        private var internalQuery: OpaquePointer?
        
        deinit {
            assertUnimplemented()
        }
    }
}
